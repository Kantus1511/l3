package l3

import BitTwiddling.bitsToIntMSBF
import l3.{ SymbolicCPSTreeModule => H }
import l3.{ SymbolicCPSTreeModuleLow => L }
import java.io.PrintWriter

/**
  * Value-representation phase for the CPS language. Translates a tree
  * with high-level values (blocks, integers, booleans, unit) and
  * corresponding primitives to one with low-level values (blocks
  * and integers only) and corresponding primitives.
  *
  * @author Michel Schinz <Michel.Schinz@epfl.ch>
  */

object CPSValueRepresenter extends (H.Tree => L.Tree) {

  private var closureMap : Map[H.Name, L.Name] = Map() // mapping from old names to closure names

  def apply(tree: H.Tree): L.Tree = {
    transform(tree)(Map.empty)
  }

  private def transform(tree: H.Tree)(implicit worker: Map[Symbol, (Symbol, Seq[Symbol])]): L.Tree = tree match {
    case H.LetL(name, CharLit(value), body) =>
      L.LetL(name, (value << 3) | bitsToIntMSBF(1, 1, 0), transform(body))

    case H.LetP(name, L3IntAdd, args, body) =>
      tempLetP(CPSAdd, args) { r =>
        tempLetL(1) { c1 =>
          L.LetP(name, CPSSub, Seq(r, c1), transform(body)) } }

    case H.LetP(name, L3IntSub, args, body) =>
      tempLetP(CPSSub, args) { r =>
        tempLetL(1) { c1 =>
          L.LetP(name, CPSOr, Seq(r, c1), transform(body)) } }

    case H.LetP(name, L3IntDiv, Seq(n1, n2), body) =>
      tempLetL(1) { c1 =>
        tempLetP(CPSSub, Seq(n1, c1)) { n1Rdy =>
          tempLetP(CPSArithShiftR, Seq(n2, c1)) { n2Rdy =>
            tempLetP(CPSDiv, Seq(n1Rdy, n2Rdy)) { r =>
              L.LetP(name, CPSOr, Seq(r, c1), transform(body)) } } } }

    case H.LetP(name, L3IntMul, Seq(n1, n2), body) =>
      tempLetL(1) { c1 =>
        tempLetP(CPSSub, Seq(n1, c1)) { n1Rdy =>
          tempLetP(CPSArithShiftR, Seq(n2, c1)) { n2Rdy =>
            tempLetP(CPSMul, Seq(n1Rdy, n2Rdy)) { r =>
              L.LetP(name, CPSOr, Seq(r, c1), transform(body)) } } } }

    case H.LetP(name, L3IntMod, Seq(n1, n2), body) =>
      tempLetL(1) { c1 =>
        tempLetP(CPSArithShiftR, Seq(n1, c1)) { n1Rdy =>
          tempLetP(CPSArithShiftR, Seq(n2, c1)) { n2Rdy =>
            tempLetP(CPSMod, Seq(n1Rdy, n2Rdy)) { rNShift =>
              tempLetP(CPSArithShiftL, Seq(rNShift, c1)) { r =>
                L.LetP(name, CPSOr, Seq(r, c1), transform(body)) } } } } }

    case H.LetP(name, L3IntArithShiftLeft, Seq(n, s), body) =>
      tempLetL(1) { c1 =>
        tempLetP(CPSSub, Seq(n, c1)) { nRdy =>
          tempLetP(CPSArithShiftR, Seq(s, c1)) { sRdy =>
            tempLetP(CPSArithShiftL, Seq(nRdy, sRdy)) { r =>
              L.LetP(name, CPSOr, Seq(r, c1), transform(body)) } } } }

    case H.LetP(name, L3IntArithShiftRight, Seq(n, s), body) =>
      tempLetL(1) { c1 =>
        tempLetP(CPSArithShiftR, Seq(s, c1)) { sRdy =>
          tempLetP(CPSArithShiftR, Seq(n, sRdy)) { r =>
            L.LetP(name, CPSOr, Seq(r, c1), transform(body)) } } }

    case H.LetP(name, L3IntBitwiseAnd, args, body) =>
      L.LetP(name, CPSAnd, args, transform(body))

    case H.LetP(name, L3IntBitwiseOr, args, body) =>
      L.LetP(name, CPSOr, args, transform(body))

    case H.LetP(name, L3IntBitwiseXOr, args, body) =>
      tempLetL(1) { c1 =>
        tempLetP(CPSXOr, args) { r =>
          L.LetP(name, CPSOr, Seq(r, c1), transform(body)) } }

    case H.LetP(name, L3ByteRead, Nil, body) =>
      tempLetL(1) { c1 =>
        tempLetP(CPSByteRead, Nil) { t1 =>
          tempLetP(CPSArithShiftL, Seq(t1, c1)) { r =>
            L.LetP(name, CPSOr, Seq(r, c1), transform(body)) } } }

    case H.LetP(name, L3ByteWrite, Seq(n), body) =>
      tempLetL(1) { c1 =>
        tempLetP(CPSSub, Seq(n, c1)) { nPreRdy =>
          tempLetP(CPSArithShiftR, Seq(nPreRdy, c1)) { r =>
            L.LetP(name, CPSByteWrite, Seq(r), transform(body)) } } }

    case H.LetP(name, L3IntToChar, Seq(n), body) =>
      tempLetL(2) { c2 =>
        tempLetP(CPSArithShiftL, Seq(n, c2)) { r =>
          L.LetP(name, CPSOr, Seq(r, c2), transform(body)) } }

    case H.LetP(name, L3CharToInt, Seq(n), body) =>
      tempLetL(2) { c2 =>
        L.LetP(name, CPSArithShiftR, Seq(n, c2), transform(body)) }

    case H.LetP(name, L3Id, args, body) =>
      L.LetP(name, CPSId, args, transform(body))

    case H.LetP(name, L3BlockAlloc(tag), Seq(n), body) =>
      tempLetL(1) { c1 =>
        tempLetP(CPSArithShiftR, Seq(n, c1)) { r =>
          L.LetP(name, CPSBlockAlloc(tag), Seq(r), transform(body)) } }

    case H.LetP(name, L3BlockTag, arg, body) =>
      tempLetL(1) { c1 =>
        tempLetP(CPSBlockTag, arg) { read =>
          tempLetP(CPSArithShiftL, Seq(read, c1)) { r =>
            L.LetP(name, CPSOr, Seq(r, c1), transform(body)) } } }

    case H.LetP(name, L3BlockLength, arg, body) =>
      tempLetL(1) { c1 =>
        tempLetP(CPSBlockLength, arg) { len =>
          tempLetP(CPSArithShiftL, Seq(len, c1)) { r =>
            L.LetP(name, CPSOr, Seq(r, c1), transform(body)) } } }

    case H.LetP(name, L3BlockGet, Seq(b, n), body) =>
      tempLetL(1) { c1 =>
        tempLetP(CPSArithShiftR, Seq(n, c1)) { nRdy =>
          L.LetP(name, CPSBlockGet, Seq(b, nRdy), transform(body)) } }

    case H.LetP(name, L3BlockSet, Seq(b, n, v), body) =>
      tempLetL(1) { c1 =>
        tempLetP(CPSArithShiftR, Seq(n, c1)) { nRdy =>
          L.LetP(name, CPSBlockSet, Seq(b, nRdy, v), transform(body)) } }

    case H.If(L3IntP, Seq(a), thenC, elseC) =>
      ifEqLSB(a, Seq(1), thenC, elseC)

    case H.LetC(cnt, body) =>
      L.LetC(cnt.map(x => new L.CntDef(x.name, x.args, transform(x.body))), transform(body))

    case H.AppC(cnt, args) => L.AppC(cnt, args)

    case H.LetL(name, IntLit(v), body) =>
      L.LetL(name, (v << 1) | 1, transform(body))

    case H.LetF(funs, body) =>
      val newfuns = funs map { fun =>
        val H.FunDef(name, rc, args, fbody) = fun
        val fname = Symbol.fresh("newfun")
        val env = Symbol.fresh("env")
        val fargs =  env +: args
        val fv = funFV(fun)
        val (sub, names) = fv.foldRight((Substitution.empty + (name, env), Seq[H.Name]()))((x, y) => {
          val fresh = Symbol.fresh("a")
          (y._1 + (x, fresh), fresh +: y._2)
        })

        (L.FunDef(fname, rc, fargs, fromClosure(fname, names, env, fbody.subst(sub))), fv)
      }

      val fvs = newfuns.map(x => (x._1.name, x._2)).toMap
      val defs = newfuns.map(_._1)

      L.LetF(defs, bolocksAlloc(funs.zip(defs.map(_.name)), fvs, body))


    case H.AppF(name, c, args) =>
      tempLetL(0){c0 =>
        tempLetP(CPSBlockGet, Seq(name, c0)){ f =>
          L.AppF(f, c, name +: args)}}

    case H.Halt(name) =>
      tempLetL(1) { c1 =>
        tempLetP(CPSArithShiftR, Seq(name, c1)) { r =>
          L.Halt(r) } }

    case H.If(L3IntLt, args, ct, cf) => L.If(CPSLt, args, ct, cf)

    case H.If(L3IntLe, args, ct, cf) => L.If(CPSLe, args, ct, cf)

    case H.If(L3IntGe, args, ct, cf) => L.If(CPSGe, args, ct, cf)

    case H.If(L3IntGt, args, ct, cf) => L.If(CPSGt, args, ct, cf)

    case H.If(L3Eq, args, ct, cf) => L.If(CPSEq, args, ct, cf)

    case H.If(L3Ne, args, ct, cf) => L.If(CPSNe, args, ct, cf)

    case H.If(L3CharP, Seq(a), ct, cf) => ifEqLSB(a, Seq(1, 1, 0), ct, cf)
    case H.If(L3BoolP, Seq(a), ct, cf) => ifEqLSB(a, Seq(1, 0, 1, 0), ct, cf)
    case H.If(L3UnitP, Seq(a), ct, cf) => ifEqLSB(a, Seq(0, 0, 1, 0), ct, cf)
    case H.If(L3BlockP, Seq(a), ct, cf) => ifEqLSB(a, Seq(0, 0), ct, cf)

    case H.LetL(name, BooleanLit(false), body) =>
      L.LetL(name, bitsToIntMSBF(1, 0, 1, 0), transform(body))

    case H.LetL(name, BooleanLit(true), body) =>
      L.LetL(name, bitsToIntMSBF(1, 1, 0, 1, 0), transform(body))

    case H.LetL(name, UnitLit, body) =>
      L.LetL(name, bitsToIntMSBF(0, 0, 1, 0), transform(body))

    case H.If(L3IntP, Seq(a), thenC, elseC) =>
      ifEqLSB(a, Seq(1), thenC, elseC)

    case _ => ??? // TODO Handle other cases
  }

  private def bolocksAlloc(fun: Seq[(H.FunDef, L.Name)], freeV: Map[L.Name, Seq[H.Name]],
    letFBody: H.Tree)(implicit
      worker: Map[Symbol, (Symbol, Seq[Symbol])]): L.Tree = {

    def letAlloc(fn: H.Name, wn: L.Name, freeVar: Seq[H.Name],
      cont: L.Tree): L.Tree = {

      def letArgs(freeVars: Seq[H.Name]): L.Tree = {
        freeVars.zipWithIndex.foldRight(cont){
          case ((tn, idx), body) =>
            tempLetL(idx){ index =>
              tempLetP(CPSBlockSet, Seq(fn, index, tn))(ti => body)}
        }
      }

      tempLetL(freeVar.size + 1){ sz =>
        L.LetP(fn, CPSBlockAlloc(202), Seq(sz), letArgs(wn +: freeVar))}
    }
    fun.foldRight(transform(letFBody)){
      case ((fDef, fName), body) =>
        letAlloc(fDef.name, fName, freeV(fName), body)
    }
  }

  private def freeVars(tree : H.Tree) : Seq[H.Name] = {
    def F(tree : H.Tree) : Set[H.Name] = tree match {
      case H.LetL(name, _, e) => F(e) - name
      case H.LetP(name, _, args, e) => (F(e) - name) union args.toSet
      case H.LetC(cnts, e) => F(e) union (cnts.map(contFV).fold(Set())(_ union _))
      case H.LetF(funs, e) => (F(e) union (funs.map(funFV).fold(Set())(_ union _))) -- funs.map(_.name)
      case H.AppC(_, args) => args.toSet
      case H.AppF(funName, _, args) => args.toSet + funName
      case H.If(_, args, _, _) => args.toSet
      case H.Halt(arg) => Set(arg)
    }

    def funFV(f : H.FunDef) : Set[H.Name] = f match {
      case H.FunDef(_, _, args, e) => F(e) &~ args.toSet
    }

    def contFV(c : H.CntDef) : Set[H.Name] = c match {
      case H.CntDef(_, args, e) => F(e) &~ args.toSet
    }

    F(tree).toSeq
  }

  private def funFV(fun : H.FunDef) : Seq[H.Name] = {
    (freeVars(fun.body).toSet -- fun.args).toSeq
  }

  private def fromClosure(fname : L.Name, vars : Seq[H .Name], env : H.Name,
    body : H.Tree)(implicit worker: Map[Symbol, (Symbol, Seq[Symbol])]) : L.Tree = {
    vars.zipWithIndex.foldRight(transform(body))((x, inner) => {
      tempLetL(x._2 + 1)(n => L.LetP(x._1, CPSBlockGet, Seq(env, n), inner))
    })
  }


  // Tree builders

  /**
    * Call body with a fresh name, and wraps its resulting tree in one
    * that binds the fresh name to the given literal value.
    */
  private def tempLetL(v: Int)(body: L.Name => L.Tree): L.Tree = {
    val tempSym = Symbol.fresh("t")
    L.LetL(tempSym, v, body(tempSym))
  }

  /**
    * Call body with a fresh name, and wraps its resulting tree in one
    * that binds the fresh name to the result of applying the given
    * primitive to the given arguments.
    */
  private def tempLetP(p: L.ValuePrimitive, args: Seq[L.Name])
    (body: L.Name => L.Tree): L.Tree = {
    val tempSym = Symbol.fresh("t")
    L.LetP(tempSym, p, args, body(tempSym))
  }

  /**
    * Generate an If tree to check whether the least-significant bits
    * of the value bound to the given name are equal to those passed as
    * argument. The generated If tree will apply continuation tC if it
    * is the case, and eC otherwise. The bits should be ordered with
    * the most-significant one first (e.g. the list (1,1,0) represents
    * the decimal value 6).
    */
  private def ifEqLSB(arg: L.Name, bits: Seq[Int], tC: L.Name, eC: L.Name)
      : L.Tree =
    tempLetL(bitsToIntMSBF(bits map { b => 1 } : _*)) { mask =>
      tempLetP(CPSAnd, Seq(arg, mask)) { masked =>
        tempLetL(bitsToIntMSBF(bits : _*)) { value =>
          L.If(CPSEq, Seq(masked, value), tC, eC) } } }
}
