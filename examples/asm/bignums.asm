60180000  RALO(Lb,24)
62070000  RALO(Ob,7)
54000015  LDLO(L0,21)
54040056  LDLO(L1,86)
54080061  LDLO(L2,97)
540c0073  LDLO(L3,115)
54100001  LDLO(L4,1)
64141328  BALO(L5,L4,202)
54180000  LDLO(L6,0)
541c066c  LDLO(L7,1644)
741c1418  BSET(L7,L5,L6)
641c1328  BALO(L7,L4,202)
54200684  LDLO(L8,1668)
74201c18  BSET(L8,L7,L6)
64201808  BALO(L8,L6,2)
54244e21  LDLO(L9,20001)
5428000e  LDLO(L10,14)
642c2b20  BALO(L11,L10,200)
54280236  LDLO(L10,566)
74282c18  BSET(L10,L11,L6)
5428030e  LDLO(L10,782)
74282c10  BSET(L10,L11,L4)
54300005  LDLO(L12,5)
5434031e  LDLO(L13,798)
54380002  LDLO(L14,2)
74342c38  BSET(L13,L11,L14)
543403a6  LDLO(L13,934)
543c0003  LDLO(L15,3)
74342c3c  BSET(L13,L11,L15)
5434037e  LDLO(L13,894)
54400004  LDLO(L16,4)
74342c40  BSET(L13,L11,L16)
54440396  LDLO(L17,918)
74442c30  BSET(L17,L11,L12)
5444034e  LDLO(L17,846)
54480006  LDLO(L18,6)
74442c48  BSET(L17,L11,L18)
54440007  LDLO(L17,7)
74282c44  BSET(L10,L11,L17)
54280366  LDLO(L10,870)
54440008  LDLO(L17,8)
74282c44  BSET(L10,L11,L17)
54280106  LDLO(L10,262)
54440009  LDLO(L17,9)
74282c44  BSET(L10,L11,L17)
5444000a  LDLO(L17,10)
74342c44  BSET(L13,L11,L17)
54340336  LDLO(L13,822)
5448000b  LDLO(L18,11)
74342c48  BSET(L13,L11,L18)
543401fe  LDLO(L13,510)
5448000c  LDLO(L18,12)
74342c48  BSET(L13,L11,L18)
5434000d  LDLO(L13,13)
74282c34  BSET(L10,L11,L13)
5434078c  LDLO(L13,1932)
5f902c00  MOVE(O4,L11)
48340000  CALL(L13)
5c2f8000  MOVE(L11,O0)
542c0348  LDLO(L11,840)
482c0000  CALL(L11)
5c2f8000  MOVE(L11,O0)
5434016e  LDLO(L13,366)
342c3485  JNE(L11,L13,133)
5c141c00  MOVE(L5,L7)
5c1c1000  MOVE(L7,L4)
542c0348  LDLO(L11,840)
482c0000  CALL(L11)
5c2f8000  MOVE(L11,O0)
54340634  LDLO(L13,1588)
5f900800  MOVE(O4,L2)
5f940c00  MOVE(O5,L3)
5f982c00  MOVE(O6,L11)
48340000  CALL(L13)
5c378000  MOVE(L13,O0)
3034440f  JEQ(L13,L17,15)
04341c10  SUB(L13,L7,L4)
08483444  MUL(L18,L13,L17)
004c4810  ADD(L19,L18,L4)
18502c38  ASR(L20,L11,L14)
04545008  SUB(L21,L20,L2)
00585410  ADD(L22,L21,L4)
705c1418  BGET(L23,L5,L6)
5f901400  MOVE(O4,L5)
5f944c00  MOVE(O5,L19)
5f985800  MOVE(O6,L22)
485c0000  CALL(L23)
5c5f8000  MOVE(L23,O0)
5c1c5c00  MOVE(L7,L23)
43ffffe9  JI(-23)
5c0c1c00  MOVE(L3,L7)
5414069c  LDLO(L5,1692)
5f900800  MOVE(O4,L2)
5f940c00  MOVE(O5,L3)
48140000  CALL(L5)
5c178000  MOVE(L5,O0)
64144320  BALO(L5,L16,200)
541c010e  LDLO(L7,270)
741c1418  BSET(L7,L5,L6)
74281410  BSET(L10,L5,L4)
541c01ee  LDLO(L7,494)
741c1438  BSET(L7,L5,L14)
7428143c  BSET(L10,L5,L15)
541c078c  LDLO(L7,1932)
5f901400  MOVE(O4,L5)
481c0000  CALL(L7)
5c178000  MOVE(L5,O0)
54140a88  LDLO(L5,2696)
5f902000  MOVE(O4,L8)
5f942400  MOVE(O5,L9)
5f980c00  MOVE(O6,L3)
48140000  CALL(L5)
5c0f8000  MOVE(L3,O0)
5c140c00  MOVE(L5,L3)
5c0c2000  MOVE(L3,L8)
6c1c1400  BTAG(L7,L5)
14201c10  ASL(L8,L7,L4)
20242010  OR(L9,L8,L4)
34302446  JNE(L12,L9,70)
70140c18  BGET(L5,L3,L6)
541c069c  LDLO(L7,1692)
5f900800  MOVE(O4,L2)
5f941400  MOVE(O5,L5)
481c0000  CALL(L7)
5c178000  MOVE(L5,O0)
70140c10  BGET(L5,L3,L4)
5c0c1400  MOVE(L3,L5)
6c140c00  BTAG(L5,L3)
141c1410  ASL(L7,L5,L4)
20201c10  OR(L8,L7,L4)
34302006  JNE(L12,L8,6)
540004e8  LDLO(L0,1256)
5f900400  MOVE(O4,L1)
48000000  CALL(L0)
5c038000  MOVE(L0,O0)
50180000  HALT(L6)
70240c18  BGET(L9,L3,L6)
542807d1  LDLO(L10,2001)
38242830  JGE(L9,L10,48)
542c069c  LDLO(L11,1692)
5f900800  MOVE(O4,L2)
5f941000  MOVE(O5,L4)
482c0000  CALL(L11)
5c2b8000  MOVE(L10,O0)
542800c9  LDLO(L10,201)
38242819  JGE(L9,L10,25)
542c069c  LDLO(L11,1692)
5f900800  MOVE(O4,L2)
5f941000  MOVE(O5,L4)
482c0000  CALL(L11)
5c2b8000  MOVE(L10,O0)
3824000e  JGE(L9,L0,14)
5428069c  LDLO(L10,1692)
5f900800  MOVE(O4,L2)
5f941000  MOVE(O5,L4)
48280000  CALL(L10)
5c2b8000  MOVE(L10,O0)
5428069c  LDLO(L10,1692)
5f900800  MOVE(O4,L2)
5f942400  MOVE(O5,L9)
48280000  CALL(L10)
5c2b8000  MOVE(L10,O0)
70280c10  BGET(L10,L3,L4)
5c0c2800  MOVE(L3,L10)
43ffffdb  JI(-37)
5428069c  LDLO(L10,1692)
5f900800  MOVE(O4,L2)
5f942400  MOVE(O5,L9)
48280000  CALL(L10)
43fffff8  JI(-8)
3824000b  JGE(L9,L0,11)
542c069c  LDLO(L11,1692)
5f900800  MOVE(O4,L2)
5f941000  MOVE(O5,L4)
482c0000  CALL(L11)
5c2f8000  MOVE(L11,O0)
542c069c  LDLO(L11,1692)
5f900800  MOVE(O4,L2)
5f942400  MOVE(O5,L9)
482c0000  CALL(L11)
43ffffed  JI(-19)
542c069c  LDLO(L11,1692)
5f900800  MOVE(O4,L2)
5f942400  MOVE(O5,L9)
482c0000  CALL(L11)
43ffffe8  JI(-24)
5f803800  MOVE(O0,L14)
43ffffd4  JI(-44)
70281418  BGET(L10,L5,L6)
642c380c  BALO(L11,L14,3)
74282c18  BSET(L10,L11,L6)
740c2c10  BSET(L3,L11,L4)
70341410  BGET(L13,L5,L4)
5c0c2c00  MOVE(L3,L11)
5c143400  MOVE(L5,L13)
43ffffb0  JI(-80)
54340634  LDLO(L13,1588)
5f900800  MOVE(O4,L2)
5f940c00  MOVE(O5,L3)
5f982c00  MOVE(O6,L11)
48340000  CALL(L13)
5c378000  MOVE(L13,O0)
30344406  JEQ(L13,L17,6)
18342c38  ASR(L13,L11,L14)
042c3408  SUB(L11,L13,L2)
00342c10  ADD(L13,L11,L4)
5c1c3400  MOVE(L7,L13)
43ffff73  JI(-141)
5c0c1000  MOVE(L3,L4)
43ffff8a  JI(-118)
60070000  RALO(Lb,7)
78000000  BREA(L0)
54040001  LDLO(L1,1)
14080004  ASL(L2,L0,L1)
20000804  OR(L0,L2,L1)
540bffff  LDLO(L2,-1)
34080004  JNE(L2,L0,4)
5400000a  LDLO(L0,10)
5f100000  MOVE(I4,L0)
4c000000  RET
54080101  LDLO(L2,257)
1c0c0800  AND(L3,L2,L0)
34040c06  JNE(L1,L3,6)
54040002  LDLO(L1,2)
14080004  ASL(L2,L0,L1)
20000804  OR(L0,L2,L1)
5f100000  MOVE(I4,L0)
4c000000  RET
54080181  LDLO(L2,385)
540c01c1  LDLO(L3,449)
1c100c00  AND(L4,L3,L0)
34081012  JNE(L2,L4,18)
78080000  BREA(L2)
140c0804  ASL(L3,L2,L1)
20080c04  OR(L2,L3,L1)
540c007f  LDLO(L3,127)
1c10080c  AND(L4,L2,L3)
5408003f  LDLO(L2,63)
1c0c0800  AND(L3,L2,L0)
04000c04  SUB(L0,L3,L1)
54080006  LDLO(L2,6)
140c0008  ASL(L3,L0,L2)
00000c04  ADD(L0,L3,L1)
20040010  OR(L1,L0,L4)
54000002  LDLO(L0,2)
14080400  ASL(L2,L1,L0)
20040800  OR(L1,L2,L0)
5f100400  MOVE(I4,L1)
4c000000  RET
540801c1  LDLO(L2,449)
540c01e1  LDLO(L3,481)
1c100c00  AND(L4,L3,L0)
3408101b  JNE(L2,L4,27)
78080000  BREA(L2)
140c0804  ASL(L3,L2,L1)
20080c04  OR(L2,L3,L1)
540c007f  LDLO(L3,127)
1c10080c  AND(L4,L2,L3)
78080000  BREA(L2)
14140804  ASL(L5,L2,L1)
20081404  OR(L2,L5,L1)
1c14080c  AND(L5,L2,L3)
5408001f  LDLO(L2,31)
1c0c0800  AND(L3,L2,L0)
04000c04  SUB(L0,L3,L1)
5408000c  LDLO(L2,12)
140c0008  ASL(L3,L0,L2)
00000c04  ADD(L0,L3,L1)
04081004  SUB(L2,L4,L1)
540c0006  LDLO(L3,6)
1410080c  ASL(L4,L2,L3)
00081004  ADD(L2,L4,L1)
20040814  OR(L1,L2,L5)
20080004  OR(L2,L0,L1)
54000002  LDLO(L0,2)
14040800  ASL(L1,L2,L0)
20080400  OR(L2,L1,L0)
5f100800  MOVE(I4,L2)
4c000000  RET
78080000  BREA(L2)
140c0804  ASL(L3,L2,L1)
20080c04  OR(L2,L3,L1)
540c007f  LDLO(L3,127)
1c10080c  AND(L4,L2,L3)
78080000  BREA(L2)
14140804  ASL(L5,L2,L1)
20081404  OR(L2,L5,L1)
1c14080c  AND(L5,L2,L3)
78080000  BREA(L2)
14180804  ASL(L6,L2,L1)
20081804  OR(L2,L6,L1)
1c18080c  AND(L6,L2,L3)
5408000f  LDLO(L2,15)
1c0c0800  AND(L3,L2,L0)
04000c04  SUB(L0,L3,L1)
54080012  LDLO(L2,18)
140c0008  ASL(L3,L0,L2)
00000c04  ADD(L0,L3,L1)
04081004  SUB(L2,L4,L1)
540c000c  LDLO(L3,12)
1410080c  ASL(L4,L2,L3)
00081004  ADD(L2,L4,L1)
040c1404  SUB(L3,L5,L1)
54100006  LDLO(L4,6)
14140c10  ASL(L5,L3,L4)
000c1404  ADD(L3,L5,L1)
20040c18  OR(L1,L3,L6)
200c0804  OR(L3,L2,L1)
2004000c  OR(L1,L0,L3)
54000002  LDLO(L0,2)
14080400  ASL(L2,L1,L0)
20040800  OR(L1,L2,L0)
5f100400  MOVE(I4,L1)
4c000000  RET
60060000  RALO(Lb,6)
54000002  LDLO(L0,2)
18071000  ASR(L1,I4,L0)
540000ff  LDLO(L0,255)
3c040006  JGT(L1,L0,6)
54000001  LDLO(L0,1)
18080400  ASR(L2,L1,L0)
7c080000  BWRI(L2)
5f100000  MOVE(I4,L0)
4c000000  RET
54000fff  LDLO(L0,4095)
3c040011  JGT(L1,L0,17)
54000181  LDLO(L0,385)
54080001  LDLO(L2,1)
540c0006  LDLO(L3,6)
1810040c  ASR(L4,L1,L3)
200c1008  OR(L3,L4,L2)
2010000c  OR(L4,L0,L3)
18001008  ASR(L0,L4,L2)
7c000000  BWRI(L0)
54000101  LDLO(L0,257)
540c007f  LDLO(L3,127)
1c10040c  AND(L4,L1,L3)
20040010  OR(L1,L0,L4)
18000408  ASR(L0,L1,L2)
7c000000  BWRI(L0)
5f100400  MOVE(I4,L1)
4c000000  RET
5401ffff  LDLO(L0,131071)
3c040018  JGT(L1,L0,24)
540001c1  LDLO(L0,449)
54080001  LDLO(L2,1)
540c000c  LDLO(L3,12)
1810040c  ASR(L4,L1,L3)
200c1008  OR(L3,L4,L2)
2010000c  OR(L4,L0,L3)
18001008  ASR(L0,L4,L2)
7c000000  BWRI(L0)
54000101  LDLO(L0,257)
540c0006  LDLO(L3,6)
1810040c  ASR(L4,L1,L3)
200c1008  OR(L3,L4,L2)
5410007f  LDLO(L4,127)
1c140c10  AND(L5,L3,L4)
200c0014  OR(L3,L0,L5)
18140c08  ASR(L5,L3,L2)
7c140000  BWRI(L5)
1c0c0410  AND(L3,L1,L4)
2004000c  OR(L1,L0,L3)
18000408  ASR(L0,L1,L2)
7c000000  BWRI(L0)
5f100400  MOVE(I4,L1)
4c000000  RET
540001e1  LDLO(L0,481)
54080001  LDLO(L2,1)
540c0012  LDLO(L3,18)
1810040c  ASR(L4,L1,L3)
200c1008  OR(L3,L4,L2)
2010000c  OR(L4,L0,L3)
18001008  ASR(L0,L4,L2)
7c000000  BWRI(L0)
54000101  LDLO(L0,257)
540c000c  LDLO(L3,12)
1810040c  ASR(L4,L1,L3)
200c1008  OR(L3,L4,L2)
5410007f  LDLO(L4,127)
1c140c10  AND(L5,L3,L4)
200c0014  OR(L3,L0,L5)
18140c08  ASR(L5,L3,L2)
7c140000  BWRI(L5)
540c0006  LDLO(L3,6)
1814040c  ASR(L5,L1,L3)
200c1408  OR(L3,L5,L2)
1c140c10  AND(L5,L3,L4)
200c0014  OR(L3,L0,L5)
18140c08  ASR(L5,L3,L2)
7c140000  BWRI(L5)
1c0c0410  AND(L3,L1,L4)
2004000c  OR(L1,L0,L3)
18000408  ASR(L0,L1,L2)
7c000000  BWRI(L0)
5f100400  MOVE(I4,L1)
4c000000  RET
60020000  RALO(Lb,2)
54000002  LDLO(L0,2)
18071800  ASR(L1,I6,L0)
3f100408  JGT(I4,L1,8)
3c071404  JGT(L1,I5,4)
5400001a  LDLO(L0,26)
5f100000  MOVE(I4,L0)
4c000000  RET
5400000a  LDLO(L0,10)
5f100000  MOVE(I4,L0)
4c000000  RET
5400000a  LDLO(L0,10)
5f100000  MOVE(I4,L0)
4c000000  RET
60030000  RALO(Lb,3)
00031718  ADD(L0,I5,I6)
54040001  LDLO(L1,1)
04080004  SUB(L2,L0,L1)
5f100800  MOVE(I4,L2)
4c000000  RET
60030000  RALO(Lb,3)
04031718  SUB(L0,I5,I6)
54040001  LDLO(L1,1)
00080004  ADD(L2,L0,L1)
5f100800  MOVE(I4,L2)
4c000000  RET
60030000  RALO(Lb,3)
62060000  RALO(Ob,6)
54000001  LDLO(L0,1)
3b140012  JGE(I5,L0,18)
5400016e  LDLO(L0,366)
540404e8  LDLO(L1,1256)
5f900000  MOVE(O4,L0)
48040000  CALL(L1)
5c038000  MOVE(L0,O0)
54000001  LDLO(L0,1)
3b140005  JGE(I5,L0,5)
540006fc  LDLO(L0,1788)
5f931000  MOVE(O4,I4)
5f971400  MOVE(O5,I5)
44000000  TCAL(L0)
04040314  SUB(L1,L0,I5)
00080400  ADD(L2,L1,L0)
540006fc  LDLO(L0,1788)
5f931000  MOVE(O4,I4)
5f940800  MOVE(O5,L2)
44000000  TCAL(L0)
54000002  LDLO(L0,2)
5f800000  MOVE(O0,L0)
43fffff1  JI(-15)
60040000  RALO(Lb,4)
62060000  RALO(Ob,6)
5403ffed  LDLO(L0,-19)
3f14001e  JGT(I5,L0,30)
54000013  LDLO(L0,19)
00071400  ADD(L1,I5,L0)
54000001  LDLO(L0,1)
04080400  SUB(L2,L1,L0)
04040800  SUB(L1,L2,L0)
54080014  LDLO(L2,20)
0c0c0408  DIV(L3,L1,L2)
14040c00  ASL(L1,L3,L0)
00080400  ADD(L2,L1,L0)
540006fc  LDLO(L0,1788)
5f931000  MOVE(O4,I4)
5f940800  MOVE(O5,L2)
48000000  CALL(L0)
5c038000  MOVE(L0,O0)
54000001  LDLO(L0,1)
04071400  SUB(L1,I5,L0)
540bffec  LDLO(L2,-20)
100c0408  MOD(L3,L1,L2)
00040c00  ADD(L1,L3,L0)
04080004  SUB(L2,L0,L1)
00040800  ADD(L1,L2,L0)
00080710  ADD(L2,L1,I4)
04040800  SUB(L1,L2,L0)
54000002  LDLO(L0,2)
14080400  ASL(L2,L1,L0)
20040800  OR(L1,L2,L0)
540004e8  LDLO(L0,1256)
5f900400  MOVE(O4,L1)
44000000  TCAL(L0)
54000002  LDLO(L0,2)
5f800000  MOVE(O0,L0)
43ffffee  JI(-18)
600a0000  RALO(Lb,10)
62050000  RALO(Ob,5)
54000001  LDLO(L0,1)
5c040000  MOVE(L1,L0)
680b1000  BSIZ(L2,I4)
140c0800  ASL(L3,L2,L0)
20100c00  OR(L4,L3,L0)
3804100c  JGE(L1,L4,12)
18140400  ASR(L5,L1,L0)
701b1014  BGET(L6,I4,L5)
541c04e8  LDLO(L7,1256)
5f901800  MOVE(O4,L6)
481c0000  CALL(L7)
5c1f8000  MOVE(L7,O0)
541c0003  LDLO(L7,3)
0020041c  ADD(L8,L1,L7)
04242000  SUB(L9,L8,L0)
5c042400  MOVE(L1,L9)
43fffff2  JI(-14)
54000002  LDLO(L0,2)
5f100000  MOVE(I4,L0)
4c000000  RET
60020000  RALO(Lb,2)
62090000  RALO(Ob,9)
54000001  LDLO(L0,1)
5404080c  LDLO(L1,2060)
5f931000  MOVE(O4,I4)
5f971400  MOVE(O5,I5)
5f9b1800  MOVE(O6,I6)
5f9f1c00  MOVE(O7,I7)
5fa00000  MOVE(O8,L0)
44040000  TCAL(L1)
60070000  RALO(Lb,7)
62090000  RALO(Ob,9)
54000005  LDLO(L0,5)
6c071800  BTAG(L1,I6)
54080001  LDLO(L2,1)
140c0408  ASL(L3,L1,L2)
20040c08  OR(L1,L3,L2)
3400040a  JNE(L0,L1,10)
340b2002  JNE(L2,I8,2)
4c000000  RET
54000002  LDLO(L0,2)
6404000c  BALO(L1,L0,3)
54000000  LDLO(L0,0)
77200400  BSET(I8,L1,L0)
77100408  BSET(I4,L1,L2)
5f100400  MOVE(I4,L1)
4c000000  RET
54000000  LDLO(L0,0)
70071800  BGET(L1,I6,L0)
040c0408  SUB(L3,L1,L2)
18071c08  ASR(L1,I7,L2)
08100c04  MUL(L4,L3,L1)
00041008  ADD(L1,L4,L2)
000c0720  ADD(L3,L1,I8)
04040c08  SUB(L1,L3,L2)
040c0408  SUB(L3,L1,L2)
04071408  SUB(L1,I5,L2)
10100c04  MOD(L4,L3,L1)
00141008  ADD(L5,L4,L2)
70131808  BGET(L4,I6,L2)
0c180c04  DIV(L6,L3,L1)
14041808  ASL(L1,L6,L2)
000c0408  ADD(L3,L1,L2)
5404080c  LDLO(L1,2060)
5f931000  MOVE(O4,I4)
5f971400  MOVE(O5,I5)
5f981000  MOVE(O6,L4)
5f9f1c00  MOVE(O7,I7)
5fa00c00  MOVE(O8,L3)
48040000  CALL(L1)
5c078000  MOVE(L1,O0)
540c0002  LDLO(L3,2)
64100c0c  BALO(L4,L3,3)
74141000  BSET(L5,L4,L0)
74041008  BSET(L1,L4,L2)
5f101000  MOVE(I4,L4)
4c000000  RET
60040000  RALO(Lb,4)
62090000  RALO(Ob,9)
54000005  LDLO(L0,5)
6c071800  BTAG(L1,I6)
54080001  LDLO(L2,1)
140c0408  ASL(L3,L1,L2)
20040c08  OR(L1,L3,L2)
34000402  JNE(L0,L1,2)
4c000000  RET
54000000  LDLO(L0,0)
70071800  BGET(L1,I6,L0)
540007e4  LDLO(L0,2020)
5f931000  MOVE(O4,I4)
5f971400  MOVE(O5,I5)
5f9b1c00  MOVE(O6,I7)
5f9c0400  MOVE(O7,L1)
48000000  CALL(L0)
5c038000  MOVE(L0,O0)
70071808  BGET(L1,I6,L2)
540c08c8  LDLO(L3,2248)
5f931000  MOVE(O4,I4)
5f971400  MOVE(O5,I5)
5f980400  MOVE(O6,L1)
5f9f1c00  MOVE(O7,I7)
480c0000  CALL(L3)
5c078000  MOVE(L1,O0)
540c07e4  LDLO(L3,2020)
5f931000  MOVE(O4,I4)
5f971400  MOVE(O5,I5)
5f980400  MOVE(O6,L1)
5f9f1400  MOVE(O7,I5)
480c0000  CALL(L3)
5c078000  MOVE(L1,O0)
540c0968  LDLO(L3,2408)
5f931000  MOVE(O4,I4)
5f971400  MOVE(O5,I5)
5f980000  MOVE(O6,L0)
5f9c0400  MOVE(O7,L1)
5fa00800  MOVE(O8,L2)
440c0000  TCAL(L3)
60080000  RALO(Lb,8)
62090000  RALO(Ob,9)
54000005  LDLO(L0,5)
6c071800  BTAG(L1,I6)
54080001  LDLO(L2,1)
140c0408  ASL(L3,L1,L2)
20040c08  OR(L1,L3,L2)
34000410  JNE(L0,L1,16)
340b2003  JNE(L2,I8,3)
5f131c00  MOVE(I4,I7)
4c000000  RET
54000002  LDLO(L0,2)
6404000c  BALO(L1,L0,3)
54000000  LDLO(L0,0)
77200400  BSET(I8,L1,L0)
77100408  BSET(I4,L1,L2)
54000968  LDLO(L0,2408)
5f931000  MOVE(O4,I4)
5f971400  MOVE(O5,I5)
5f980400  MOVE(O6,L1)
5f9f1c00  MOVE(O7,I7)
5fa00800  MOVE(O8,L2)
44000000  TCAL(L0)
6c071c00  BTAG(L1,I7)
140c0408  ASL(L3,L1,L2)
20040c08  OR(L1,L3,L2)
34000410  JNE(L0,L1,16)
340b2003  JNE(L2,I8,3)
5f131800  MOVE(I4,I6)
4c000000  RET
54000002  LDLO(L0,2)
6404000c  BALO(L1,L0,3)
54000000  LDLO(L0,0)
77200400  BSET(I8,L1,L0)
77100408  BSET(I4,L1,L2)
54000968  LDLO(L0,2408)
5f931000  MOVE(O4,I4)
5f971400  MOVE(O5,I5)
5f9b1800  MOVE(O6,I6)
5f9c0400  MOVE(O7,L1)
5fa00800  MOVE(O8,L2)
44000000  TCAL(L0)
54000000  LDLO(L0,0)
70071800  BGET(L1,I6,L0)
700f1c00  BGET(L3,I7,L0)
00100f20  ADD(L4,L3,I8)
040c1008  SUB(L3,L4,L2)
0010040c  ADD(L4,L1,L3)
04041008  SUB(L1,L4,L2)
040c0408  SUB(L3,L1,L2)
04071408  SUB(L1,I5,L2)
10100c04  MOD(L4,L3,L1)
00141008  ADD(L5,L4,L2)
70131808  BGET(L4,I6,L2)
701b1c08  BGET(L6,I7,L2)
0c1c0c04  DIV(L7,L3,L1)
14041c08  ASL(L1,L7,L2)
000c0408  ADD(L3,L1,L2)
54040968  LDLO(L1,2408)
5f931000  MOVE(O4,I4)
5f971400  MOVE(O5,I5)
5f981000  MOVE(O6,L4)
5f9c1800  MOVE(O7,L6)
5fa00c00  MOVE(O8,L3)
48040000  CALL(L1)
5c078000  MOVE(L1,O0)
540c0002  LDLO(L3,2)
64100c0c  BALO(L4,L3,3)
74141000  BSET(L5,L4,L0)
74041008  BSET(L1,L4,L2)
5f101000  MOVE(I4,L4)
4c000000  RET
60050000  RALO(Lb,5)
62080000  RALO(Ob,8)
54000001  LDLO(L0,1)
34031809  JNE(L0,I6,9)
54040003  LDLO(L1,3)
54080002  LDLO(L2,2)
640c080c  BALO(L3,L2,3)
54080000  LDLO(L2,0)
74040c08  BSET(L1,L3,L2)
77100c00  BSET(I4,L3,L0)
5f100c00  MOVE(I4,L3)
4c000000  RET
54040002  LDLO(L1,2)
6408040c  BALO(L2,L1,3)
54040000  LDLO(L1,0)
77180804  BSET(I6,L2,L1)
54040003  LDLO(L1,3)
77100800  BSET(I4,L2,L0)
040f1804  SUB(L3,I6,L1)
00040c00  ADD(L1,L3,L0)
54000a88  LDLO(L0,2696)
5f931000  MOVE(O4,I4)
5f971400  MOVE(O5,I5)
5f980400  MOVE(O6,L1)
48000000  CALL(L0)
5c038000  MOVE(L0,O0)
540408c8  LDLO(L1,2248)
5f931000  MOVE(O4,I4)
5f971400  MOVE(O5,I5)
5f980800  MOVE(O6,L2)
5f9c0000  MOVE(O7,L0)
44040000  TCAL(L1)
