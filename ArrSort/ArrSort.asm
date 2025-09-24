// Sorts the array of length R2 whose first element is at RAM[R1] in ascending order in place. Sets R0 to True (-1) when complete.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
    @R1
    D=M
    @base
    M=D
    
    @R2
    D=M
    @len
    M=D
  
    @0
    D=A
    @i
    M=D

(OUTER_LOOP)
    @i
    D=M
    @len
    D=D-M
    @DONE
    S;JGE

  //inner loop where j = 0
    @0
    D=A
    @j
    M=D

(INNER_LOOP)
    @j
    D=M
    @len
    D=D-M
    @INC_OUTER
    D;JGE

  //loading arr[j] into D
    @j
    D=M
    D=D+1
    @base
    A=M+D
    D=M
    @valnext
    M=D         //valnext = arr[j+1]

    //Compare valj and valnext
    @valj
    D=M
    @valnext
    D=D-M
    @NO_SWAP
    D;JLE        //there is no swap happen if valj <= valnext 

    //Swap arr[j] and arr[j+1]
    @valj
    D=M
    @j
    A=M
    @base
    A=M+D
    M=D         //arr[j+1] = valj

    @valnext
    D=M
    @j
    D=M
    @base
    A=M+D
    M=D          //arr[j] = valnext

(NO_SWAP)
    // j++
    @j
    M=M+1
    @INNER_LOOP
    0;JMP

(INC_OUTER)
    @i
    M=M+1
    @OUTER_LOOP
    0;JMP

(DONE)
    @R0
    M=-1         //True (-1)
(END)
    0;JMP

