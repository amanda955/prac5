load Mult.asm,
output-file Mult03.out,
compare-to Mult03.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2;

set PC 0,
set RAM[0] 0,  // Set R0
set RAM[1] 100,  // Set R1
set RAM[2] 200;  // Set R2
repeat 5000 {
  ticktock;    // Run for 5000 clock cycles
}
set RAM[1] 100,  // Restore arguments in case program used them
set RAM[2] 200,
output;        // Output to file
