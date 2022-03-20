

module qspi_core(

  input logic clk_i,
  input logic rst_ni,
  
  input logic  we_i,
  input logic  re_i,
  input logic  [3:0]  be_i,
  input logic  [23:0] addr_i,
  input logic  [31:0] wdata_i,
  output logic [31:0] rdata_o,

  output logic       sclk_o,
  output logic       cs_o,
  input  logic [3:0] sd_i,
  output logic [3:0] sd_o,
  output logic [3:0] sd_oe,

  output logic       intr_rx,
  output logic       intr_tx
);

  typedef enum logic [2:0] {IDLE, TRANSFER, XIP, MODE, RECIEVE} state_t;

  
  logic [31:0] control_reg; // 0
  logic [23:0] addr_reg;    // 
  logic [31:0] data_reg;    // 8
  logic [7:0]  command_reg; // 4
  logic        intr_clear; // 12
  logic        t_status; //16

  logic [5:0] r_size;
  logic [5:0] t_size;
  logic [7:0] t_command;
  logic [39:0] t_data; 
  logic [31:0] r_data;
  logic [5:0]  t_bit_index;
  logic [5:0]  r_bit_index;
  logic [5:0]  dummy_count;
  logic state_enb;
  logic dummy_enb;
  logic ss_o;
  logic t_done;
  logic r_done;
  logic [3:0] sd_oeb;
  logic cpol;
  logic cpha;
  logic t_enb;
  logic r_enb;
  logic lsb;
  logic xip;
  logic last_clk;
  logic w_only;
  logic enb; 
  logic qspi_clk;
  logic clr_tdone; 
  logic stop;
  logic cs_reg;
  logic temp;
  logic clr;
  logic d_valid;
  logic clr_reg;
  logic xip_state_enb;
  logic t_intr;
  

  state_t c_state, n_state;

  always_ff @(posedge clk_i or negedge rst_ni) begin
    if(!rst_ni) begin
      control_reg <= '0;
      data_reg    <= '0;
      command_reg <= '0;
      xip         <= '0;
      cpol 	  <= '0;
      cpha	  <= '0;
      enb 	  <= '0;
      w_only      <= '0;
      state_enb   <= '0;
      clr_reg     <= '0;
      intr_clear  <= '0;
      c_state     <= IDLE;
    end else begin
      if(clr) begin
	c_state     <= IDLE;
      end else begin
  	c_state     <= n_state;
      end
      clr_reg     <= d_valid;
      cpol        <= control_reg[12];
      cpha        <= control_reg[13];
      xip         <= control_reg[14];
      enb         <= control_reg[15];
      w_only      <= control_reg[16];
      lsb         <= control_reg[17];
      state_enb   <= control_reg[23];
      clr	  <= control_reg[24];
     if (we_i) begin
      if(addr_i == 24'd0) begin
        control_reg <= wdata_i;
      end else if(addr_i == 24'd4) begin
	command_reg <= wdata_i[7:0];
      end else if (addr_i == 24'd8) begin
	data_reg    <= wdata_i;
      end else if(addr_i == 24'd12) begin
	intr_clear  <= wdata_i[0];
      end
     end else begin
       control_reg[23] <= 1'b0;
     end
    end
  end 
assign sd_oe = sd_oeb;
  always_comb begin
//   r_size = '0;
//   t_size = '0;
//   sd_oeb = 4'b1111;

   case (c_state) 
	IDLE: begin
	       r_size = '0;
   	       t_size = '0;
   	       sd_oeb = 4'b1111;
	       t_data = '0;
	       ss_o   = '1;
	       r_enb  = '0;
	       t_enb  = '0;
	       last_clk = 1'b0;
	       clr_tdone = '0;
	       dummy_enb = '0;
	       temp      = '0;
	       d_valid   = '0;
	       t_intr    = '0;
	       if(xip) begin
	        if (re_i && state_enb && ~stop) begin
		  n_state = TRANSFER;
		  xip_state_enb = 1'b1;
	        end else begin
	         n_state = IDLE;
	        end
	       end else begin
	        if (state_enb && ~stop) begin
		  n_state = TRANSFER;
		  xip_state_enb = 1'b0;
	        end else begin
	         n_state = IDLE;
		 xip_state_enb = 1'b0;
	        end
	       end
		
	      end
	TRANSFER: begin
		   t_size = control_reg[5:0] + 8;
		   sd_oeb = 4'b1111;
		   t_enb  = 1'b1;
		   d_valid = '0;
		   t_data = {data_reg, command_reg};
		   if(t_bit_index == t_size) begin
		     if(w_only) begin
			n_state = IDLE;
			last_clk = 1'b1;
			t_intr   = 1'b1;
		     end else if(xip)begin
			last_clk = 1'b0;
			dummy_enb = 1'b0;
			t_size = 6'd28;
			t_enb  = 1'b0;
			temp   = 1'b1;
			n_state = XIP;
		     end else begin
			last_clk = 1'b0;
			dummy_enb = 1'b1;
			n_state = MODE;
		     end
		    end else begin
		     ss_o    = 1'b0;
		     last_clk = 1'b0;
		     n_state = TRANSFER;
		    end 
		  end
	XIP: begin
	      t_size = control_reg[30:25];
	      t_enb  = 1'b1;
	      sd_oeb = 4'b1111;
	      ss_o    = 1'b0;
	      d_valid = '0;
	      t_intr  = '0;
	      t_data = {8'b0, addr_i};
	      if(t_bit_index == t_size) begin
		n_state = MODE;
		dummy_enb = 1'b0;
	        r_enb  = 1'b0;
	      end else begin
		n_state = XIP;
	      end
	     end
	MODE: begin
	       sd_oeb = 4'b1111;
	       t_enb  = 1'b0;
	       t_size = 6'd0;
	       ss_o   = '1;
	       t_data = 40'b0; 
	       last_clk = 1'b0;
               temp     = 1'b1;
	       d_valid = '0;
	       dummy_enb = 1'b1;
	       t_intr    = '0;
	       if(dummy_count == control_reg[22:18]) begin
                dummy_enb = 1'b0;
		r_enb  = 1'b1;
		n_state = RECIEVE;
	       end else begin
		n_state = MODE;
	       end
	      end
	RECIEVE: begin
		  sd_oeb = 4'b0000;
		  t_enb  = 1'b0;
		  r_enb  = 1'b1;
		  temp     = 1'b0;
		  t_intr   = '0;
		  r_size = control_reg[11:6];
		  ss_o    = 1'b0;
		  if ((r_bit_index == r_size) && xip) begin
		   if(re_i) begin
		    n_state = XIP;
		    last_clk = 1'b0;
		    d_valid  = 1'b1;
		    r_enb  = 1'b0;
		    temp     = 1'b1;
		   end else begin
		    n_state = IDLE;
		    last_clk = 1'b1;
		    d_valid  = 1'b1;
		    r_enb  = 1'b0;
		    xip_state_enb = 1'b0;
		   end

		  end else if ((r_bit_index == r_size) && ~xip) begin
		   n_state = IDLE;
		   r_enb  = 1'b0;
		   last_clk = 1'b1;
		   d_valid  = 1'b1;
		  end else begin
		   n_state = RECIEVE;
		  end
		 end
	default: n_state = IDLE;
	
   endcase

  end

  always_ff @(posedge sclk_o or negedge rst_ni) begin
   if(!rst_ni) begin
     cs_reg  <= '1;
   end else begin
     cs_reg <= ss_o;
   end
  end
assign cs_o = ss_o;
  always_ff @(posedge clk_i or negedge rst_ni) begin
   if(!rst_ni) begin
     stop  <= '0;
   end else begin
    if(last_clk) begin
     stop <= 1'b1;
    end else if(clr || clr_reg) begin
     stop <= 1'b0;
    end else begin
     stop <= stop;
    end
   end
  end

  always_ff @(posedge sclk_o or negedge rst_ni) begin
   if(!rst_ni) begin
     dummy_count <= 6'd0;
   end else begin
    if(dummy_enb && (dummy_count != control_reg[22:18])) begin 
     dummy_count <= dummy_count + 6'd1;
    end else begin
     dummy_count <= 6'd0;
    end
   end
  end

  always_ff @(posedge clk_i or negedge rst_ni) begin
   if(!rst_ni) begin
     intr_tx  <= '0;
     t_status <= '0;
   end else begin
     if(intr_clear) begin
	intr_tx <= '0;
	t_status <= '0;
     end else begin
	intr_tx <= t_intr;
	t_status <= t_intr;
     end
   end
  end

 assign sclk_o = qspi_clk;
qspi_clgen u_clk(
  .clk_i    (clk_i),
  .rst_ni   (rst_ni),
  .enable   (xip ? (xip_state_enb && enb & (t_enb || r_enb || temp)) : (enb & (t_enb || r_enb || temp))),
  .go       (enb),       
  .last_clk (stop), 
  .divider  (16'b0), 
  .clk_out  (qspi_clk), 
  .pos_edge (), 
  .neg_edge ()
); 


qspi_rshift u_rx(
  .clk_i   (qspi_clk),
  .rst_ni  (rst_ni),

  .busy_i  (r_enb),
  .lsb_i   (lsb),
  .msb_i   (~lsb),
  .rsize_i (r_size),
  .data_o  (r_data),

  .sdi_i   (sd_i),
  .bit_index (r_bit_index),
  .r_intr  (r_done)
);

qspi_tshift u_tx(
  .clk_i   (qspi_clk),
  .m_clk_i (clk_i),
  .rst_ni  (rst_ni),
  
  .busy_i  (t_enb),
  .lsb_i   (lsb),
  .msb_i   (~lsb),
  .c_tdone (clr_tdone),
  .tsize_i (t_size),
  .din_i   (t_data),

  .sdo_o   (sd_o),
  .bit_index (t_bit_index),
  .t_intr  (t_done)
);

assign rdata_o = (~xip && (addr_i == 24'd16))? {31'b0,t_status} : r_data;
assign intr_rx = d_valid;

endmodule
