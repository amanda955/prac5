// Finds the smallest element in the array of length R2 whose first element is at RAM[R1] and stores the result in R0.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)


// Put your code here.
//loading the base address - pointer
@R1
D=M
@ptr
M=D   //ptr = base

//loading the length into the counter
@R2
D=M
@count
M=D     //count=length

//loading the firsth element as R0
@ptr
A=M
D=M
@R0
M=D

@count
M=M-1

//pointer to the next element
@ptr
M=M+1

(LOOP)
    @count
    D=M
    @END
    D;JEQ
    
    @ptr
    A=M
    D=M
    
    //comparing with the current min 
    @R0
    D=D-M
    @SKIP
    D;JGE    //skip the update if the current >= min
    
    @ptr
    A=M
    D=M
    @R0
    M=D

(SKIP)
    @ptr
    M=M+1

    @count
    M=M-1

    @LOOP
    0;JMP
    
    (END)
    @END
    0;JMP




