// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// The color that the last change involved 0 for white, 1 for black
@LASTCHANGED
M=0

@OFFSET
M=0


(LOOP)
//address of keyboard
@24576
D=M
@BLACKEN
//if key pressed blacken rows
D;JGT
@WHITEN
//otherwise whiten
0;JMP

(BLACKEN)
//if last changed was black continue, otherwise switch color
@LASTCHANGED
D=M
@BLACKTOBLACK
D;JGT
@WHITETOBLACK
0;JMP

(WHITEN)
@LASTCHANGED
D=M
@BLACKTOWHITE
D;JGT
@WHITETOWHITE
0;JMP

(BLACKTOBLACK)
//continue with next pixel if any left

//Question: how do I generate the register to blacken
//so that I can take the start address and the offset
//and overwrite the value under the resulting memory address
@OFFSET
D=M
@256
D=A-D
@BLACKFILL
D;JGT
@LOOP
0;JMP

(WHITETOBLACK)
@OFFSET
M=0
@BLACKFILL
D;JGT

(BLACKFILL)
@OFFSET
D=M
@16384
D=A+D
A=D
M=-1
@OFFSET
M=M+1
@LASTCHANGED
M=1
@LOOP
0;JMP

(WHITETOWHITE)
@OFFSET
D=M
@256
D=A-D
@WHITEFILL
D;JGT
@LOOP
0;JMP

(BLACKTOWHITE)
@OFFSET
M=0
@WHITEFILL
D;JGT

(WHITEFILL)
@OFFSET
D=M
@16384
D=A+D
A=D
M=0
@OFFSET
M=M+1
@LASTCHANGED
M=0
@LOOP
0;JMP




