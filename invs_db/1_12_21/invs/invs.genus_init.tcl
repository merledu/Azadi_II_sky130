################################################################################
#
# Init setup file
# Created by Genus(TM) Synthesis Solution on 12/01/2021 01:06:18
#
################################################################################

      if { ![is_common_ui_mode] } {
        error "This script must be loaded into an 'innovus -stylus' session."
      }
    


read_mmmc ../run3/invs/invs.mmmc.tcl

read_netlist ../run3/invs/invs.v

init_design -skip_sdc_read
