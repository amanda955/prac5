// This file is based on part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: Mult.asm

// Multiplies R1 and R2 and stores the result in R0.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)


// Put your code here.
//inputs are R1, R2
//output R0 = R1*R2

//R0 = 0 
@R0
M=0

//loading R2 into counter
@R2
D=M
@counter
M=D

(LOOP)
  @counter
  D=M
  @END
  D;JEQ  //loop ends if counter == 0
  
  //R0 = R0 + R1
  @R1
  D=M
  @R0
  M=M+D
  
  //counter = counter -1
  @counter
  M=M-1
  
  @LOOP
  0;JMP

(END)
@END
0;JMP


