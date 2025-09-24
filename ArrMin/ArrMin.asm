// Finds the smallest element in the array of length R2 whose first element is at RAM[R1] and stores the result in R0.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)


// Put your code here.
//loading the base address 
@R1
D=M
@PTR
M=D  

//loading the length into the counter
@R2
D=M
@COUNT
M=D     //count=length

@COUNT
D=M
@NO_ELEMENTS
D;JLE

//loading the firsth element as R0
@PTR
A=M
D=M
@R0
M=D

@COUNT
M=M-1
@PTR
M=M+1

(LOOP)
    @COUNT
    D=M
    @FINISH
    D;JEQ
    
    @PTR
    A=M
    D=M
    
    //comparing with the current min 
    @R0
    D=D-M
    @SKIP
    D;JGE    //skip the update if the current >= min
    
    @PTR
    A=M
    D=M
    @R0
    M=D

(SKIP)
    @PTR
    M=M+1

    @COUNT
    M=M-1

    @LOOP
    0;JMP
    
(FINISH)
    @RO
    M=M
    @HALT
    0;JMP

(NO_ELEMENTS)
    @R0
    M=0
    @HALT
    0;JMP
(HALT)
    @HALT
    0;JMP




