# waveforms
add wave clk
add wave din1
add wave din2
add wave load
add wave swap

add wave q1
add wave q2

# test variables
force clk 0 0, 1 10 -r 20

force din1 0011
force din2 1100
force load 0
force swap 0
run 20

force din1 0011
force din2 1100
force load 1
force swap 0
run 20

force din1 0011
force din2 1100
force load 0
force swap 0
run 20

force din1 0011
force din2 1100
force load 0
force swap 1
run 20

force din1 1111
force din2 0001
force load 0
force swap 0
run 20

force din1 1111
force din2 0001
force load 1
force swap 1
run 20

force din1 1111
force din2 0001
force load 0
force swap 0
run 20







