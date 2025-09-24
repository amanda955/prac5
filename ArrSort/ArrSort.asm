// Sorts the array of length R2 whose first element is at RAM[R1] in ascending order in place. Sets R0 to True (-1) when complete.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
@R1
D=M
@BASE
M=D         

@R2
D=M
@LEN
M=D        

@0
D=A
@I
M=D        

//skip sorting if LEN <= 1
@LEN
D=M
@FINISH
D;JLE

//outer loop
(OUTER)
    @I
    D=M
    @LEN
    D=D-M
    @FINISH
    D;JGE     //stop sorting if I >= LEN

    //Starting inner loop at j = 0
    @0
    D=A
    @J
    M=D

//inner loop
(INNER)
    @J
    D=M
    @LEN
    D=D-M
    @NEXT_OUTER
    D;JGE     //stop inner loop if j >= LEN

    @J
    D=M
    @LEN
    D=M-D
    @I
    D=D-M
    @NEXT_OUTER
    D;JLE

    //Loading arr[j]
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
    M=D       //VALJ = arr[j]


    //Loading arr[j+1]
    @ADDRJ
    D=M
    D=D+1
    @ADDRNEXT
    M=D       

    @ADDRNEXT
    A=M
    D=M
    @VALNEXT
    M=D         //VALNEXT = arr[j+1]


    //Comparing arr[j] and arr[j+1]
    @VALJ
    D=M
    @VALNEXT
    D=D-M
    @NOSWAP
    D;JLE       //skip swap if arr[j] <= arr[j+1]

    @VALJ
    D=M
    @ADDRNEXT
    A=M
    M=D       //arr[j+1] = VALJ

    @VALNEXT
    D=M
    @ADDRJ
    A=M
    M=D        //arr[j] = VALNEXT


(NOSWAP)
//Move j forward (j++)
    @J
    M=M+1
    @INNER
    0;JMP

//incrementing the outer loop 
(NEXT_OUTER)
    @I
    M=M+1
    @OUTER
    0;JMP

(FINISH)
    @R0
    M=-1        //True
    @FINISH
    0;JMP       
