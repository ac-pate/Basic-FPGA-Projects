# signals to the waveform viewer
add wave D
add wave clk
add wave clr
add wave set
add wave Q

#  test vectors
force clk 0 0, 1 10 -r 20

force clr 1
run 20
force clr 0

force set 1
run 20
force set 0

force D 0
run 20

force D 1
run 20

# Normal operation: Toggle D with clock
force clr 0
force set 0
force D 0
run 20

force D 1
run 20

force D 0
run 20

force D 1
run 20

# Asynchronous clear and set during clock cycles
force clr 1
run 20
force clr 0

force set 1
run 20
force set 0
