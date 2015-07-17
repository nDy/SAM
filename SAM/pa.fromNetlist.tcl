
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name SAM -dir "C:/Users/nDy/Desktop/nDy/SAM/planAhead_run_5" -part xc3s500efg320-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/nDy/Desktop/nDy/SAM/SAM.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/nDy/Desktop/nDy/SAM} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "SAM.ucf" [current_fileset -constrset]
add_files [list {SAM.ucf}] -fileset [get_property constrset [current_run]]
link_design
