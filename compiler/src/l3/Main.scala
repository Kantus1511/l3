package l3

import java.nio.file.FileSystems
import fastparse.core.Parsed.{ Success, Failure }
import CL3TreeFormatter._
import CPSTreeFormatter._

object Main extends MainHelper {
  def main(args: Array[String]): Unit = {
    try {
      val basePath = FileSystems.getDefault.getPath(".").toAbsolutePath
      val inFiles = L3FileReader.expandModules(basePath, args)
      val (programText, indexToPos) = L3FileReader.readFiles(basePath, inFiles)

      L3Parser.parse(programText, indexToPos) match {
        case Success(program, _) =>
          val backEnd = (
            CL3NameAnalyzer
              andThen treePrinter("Tree in CL3")
              andThen reference.CL3ToCPSTranslator
              andThen CPSOptimizerHigh
              andThen treePrinter("Tree in CPS")
              andThen passThrough(SymbolicCPSTreeChecker)
              andThen reference.CPSValueRepresenter
              andThen CPSOptimizerLow
              andThen treePrinter("Tree in CPS-low")
              andThen passThrough(SymbolicCPSTreeLowChecker)
              andThen reference.CPSHoister
              andThen (new CPSInterpreterLowWithStats(showStats = true))
          )
          try {
            backEnd(program)
          } catch {
            case L3FatalError(msg) =>
              Console.println(msg)
              sys.exit(1)
          }

        case Failure(lp, index, _) =>
          Console.println(s"${indexToPos(index)}: parse error (expected: $lp)")
          sys.exit(1)
      }
    } catch {
      case e: java.io.FileNotFoundException =>
        Console.println("error: Source file not found: " + e.getMessage())
    }
  }
}

trait MainHelper {
  protected def treePrinter[T](msg: String)(implicit f: Formatter[T]): T => T =
    passThrough { tree =>
      val writer = new java.io.PrintWriter(System.out)
      writer.println(msg)
      f.toDocument(tree).format(80, writer)
      writer.println()
      writer.flush()
    }

  protected def passThrough[T](f: T => Unit): T=>T = { t: T => f(t); t }

  protected def seqPrinter[T](msg: String): Seq[T] => Seq[T] =
    passThrough { program =>
      println(msg)
      for (elem <- program)
        println(elem)
    }
}
