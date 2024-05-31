# Vivado does not support old UCF syntax
# must use XDC syntax


set_property -dict { PACKAGE_PIN J15 IOSTANDARD LVCMOS33 }   [ get_ports {sign_mag[0]}       ] ;
set_property -dict { PACKAGE_PIN L16 IOSTANDARD LVCMOS33 }   [ get_ports {sign_mag[1]}   ] ;
set_property -dict { PACKAGE_PIN M13 IOSTANDARD LVCMOS33 }   [ get_ports {sign_mag[2]}  ] ;
set_property -dict { PACKAGE_PIN R15 IOSTANDARD LVCMOS33 }   [ get_ports {sign_mag[3]}    ] ;

set_property -dict { PACKAGE_PIN DISP1 IOSTANDARD LVCMOS33 }   [ get_ports {twos_comp}    ] ;





