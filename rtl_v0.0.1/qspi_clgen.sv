

module qspi_clgen (
  input  logic        clk_i,   // input clock (system clock)
  input  logic        rst_ni,      // reset
  input  logic        enable,   // clock enable
  input  logic        go,       // start transfer
  input  logic        last_clk, // last clock
  input  logic [15:0] divider,  // clock divider (output clock is divided by this value)
  output logic        clk_out,  // output clock
  output logic        pos_edge, // pulse marking positive edge of clk_out
  output logic        neg_edge // pulse marking negative edge of clk_out

); 
                            
  logic [15:0] cnt;                          
  logic cnt_zero;
  logic cnt_one;
  logic sclk;
sky130_fd_sc_hd__dlclkp_1 CG_1( .CLK(clk_i), .GCLK(sclk), .GATE((enable && (!last_clk || sclk))));
/*  always_ff @(posedge clk_i or negedge rst_ni) begin
    if (~rst_ni) begin
	sclk <= 1'b0;
    end else begin
	sclk <= ((enable) && (!last_clk || sclk) ? ~sclk : sclk);
    end
  end
*/
  always_comb begin
     clk_out = sclk;
  end

endmodule
 

