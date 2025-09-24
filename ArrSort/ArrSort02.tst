load ArrSort.asm,
output-file ArrSort00.out,
compare-to ArrSort00.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2 RAM[30]%D2.6.2 RAM[31]%D2.6.2 RAM[32]%D2.6.2;

set PC 0,
set RAM[0]  0,  // Set R0
set RAM[1]  30, // Set R1
set RAM[2]  3,  // Set R2
set RAM[20] 9,  // Set Arr[0]
set RAM[21] 7,  // Set Arr[1]
set RAM[22] 8,  // Set Arr[2]
repeat 600 {
  ticktock;    // Run for 600 clock cycles
}
set RAM[1] 30,  // Restore arguments in case program used them
set RAM[2] 3,
output;        // Output to file
