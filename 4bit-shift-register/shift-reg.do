# waveforms
add wave /shift_reg/*
add wave /shift_reg/q

# test variables
force /shift_reg/clk 0 0, 1 10 -r 20

force /shift_reg/clr 1
run 20
force /shift_reg/clr 0

force /shift_reg/data_in 1
run 20
force /shift_reg/data_in 0

# normal operation using clock
force /shift_reg/clr 0
force /shift_reg/data_in 0
run 20
force /shift_reg/data_in 1
run 20
force /shift_reg/data_in 0
run 20
force /shift_reg/data_in 1
run 20

# asynchronous clear and set during clock cycles
force /shift_reg/clr 1
run 20
force /shift_reg/clr 0

force /shift_reg/set 1
run 20
force /shift_reg/set 0
