# Vivado XDC Constraints File for lab4

# Set the property to allow use of non-dedicated routing resources for clock input
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk]

# Use a regular switch on the board as the clock input
set_property -dict { PACKAGE_PIN V10 IOSTANDARD LVCMOS33 } [get_ports {clk}]

# Reset signal
set_property -dict { PACKAGE_PIN U11  IOSTANDARD LVCMOS33 } [get_ports {reset}]

# Data input (din) signals
set_property -dict { PACKAGE_PIN J15 IOSTANDARD LVCMOS33 } [get_ports {max_occupancy[0]}]
set_property -dict { PACKAGE_PIN L16 IOSTANDARD LVCMOS33 } [get_ports {max_occupancy[1]}]
set_property -dict { PACKAGE_PIN M13 IOSTANDARD LVCMOS33 } [get_ports {max_occupancy[2]}]
set_property -dict { PACKAGE_PIN R15 IOSTANDARD LVCMOS33 } [get_ports {max_occupancy[3]}]

# Select input (sel) signals
set_property -dict { PACKAGE_PIN R17 IOSTANDARD LVCMOS33 } [get_ports {X}]
set_property -dict { PACKAGE_PIN T18 IOSTANDARD LVCMOS33 } [get_ports {Y}]


# Register output (reg_out) signalsX
set_property -dict { PACKAGE_PIN H17 IOSTANDARD LVCMOS33 } [get_ports {max_occupancy[4]}]
set_property -dict { PACKAGE_PIN K15 IOSTANDARD LVCMOS33 } [get_ports {max_occupancy[5]}]
set_property -dict { PACKAGE_PIN J13 IOSTANDARD LVCMOS33 } [get_ports {Z}]

