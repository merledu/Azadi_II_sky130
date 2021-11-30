#################################################################################
#
# Created by Genus(TM) Synthesis Solution 20.11-s111_1 on Wed Dec 01 01:06:10 PKT 2021
#
#################################################################################

## library_sets
create_library_set -name set_slow \
    -timing { /merledu1/pdks-mpw3/pdk-new/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__ss_100C_1v40.lib }
create_library_set -name set_fast \
    -timing { /merledu1/pdks-mpw3/pdk-new/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__ff_100C_1v95.lib }
create_library_set -name set_typical \
    -timing { /merledu1/pdks-mpw3/pdk-new/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib }

## opcond
create_opcond -name op_cond_slow \
    -process 1.0 \
    -voltage 1.4 \
    -temperature 100.0
create_opcond -name op_cond_fast \
    -process 1.0 \
    -voltage 1.95 \
    -temperature 100.0
create_opcond -name op_cond_typical \
    -process 1.0 \
    -voltage 1.8 \
    -temperature 25.0

## timing_condition
create_timing_condition -name timing_cond_slow \
    -opcond op_cond_slow \
    -library_sets { set_slow }
create_timing_condition -name timing_cond_fast \
    -opcond op_cond_fast \
    -library_sets { set_fast }
create_timing_condition -name timing_cond_typical \
    -opcond op_cond_typical \
    -library_sets { set_typical }

## rc_corner
create_rc_corner -name default_emulate_rc_corner \
    -temperature 100.0 \
    -pre_route_res 1.0 \
    -pre_route_cap 1.0 \
    -pre_route_clock_res 0.0 \
    -pre_route_clock_cap 0.0 \
    -post_route_res {1.0 1.0 1.0} \
    -post_route_cap {1.0 1.0 1.0} \
    -post_route_cross_cap {1.0 1.0 1.0} \
    -post_route_clock_res {1.0 1.0 1.0} \
    -post_route_clock_cap {1.0 1.0 1.0}

## delay_corner
create_delay_corner -name delay_corner_slow \
    -early_timing_condition { timing_cond_slow } \
    -late_timing_condition { timing_cond_slow } \
    -early_rc_corner default_emulate_rc_corner \
    -late_rc_corner default_emulate_rc_corner
create_delay_corner -name delay_corner_fast \
    -early_timing_condition { timing_cond_fast } \
    -late_timing_condition { timing_cond_fast } \
    -early_rc_corner default_emulate_rc_corner \
    -late_rc_corner default_emulate_rc_corner
create_delay_corner -name delay_corner_typical \
    -early_timing_condition { timing_cond_typical } \
    -late_timing_condition { timing_cond_typical } \
    -early_rc_corner default_emulate_rc_corner \
    -late_rc_corner default_emulate_rc_corner

## constraint_mode
create_constraint_mode -name functional_slow \
    -sdc_files { ../run3/invs/invs.functional_slow.sdc }
create_constraint_mode -name functional_fast \
    -sdc_files { ../run3/invs/invs.functional_fast.sdc }
create_constraint_mode -name functional_typical \
    -sdc_files { ../run3/invs/invs.functional_typical.sdc }

## analysis_view
create_analysis_view -name view_slow \
    -constraint_mode functional_slow \
    -delay_corner delay_corner_slow
create_analysis_view -name view_fast \
    -constraint_mode functional_fast \
    -delay_corner delay_corner_fast
create_analysis_view -name view_typical \
    -constraint_mode functional_typical \
    -delay_corner delay_corner_typical

## set_analysis_view
set_analysis_view -setup { view_slow view_typical view_fast } \
                  -hold { view_slow view_typical view_fast }
