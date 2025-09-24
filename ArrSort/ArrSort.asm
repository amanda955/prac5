// Sorts the array of length R2 whose first element is at RAM[R1] in ascending order in place. Sets R0 to True (-1) when complete.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
@R1
D=M
@BASE
M=D        //BASE = R1

@R2
D=M
@LEN
M=D        //LEN = R2

@0
D=A
@I
M=D        //I = 0   

//outer loop
(OUTER)
    @I
    D=M
    @LEN
    D=D-M
    @FINISH
    D;JGE   //if I >= LEN - stop

    @0
    D=A
    @J
    M=D     //J = 0

//inner loop
(INNER)
    @J
    D=M
    @LEN
    D=D-M
    @NEXT_OUTER
    D;JGE    //exit the inner loop if J >= LEN

    //check if J >= LEN - I - 1
    @J
    D=M
    @LEN
    D=M-D
    @I
    D=D-M
    @NEXT_OUTER
    D;JLE   //go outer if J >= LEN - I - 1

    @J
    D=M
    @BASE
    D=D+M
    @ADDRJ
    M=D

    @ADDRJ
    A=M
    D=M
    @VALJ
    M=D      //VALJ = arr[j]

    @ADDRJ
    D=M
    D=D+1
    @ADDRNEXT
    M=D

    @ADDRNEXT
    A=M
    D=M
    @VALNEXT
    M=D      //VALNEXT = arr[j+1]

    @VALJ
    D=M
    @VALNEXT
    D=D-M
    @NOSWAP
    D;JLE    //dont swap if arr[j] <= arr[j+1]

    @VALJ
    D=M
    @ADDRNEXT
    A=M
    M=D

    @VALNEXT
    D=M
    @ADDRJ
    A=M
    M=D

(NOSWAP)
    // j++
    @J
    M=M+1
    @INNER
    0;JMP

(NEXT_OUTER)
    @I
    M=M+1
    @OUTER
    0;JMP

(FINISH)
    @R0
    M=-1      //True (-1)
    @FINISH
    0;JMP
