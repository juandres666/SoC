
# PlanAhead Launch Script for Post PAR Floorplanning, created by Project Navigator

create_project -name test_ADC -dir "D:/stage/test_ADC/planAhead_run_1" -part xc3s500efg320-5
set srcset [get_property srcset [current_run -impl]]
set_property design_mode GateLvl $srcset
set_property edif_top_file "D:/stage/test_ADC/Test.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/stage/test_ADC} }
set_property target_constrs_file "contrainte.ucf" [current_fileset -constrset]
add_files [list {contrainte.ucf}] -fileset [get_property constrset [current_run]]
link_design
read_xdl -file "D:/stage/test_ADC/Test.ncd"
if {[catch {read_twx -name results_1 -file "D:/stage/test_ADC/Test.twx"} eInfo]} {
   puts "WARNING: there was a problem importing \"D:/stage/test_ADC/Test.twx\": $eInfo"
}
