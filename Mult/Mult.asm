// This file is based on part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: Mult.asm

// Multiplies R1 and R2 and stores the result in R0.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)


// Put your code here.
@R0
M=0              //result = 0


@R1
D=M
@A
M=D              //A = R1
@R2
D=M
@B
M=D            //B = R2

//Recording sign flags and make A = |R1| and B = |R2|
@0
D=A
@SA
M=D                //SA = 0 (R1 non-negative by default)
@A
D=M
@A_NONNEG
D;JGE             //if A >= 0 skip
@1
D=A
@SA
M=D                //SA = 1 (R1 was negative)
@A
M=-M              //A = |A|
(A_NONNEG)

@0
D=A
@SB
M=D                //SB = 0 
@B
D=M
@B_NONNEG
D;JGE               //skip if B >= 0 
@1
D=A
@SB
M=D                //SB = 1 (R2 was negative)
@B
M=-M              //B = |B|
(B_NONNEG)

@SA
D=M
@SB
D=D+M
@NEG
M=D                

// Choose smaller abs as COUNT , larger as ADD 
@A
D=M
@B
D=D-M              //D = A - B
@A_LE_B
D;JLE              //use A as COUNT if A <= B

//Case A > B: COUNT=B, ADD=A
@B
D=M
@COUNT
M=D
@A
D=M
@ADD
M=D
@LOOP_START
0;JMP

//Case A <= B: COUNT=A, ADD=B
(A_LE_B)
@A
D=M
@COUNT
M=D
@B
D=M
@ADD
M=D

//Main loop
(LOOP_START)
@COUNT
D=M
@APPLY_SIGN
D;JEQ              //Stop adding if COUNT==0

@ADD
D=M
@R0
M=M+D             //R0 += ADD

@COUNT
M=M-1              //COUNT
@LOOP_START
0;JMP

(APPLY_SIGN)
@NEG
D=M
D=D-1              //D = NEG - 1
@MAKE_NEG
D;JEQ            
@FIN
0;JMP

(MAKE_NEG)
@R0
M=-M
@FIN
0;JMP

(FIN)
@FIN
0;JMP
