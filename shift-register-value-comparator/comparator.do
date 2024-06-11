
  
add wave clk
add wave reset
add wave din
add wave sel
add wave max_out
add wave min_out
add wave reg_out


force clk 0 0, 1 10 -r 20

force reset 1
run 20


force reset 0
force din 0000
force sel 00
run 20

force reset 0
force din 0001
force sel 00
run 20

force reset 0
force din 0010
force sel 00
run 20

force reset 0
force din 0011
force sel 00
run 20

force reset 0
force din 0100
force sel 00
run 20

force reset 0
force din 0101
force sel 00
run 20

force reset 0
force din 0110
force sel 00
run 20

force reset 0
force din 0111
force sel 00
run 20

force reset 0
force din 1000
force sel 00
run 20

force reset 0
force din 1001
force sel 00
run 20

force reset 0
force din 1010
force sel 00
run 20

force reset 0
force din 1011
force sel 00
run 20

force reset 0
force din 1100
force sel 00
run 20

force reset 0
force din 1101
force sel 01
run 20

force reset 0
force din 1110
force sel 10
run 20

force reset 0
force din 1111
force sel 11
run 20


force reset 1
run 20
force reset 0

force din 0001
run 20

