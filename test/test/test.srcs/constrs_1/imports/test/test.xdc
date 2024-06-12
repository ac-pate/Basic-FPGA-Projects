

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk];

# regular switch on the board as the clock input
set_property -dict { PACKAGE_PIN M17 IOSTANDARD LVCMOS33 } [get_ports {clk}];

set_property -dict { PACKAGE_PIN V10 IOSTANDARD LVCMOS33 } [get_ports {load}];
set_property -dict { PACKAGE_PIN U11  IOSTANDARD LVCMOS33 } [get_ports {swap}];

# dta input (din1) signals
set_property -dict { PACKAGE_PIN J15 IOSTANDARD LVCMOS33 } [get_ports {din1[0]}];
set_property -dict { PACKAGE_PIN L16 IOSTANDARD LVCMOS33 } [get_ports {din1[1]}];
set_property -dict { PACKAGE_PIN M13 IOSTANDARD LVCMOS33 } [get_ports {din1[2]}];
set_property -dict { PACKAGE_PIN R15 IOSTANDARD LVCMOS33 } [get_ports {din1[3]}];

# data input (din2) signals
set_property -dict { PACKAGE_PIN R17 IOSTANDARD LVCMOS33 } [get_ports {din2[0]}];
set_property -dict { PACKAGE_PIN T18 IOSTANDARD LVCMOS33 } [get_ports {din2[1]}];
set_property -dict { PACKAGE_PIN U18 IOSTANDARD LVCMOS33 } [get_ports {din2[2]}];
set_property -dict { PACKAGE_PIN R13 IOSTANDARD LVCMOS33 } [get_ports {din2[3]}];


# output (q1) signals
set_property -dict { PACKAGE_PIN H17 IOSTANDARD LVCMOS33 } [get_ports {q1[0]}];
set_property -dict { PACKAGE_PIN K15 IOSTANDARD LVCMOS33 } [get_ports {q1[1]}];
set_property -dict { PACKAGE_PIN J13 IOSTANDARD LVCMOS33 } [get_ports {q1[2]}];
set_property -dict { PACKAGE_PIN N14 IOSTANDARD LVCMOS33 } [get_ports {q1[3]}];

# output (q2) signals
set_property -dict { PACKAGE_PIN R18 IOSTANDARD LVCMOS33 } [get_ports {q2[0]}];
set_property -dict { PACKAGE_PIN V17 IOSTANDARD LVCMOS33 } [get_ports {q2[1]}];
set_property -dict { PACKAGE_PIN U17 IOSTANDARD LVCMOS33 } [get_ports {q2[2]}];
set_property -dict { PACKAGE_PIN u16 IOSTANDARD LVCMOS33 } [get_ports {q2[3]}];


