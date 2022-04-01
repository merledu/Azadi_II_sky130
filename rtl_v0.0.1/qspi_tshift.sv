
module qspi_tshift
(
  input clk_i,
  input m_clk_i,
  input rst_ni,
  
  input logic busy_i,
  input logic lsb_i,
  input logic msb_i,
  input logic c_tdone,
  input logic [5:0] tsize_i,
  input logic [39:0] din_i,

  output logic [3:0] sdo_o,
  output logic [5:0] bit_index,
  output logic t_intr
);
  
  always_ff @(posedge clk_i or negedge rst_ni) begin
    if(!rst_ni) begin
	bit_index <= 6'b0;
    end else if(busy_i) begin
      if ((bit_index != tsize_i)) begin
	bit_index <= bit_index + 6'd4;
      end else begin
	bit_index <= 6'b0;
      end
    end else begin
	bit_index <= 6'b0;
    end
  end
  
  always_ff @(posedge clk_i or negedge rst_ni) begin
    if(!rst_ni) begin
      sdo_o <= '0;
    end else if(busy_i && (bit_index <tsize_i)) begin
      sdo_o[0] <= din_i[bit_index];
      sdo_o[1] <= din_i[bit_index+1];
      sdo_o[2] <= din_i[bit_index+2];
      sdo_o[3] <= din_i[bit_index+3];
   
    end else begin
      sdo_o <= '0;
    end
  end

endmodule
