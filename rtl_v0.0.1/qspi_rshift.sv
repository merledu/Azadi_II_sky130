
module qspi_rshift
(
  input logic clk_i,
  input logic rst_ni,

  input logic busy_i,
  input logic lsb_i,
  input logic msb_i,
  input logic [5:0] rsize_i,
  output logic [31:0] data_o,

  input logic [3:0] sdi_i,
  output logic [5:0] bit_index,
  output logic r_intr

);

   logic [5:0] max_index;

  always_ff @(posedge clk_i or negedge rst_ni) begin
    if(!rst_ni) begin
	bit_index <= '0;
	max_index <= 6'd0;
    end else if(busy_i) begin
      if ((bit_index != rsize_i)) begin
	max_index <= 6'd4;
	bit_index <= bit_index + max_index;
      end else begin
	bit_index <= '0;
	max_index <= 6'd0;
      end
    end else begin
	bit_index <= '0;
	max_index <= 6'd0;
    end
  end
  
  always_ff @(posedge clk_i or negedge rst_ni) begin
    if(!rst_ni) begin
      data_o <= '0;
    end else begin 
     if(lsb_i && busy_i && (bit_index < rsize_i)) begin
       data_o[bit_index]   <= sdi_i[0];
       data_o[bit_index+1] <= sdi_i[1];
       data_o[bit_index+2] <= sdi_i[2];
       data_o[bit_index+3] <= sdi_i[3];
     end else if (~lsb_i && busy_i && (bit_index <rsize_i))begin
       data_o[rsize_i-(bit_index+1)] <= sdi_i[3];
       data_o[rsize_i-(bit_index+2)] <= sdi_i[2];
       data_o[rsize_i-(bit_index+3)] <= sdi_i[1];
       data_o[rsize_i-(bit_index+4)] <= sdi_i[0];
     end else begin
       data_o <= data_o;
     end
    end
  end
endmodule
