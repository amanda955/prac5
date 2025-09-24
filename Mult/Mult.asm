// This file is based on part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: Mult.asm

// Multiplies R1 and R2 and stores the result in R0.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)


// Put your code here.
@R0
M=0

@R1
D=M
@AVAL
M=D         //AVAL = R1

@R2
D=M
@BVAL
M=D  

@0
D=A
@SIGN
M=D 

@AVAL
D=M
@CHECK_B
D;JGE 

@SIGN
M=M+1         
@AVAL
M=-M 

@BVAL
D=M
@SET_COUNTER
D;JGE 

@SIGN
M=M+1         
@BVAL
M=-M           

(SET_COUNTER)
@BVAL
D=M
@COUNT
M=D

(LOOP)
    @COUNT
    D=M
    @END
    D;JEQ      

    //result is  result + AVAL
    @AVAL
    D=M
    @R0
    M=M+D

    //COUNT = COUNT - 1
    @COUNT
    M=M-1

    @LOOP
    0;JMP

(END)
@SIGN
D=M
@POSITIVE
D;JEQ

@R0
M=-M

(POSITIVE)
@END
0;JMP
