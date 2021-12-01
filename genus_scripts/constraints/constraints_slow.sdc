
# Set the current design

current_design azadi_soc_top_caravel

create_clock -name "clk2" -period 25 -waveform {0.0 12.5} [get_ports wb_clk_i]

set_clock_latency -source 2 {wb_clk_i}
set_false_path -from [list \
  [get_ports wb_rst_i]]

set_input_delay -clock clk2 -add_delay -max 5 [get_ports la_data_in[0]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports la_data_in[1]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports la_data_in[2]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports la_data_in[3]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports la_data_in[4]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports la_data_in[5]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports la_data_in[6]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports la_data_in[7]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports la_data_in[8]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports la_data_in[9]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports la_data_in[10]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports la_data_in[11]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports la_data_in[12]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports la_data_in[13]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports la_data_in[14]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports la_data_in[15]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports io_in[0]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports io_in[1]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports io_in[2]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports io_in[3]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports io_in[4]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports io_in[5]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports io_in[6]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports io_in[7]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports io_in[8]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports io_in[9]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports io_in[10]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports io_in[11]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports io_in[12]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports io_in[13]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports io_in[14]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports io_in[15]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports io_in[16]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports io_in[17]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports io_in[18]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports io_in[19]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports io_in[20]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports io_in[21]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports io_in[22]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports io_in[23]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports io_in[24]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports io_in[25]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports io_in[26]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports io_in[27]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports io_in[28]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports io_in[29]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports io_in[30]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports io_in[31]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports io_in[32]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports io_in[33]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports io_in[34]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports io_in[35]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports io_in[36]]
set_input_delay -clock clk2 -add_delay -max 5 [get_ports io_in[37]]

set_input_delay -clock clk2 -add_delay -min 5 [get_ports la_data_in[0]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports la_data_in[1]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports la_data_in[2]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports la_data_in[3]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports la_data_in[4]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports la_data_in[5]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports la_data_in[6]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports la_data_in[7]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports la_data_in[8]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports la_data_in[9]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports la_data_in[10]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports la_data_in[11]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports la_data_in[12]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports la_data_in[13]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports la_data_in[14]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports la_data_in[15]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports io_in[0]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports io_in[1]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports io_in[2]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports io_in[3]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports io_in[4]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports io_in[5]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports io_in[6]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports io_in[7]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports io_in[8]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports io_in[9]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports io_in[10]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports io_in[11]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports io_in[12]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports io_in[13]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports io_in[14]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports io_in[15]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports io_in[16]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports io_in[17]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports io_in[18]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports io_in[19]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports io_in[20]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports io_in[21]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports io_in[22]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports io_in[23]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports io_in[24]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports io_in[25]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports io_in[26]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports io_in[27]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports io_in[28]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports io_in[29]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports io_in[30]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports io_in[31]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports io_in[32]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports io_in[33]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports io_in[34]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports io_in[35]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports io_in[36]]
set_input_delay -clock clk2 -add_delay -min 5 [get_ports io_in[37]]



set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_out[0]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_out[1]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_out[2]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_out[3]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_out[4]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_out[5]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_out[6]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_out[7]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_out[8]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_out[9]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_out[10]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_out[11]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_out[12]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_out[13]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_out[14]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_out[15]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_out[16]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_out[17]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_out[18]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_out[19]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_out[20]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_out[21]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_out[22]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_out[23]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_out[24]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_out[25]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_out[26]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_out[27]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_out[28]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_out[29]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_out[30]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_out[31]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_out[32]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_out[33]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_out[34]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_out[35]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_out[36]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_out[37]]

set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_oeb[0]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_oeb[1]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_oeb[2]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_oeb[3]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_oeb[4]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_oeb[5]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_oeb[6]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_oeb[7]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_oeb[8]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_oeb[9]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_oeb[10]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_oeb[11]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_oeb[12]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_oeb[13]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_oeb[14]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_oeb[15]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_oeb[16]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_oeb[17]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_oeb[18]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_oeb[19]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_oeb[20]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_oeb[21]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_oeb[22]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_oeb[23]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_oeb[24]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_oeb[25]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_oeb[26]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_oeb[27]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_oeb[28]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_oeb[29]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_oeb[30]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_oeb[31]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_oeb[32]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_oeb[33]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_oeb[34]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_oeb[35]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_oeb[36]]
set_output_delay -clock clk2 -add_delay -max 5 [get_ports io_oeb[37]]

set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_out[0]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_out[1]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_out[2]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_out[3]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_out[4]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_out[5]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_out[6]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_out[7]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_out[8]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_out[9]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_out[10]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_out[11]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_out[12]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_out[13]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_out[14]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_out[15]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_out[16]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_out[17]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_out[18]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_out[19]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_out[20]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_out[21]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_out[22]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_out[23]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_out[24]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_out[25]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_out[26]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_out[27]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_out[28]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_out[29]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_out[30]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_out[31]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_out[32]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_out[33]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_out[34]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_out[35]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_out[36]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_out[37]]

set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_oeb[0]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_oeb[1]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_oeb[2]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_oeb[3]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_oeb[4]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_oeb[5]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_oeb[6]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_oeb[7]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_oeb[8]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_oeb[9]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_oeb[10]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_oeb[11]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_oeb[12]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_oeb[13]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_oeb[14]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_oeb[15]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_oeb[16]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_oeb[17]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_oeb[18]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_oeb[19]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_oeb[20]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_oeb[21]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_oeb[22]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_oeb[23]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_oeb[24]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_oeb[25]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_oeb[26]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_oeb[27]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_oeb[28]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_oeb[29]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_oeb[30]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_oeb[31]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_oeb[32]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_oeb[33]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_oeb[34]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_oeb[35]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_oeb[36]]
set_output_delay -clock clk2 -add_delay -min 5 [get_ports io_oeb[37]]


set_max_fanout 15.000 [current_design]
set_max_transition 1.5 [current_design]
