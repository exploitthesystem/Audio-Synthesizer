# Optimization settings
# The period has to be changed to see if the design can meet the timing constraint
set period 100

#  Define the names to be used by the script
set design synth_top
set BASE_DIR	 [pwd]
set RPT_DIR          "${BASE_DIR}/RPT"
set HDL_DIR 	 "${BASE_DIR}/../../Audio-Synthesizer"
set SDF_DIR 	 "${BASE_DIR}/SDF"
set SDC_DIR 	 "${BASE_DIR}/SDC"
set DDC_DIR 	 "${BASE_DIR}/DDC"

#  Synthesis settings
set report_significant_digits 3
set DB_FORMAT ddc
set ELAB_POSTFIX "_elab"
set MAPPED_POSTFIX "_mapped"
set COMPILE_MAP_EFFORT medium
set COMPILE_AREA_EFFORT medium

# Pulsewidth is defined as half the period
set pulsewidth [expr {$period/2}]


#  dependency rules
set HDL_FILES [list \
$HDL_DIR/reg_file.v \
$HDL_DIR/core.v \
$HDL_DIR/counter.v \
$HDL_DIR/pwm.v \
$HDL_DIR/I2C_states.v \
$HDL_DIR/i2c_controller.v \
$HDL_DIR/synth_top.v]

#  Start from fresh state
remove_design -designs

#  Analyze the Verilog sources
puts "-i- Analyze Verilog sources"
analyze -format verilog $HDL_FILES

#  Elaborate the design
puts "-i- Elaborate design"
elaborate ${design} -update -library DEFAULT

#  Save the elaborated design
puts "-i- Save elaborated design"
write -hierarchy -format ddc -output ${DDC_DIR}/${design}_elab.ddc

#  Link the design
link

#  Define constraints
puts "-i- Define constraints"
puts "-i-   set_max_area 0"
puts "-i-   set_clock"
set_max_area 0
create_clock -name "clk" -period $period clk_io


#  Map and optimize the design
puts "-i- Map and optimize design"
compile -map_effort ${COMPILE_MAP_EFFORT} -area_effort ${COMPILE_AREA_EFFORT}

#  Save the mapped design
puts "-i- Save mapped design"
write -hierarchy -format ddc -output ${DDC_DIR}/${design}_mapped.ddc

#  Generate reports
puts "-i- Generate reports"
report_constraint -nosplit -all_violators > ${RPT_DIR}/${design}_mapped_allviol.rpt
report_area > ${RPT_DIR}/${design}_mapped_area.rpt
report_timing > ${RPT_DIR}/${design}_mapped_timing.rpt
report_power -nosplit -analysis_effort low > ${RPT_DIR}/${design}_mapped_power.rpt

#  Generate the Verilog netlist
puts "-i- Generate Verilog netlist"
#change_names -rules verilog -hierarchy -verbose
write -format verilog -hierarchy -output ${BASE_DIR}/../HDL/GATE/${design}_mapped.v


#  Generate the design constraint file
puts "-i- Generate SDC design constraint file"
write_sdc -nosplit ${SDC_DIR}/${design}_mapped.sdc

puts "-i- Finished"
