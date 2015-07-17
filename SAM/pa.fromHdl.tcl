
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name SAM -dir "C:/Users/nDy/Desktop/nDy/SAM/planAhead_run_1" -part xc3s500efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "lcd.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {lcd.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top lcd $srcset
add_files [list {lcd.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-4
