load Abs.asm,
output-file Abs01.out,
compare-to Abs01.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2;

set RAM[1] 10;
run;
output;
