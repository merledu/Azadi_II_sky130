################################################################################
#
# Innovus setup file
# Created by Genus(TM) Synthesis Solution 20.11-s111_1
#   on 12/01/2021 01:06:18
#
################################################################################
#
# Genus(TM) Synthesis Solution setup file
# This file can only be run in Innovus Common UI mode.
#
################################################################################

      regexp {\d\d} [get_db program_version] major_version
      if { $major_version < 19 } {
        error "Innovus version must be 19 or higher."
      }
    

      set _t0 [clock seconds]
      puts [format  {%%%s Begin Genus to Innovus Setup (%s)} \# [clock format $_t0 -format {%m/%d %H:%M:%S}]]
    
set_db read_physical_allow_multiple_port_pin_without_must_join true
set_db must_join_all_ports true
set_db timing_cap_unit 1pf
set_db timing_time_unit 1ns


# Design Import
################################################################################
## Reading FlowKit settings file
source invs.flowkit_settings.tcl

source invs.invs_init.tcl
update_analysis_view -name view_slow -constraint_mode functional_slow -latency_file invs.view_slow_latency.sdc
update_analysis_view -name view_fast -constraint_mode functional_fast -latency_file invs.view_fast_latency.sdc
update_analysis_view -name view_typical -constraint_mode functional_typical -latency_file invs.view_typical_latency.sdc

# Reading metrics file
################################################################################
read_metric -id current invs.metrics.json

## Reading common preserve file for dont_touch and dont_use preserve settings
source -quiet invs.preserve.tcl



# Mode Setup
################################################################################
source invs.mode


# MSV Setup
################################################################################

# Reading write_name_mapping file
################################################################################

      if { [is_attribute -obj_type port original_name] &&
           [is_attribute -obj_type pin original_name] &&
           [is_attribute -obj_type pin is_phase_inverted]} {
        source invs.wnm_attrs.tcl
      }
    

# Reading NDR file
source invs.ndr.tcl

# Reading minimum routing layer data file
################################################################################
eval_legacy {gpsPrivate::readMinLayerCstr -file invs.min_layer} 

eval_legacy {set edi_pe::pegConsiderMacroLayersUnblocked 1}
eval_legacy {set edi_pe::pegPreRouteWireWidthBasedDensityCalModel 1}

      set _t1 [clock seconds]
      puts [format  {%%%s End Genus to Innovus Setup (%s, real=%s)} \# [clock format $_t1 -format {%m/%d %H:%M:%S}] [clock format [expr {28800 + $_t1 - $_t0}] -format {%H:%M:%S}]]
    
