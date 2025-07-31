set_property -dict {PACKAGE_PIN K17 IOSTANDARD LVCMOS33} [get_ports {clk}];
create_clock -period 8.000 -name sys_clk_pin -waveform {0 4} -add [get_ports {clk}];

set_property -dict {PACKAGE_PIN M14 IOSTANDARD LVCMOS33} [get_ports {ld[0]}];
set_property -dict {PACKAGE_PIN M15 IOSTANDARD LVCMOS33} [get_ports {ld[1]}];
set_property -dict {PACKAGE_PIN G14 IOSTANDARD LVCMOS33} [get_ports {ld[2]}];
set_property -dict {PACKAGE_PIN D18 IOSTANDARD LVCMOS33} [get_ports {ld[3]}];
set_property -dict {PACKAGE_PIN K18 IOSTANDARD LVCMOS33} [get_ports {btn0}];
