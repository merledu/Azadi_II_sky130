

module qspi_top (

  input logic clk_i,
  input logic rst_ni,

  input  tlul_pkg::tl_h2d_t tl_i,
  output tlul_pkg::tl_d2h_t tl_o,

  output logic       sclk_o,
  output logic       cs_o,
  input  logic [3:0] sd_i,
  output logic [3:0] sd_o,
  output logic [3:0] sd_oe,

  output logic intr_tx
);


localparam int AW = 24;
localparam int DW = 32;
localparam int DBW = DW/8;  

logic         re;
logic         we;
logic [23:0]   addr;
logic [31:0]  wdata;
logic [3:0]   be;
logic [31:0]  rdata;
logic         rvalid;
logic 	      grant;

//assign err = '0;

qspi_core u_qspi_core(

.clk_i      (clk_i),												
.rst_ni     (rst_ni),												

.re_i       (re),												
.we_i       (we),												
.addr_i     ((we ? addr<<2: addr)),												
.wdata_i    (wdata),												
.be_i       (be),										    
.rdata_o    (rdata),												

												
.sclk_o	 (sclk_o),
.cs_o	 (cs_o),
.sd_i	 (sd_i),
.sd_o	 (sd_o),
.sd_oe	 (sd_oe),

.intr_rx (grant),
.intr_tx (intr_tx)	

);

 tlul_sram_adapter #(
  .SramAw       (24),
  .SramDw       (32), 
  .Outstanding  (2),  
  .ByteAccess   (1),
  .ErrOnWrite   (0),  // 1: Writes not allowed, automatically error
  .ErrOnRead    (0)   // 1: Reads not allowed, automatically error  

) qspi_bi (
  .clk_i     (clk_i),
  .rst_ni    (rst_ni),
  .tl_i      (tl_i),
  .tl_o      (tl_o), 
  .req_o     (re),
  .gnt_i     ((we? 1'b1: grant)),
  .we_o      (we),
  .addr_o    (addr),
  .wdata_o   (wdata),
  .wmask_o   (be),
  .rdata_i   (rdata),
  .rvalid_i  (rvalid),
  .rerror_i  (2'b0)
);

always_ff @(posedge clk_i or negedge rst_ni) begin
  if(!rst_ni) begin
    rvalid <= '0;
  end else begin
    rvalid <= grant;
  end
end
endmodule
