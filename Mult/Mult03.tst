load Mult.asm,
output-file Mult06.out,
compare-to Mult06.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2;

set PC 0,
set RAM[0] 0,  // Set R0
set RAM[1] 200,  // Set R1
set RAM[2] 150;  // Set R2
repeat 2000 {
  ticktock;    // Run for 200 clock cycles
}
set RAM[1] 200,  // Restore arguments in case program used them
set RAM[2] 150,
output;        // Output to file
