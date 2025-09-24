// Calculates the absolute value of R1 and stores the result in R0.
// (R0, R1 refer to RAM[0], and RAM[1], respectively.)


// Put your code here.
    @R1
    D=M        //D = R1

    @POSITIVE
    D;JGE   

    //take two's complement is the number is negative
    @R1
    D=M        //D = R1
    D=-D       //D = -R1
    @R0
    M=D        //R0 = abs(R1)
    @END
    0;JMP

(POSITIVE)
    @R1
    D=M        //D = R1
    @R0
    M=D        //R0 = R1
    @END
    0;JMP

(END)
    @END
    0;JMP




