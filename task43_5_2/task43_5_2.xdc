set_property -dict {PACKAGE_PIN K17 IOSTANDARD LVCMOS33} [get_ports {clk}];
create_clock -add -name sys_clk_pin -period 8.000 -waveform {0 4} [get_ports {clk}];

set_property -dict {PACKAGE_PIN M14 IOSTANDARD LVCMOS33} [get_ports {ld[0]}];
set_property -dict {PACKAGE_PIN M15 IOSTANDARD LVCMOS33} [get_ports {ld[1]}];
set_property -dict {PACKAGE_PIN G14 IOSTANDARD LVCMOS33} [get_ports {ld[2]}];
set_property -dict {PACKAGE_PIN D18 IOSTANDARD LVCMOS33} [get_ports {ld[3]}];

set_property -dict {PACKAGE_PIN G15 IOSTANDARD LVCMOS33} [get_ports {sw[0]}];
set_property -dict {PACKAGE_PIN P15 IOSTANDARD LVCMOS33} [get_ports {sw[1]}];
set_property -dict {PACKAGE_PIN W13 IOSTANDARD LVCMOS33} [get_ports {sw[2]}]; 
set_property -dict {PACKAGE_PIN T16 IOSTANDARD LVCMOS33} [get_ports {sw[3]}]; 

set_property -dict {PACKAGE_PIN K18 IOSTANDARD LVCMOS33} [get_ports {push}]; #BTN0
set_property -dict {PACKAGE_PIN P16 IOSTANDARD LVCMOS33} [get_ports {add}];  #BTN1

## RGB LED 5
set_property -dict {PACKAGE_PIN Y12 IOSTANDARD LVCMOS33} [get_ports {ld_empty}];#T5 green #Y12: blue
#set_property -dict {PACKAGE_PIN Y12 IOSTANDARD LVCMOS33} [get_ports {ld_ready}];#T5 green #Y12: blue
#set_property -dict {PACKAGE_PIN T5 IOSTANDARD LVCMOS33} [get_ports {ld_op}];
set_property -dict {PACKAGE_PIN Y11 IOSTANDARD LVCMOS33} [get_ports {ld_full}];

##RGB LED 6
#set_property -dict { PACKAGE_PIN V16   IOSTANDARD LVCMOS33 } [get_ports { ld_overflow }]; #IO_L18P_T2_34 Sch=led6_r
#set_property -dict { PACKAGE_PIN F17   IOSTANDARD LVCMOS33 } [get_ports { led6_g }]; #IO_L6N_T0_VREF_35 Sch=led6_g
#set_property -dict { PACKAGE_PIN M17   IOSTANDARD LVCMOS33 } [get_ports { led6_b }]; #IO_L8P_T1_AD10P_35 Sch=led6_b
#

### 7seg LED

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

