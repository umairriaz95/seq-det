### If you want to run this tcl script in dc_shell, run as: dc_shell -f synth_tcl_file.tcl

# Standard cell library settings
set link_library /eda/synopsys/2020-21/RHELx86/SYN_2020.09-SP2/libraries/syn/lsi_10k.db
set target_library /eda/synopsys/2020-21/RHELx86/SYN_2020.09-SP2/libraries/syn/lsi_10k.db
set symbol_library ""

# read, analyze and elaborate the rtl code
read_file -format sverilog {/home/uriaz/misc/synop_proj/prac.sv}
analyze -library WORK -format sverilog {/home/uriaz/misc/synop_proj/prac.sv}
elaborate prac -architecture sverilog -library WORK

# provide constraints
create_clock -name "clk" -period 10 -waveform {5 10}
set_max_area 5000
set_max_fanout 10 prac
set_max_transition 10 prac

# compile the rtl
compile -exact_map

# report generation
file mkdir report_2
write -hierarchy -format verilog -output /home/uriaz/misc/synop_proj/report_2/prac_gtlvl.v
write_sdc -nosplit -version 2.0 /home/uriaz/misc/synop_proj/report_2/prac.sdc
report_area -hierarchy > /home/uriaz/misc/synop_proj/report_2/prac.area
report_timing > /home/uriaz/misc/synop_proj/report_2/prac.timing
report_power > /home/uriaz/misc/synop_proj/report_2/prac.power

# start gui
gui_start
