

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
  
  assign cnt_zero = cnt == {16 {1'b0}};
  assign cnt_one = cnt == {{15 {1'b0}}, 1'b1};
  
  always_ff @(posedge clk_i or negedge rst_ni) begin
    if (~rst_ni) begin
	cnt <= {16 {1'b1}};
    end else if (!enable || cnt_zero) begin
	cnt <= divider;
    end else begin
	cnt <= cnt - {{15 {1'b0}}, 1'b1};
    end
  end
  
  always_ff @(posedge clk_i or negedge rst_ni) begin
    if (~rst_ni) begin
	sclk <= 1'b0;
    end else begin
	sclk <= ((enable && cnt_zero) && (!last_clk || sclk) ? ~sclk : sclk);
    end
  end

  always_ff @(posedge clk_i or negedge rst_ni) begin
    if (~rst_ni) begin
	pos_edge <= 1'b0;
	neg_edge <= 1'b0;
    end else begin
	pos_edge <= (((enable && !sclk) && cnt_one) || (!(|divider) && sclk)) || ((!(|divider) && go) && !enable);
	neg_edge <= ((enable && sclk) && cnt_one) || ((!(|divider) && !sclk) && enable);
    end
  end

  always_comb begin
   if(divider == 0) begin
     clk_out = clk_i & ((enable && cnt_zero) && (!last_clk || sclk));
   end else begin
     clk_out = sclk;
   end
  end

endmodule
 

