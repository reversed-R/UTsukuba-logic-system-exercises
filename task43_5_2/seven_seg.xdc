#zybo-z7
set_property -dict {PACKAGE_PIN K18 IOSTANDARD LVCMOS33} [get_ports {sel_in}]; #BTN0

set_property -dict {PACKAGE_PIN G15 IOSTANDARD LVCMOS33} [get_ports {din[0]}];#sw0
set_property -dict {PACKAGE_PIN P15 IOSTANDARD LVCMOS33} [get_ports {din[1]}];#sw1
set_property -dict { PACKAGE_PIN W13 IOSTANDARD LVCMOS33 } [get_ports {din[2]}]; #sw2
set_property -dict { PACKAGE_PIN T16 IOSTANDARD LVCMOS33 } [get_ports {din[3]}]; #sw3

##Pmod Header JB (Zybo Z7-20 only)
# upper side
set_property -dict { PACKAGE_PIN V8    IOSTANDARD LVCMOS33     } [get_ports { seg[0] }]; #segA
set_property -dict { PACKAGE_PIN W8    IOSTANDARD LVCMOS33     } [get_ports { seg[1] }];#segB
set_property -dict { PACKAGE_PIN U7    IOSTANDARD LVCMOS33     } [get_ports { seg[2] }];#segC
set_property -dict { PACKAGE_PIN V7    IOSTANDARD LVCMOS33     } [get_ports { seg[3] }]; #segD
          
##Pmod Header JC                                                                                                                  
# upper side
set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS33     } [get_ports { seg[4] }]; #segE
set_property -dict { PACKAGE_PIN W15   IOSTANDARD LVCMOS33     } [get_ports { seg[5] }]; #segF
set_property -dict { PACKAGE_PIN T11   IOSTANDARD LVCMOS33     } [get_ports { seg[6] }]; #segG
set_property -dict { PACKAGE_PIN T10   IOSTANDARD LVCMOS33     } [get_ports { sel_out }]; #CAT

