
// main XBAR 

module tl_xbar_main (

  input logic clk_i,
  input logic rst_ni,


  // Host interfaces
  input  tlul_pkg::tl_h2d_t tl_brqif_i,
  output tlul_pkg::tl_d2h_t tl_brqif_o,
  input  tlul_pkg::tl_h2d_t tl_brqlsu_i,
  output tlul_pkg::tl_d2h_t tl_brqlsu_o,

  // Device interfaces
  output tlul_pkg::tl_h2d_t tl_iccm_o,
  input  tlul_pkg::tl_d2h_t tl_iccm_i,
  output tlul_pkg::tl_h2d_t tl_dccm_o,
  input  tlul_pkg::tl_d2h_t tl_dccm_i,
  output tlul_pkg::tl_h2d_t tl_timer0_o,
  input  tlul_pkg::tl_d2h_t tl_timer0_i,
  output tlul_pkg::tl_h2d_t tl_uart_o,
  input  tlul_pkg::tl_d2h_t tl_uart_i,
  output tlul_pkg::tl_h2d_t tl_spi_o,
  input  tlul_pkg::tl_d2h_t tl_spi_i,
  output tlul_pkg::tl_h2d_t tl_pwm_o,
  input  tlul_pkg::tl_d2h_t tl_pwm_i,
  output tlul_pkg::tl_h2d_t tl_gpio_o,
  input  tlul_pkg::tl_d2h_t tl_gpio_i,
  output tlul_pkg::tl_h2d_t tl_plic_o,
  input  tlul_pkg::tl_d2h_t tl_plic_i,
  output tlul_pkg::tl_h2d_t tl_qspi_o,
  input  tlul_pkg::tl_d2h_t tl_qspi_i


);

 import tlul_pkg::*;
  import tl_main_pkg::*;


// host LSU
  tlul_pkg::tl_h2d_t brqlsu_to_s1n;
  tlul_pkg::tl_d2h_t s1n_to_brqlsu;
  logic [3:0] device_sel;

  tlul_pkg::tl_h2d_t brqifu_to_s1n;
  tlul_pkg::tl_d2h_t s1n_to_brqifu;
  logic [1:0] device_sel_2;

  tlul_pkg::tl_h2d_t s1n_to_sm1[2];
  tlul_pkg::tl_d2h_t sm1_to_s1n[2];

  tlul_pkg::tl_h2d_t  h_dv_o[8];
  tlul_pkg::tl_d2h_t  h_dv_i[8];

  tlul_pkg::tl_h2d_t  h2_dv_o[2];
  tlul_pkg::tl_d2h_t  h2_dv_i[2];



  assign brqlsu_to_s1n = tl_brqlsu_i;
  assign tl_brqlsu_o   = s1n_to_brqlsu;
// Dveice connections

  assign brqifu_to_s1n  = tl_brqif_i;
  assign tl_brqif_o     = s1n_to_brqifu;

  assign tl_iccm_o  = h2_dv_o[0];
  assign h2_dv_i[0] = tl_iccm_i;

  assign tl_dccm_o = h_dv_o[0];
  assign h_dv_i[0] = tl_dccm_i;

  assign tl_timer0_o = h_dv_o[1];
  assign h_dv_i[1]   = tl_timer0_i;

  assign tl_uart_o   = h_dv_o[2];
  assign h_dv_i[2]   = tl_uart_i;

  assign tl_spi_o    = h_dv_o[3];
  assign h_dv_i[3]   = tl_spi_i;

  assign tl_pwm_o    = h_dv_o[4];
  assign h_dv_i[4]   = tl_pwm_i;

  assign tl_gpio_o   = h_dv_o[5];
  assign h_dv_i[5]   = tl_gpio_i;

  assign tl_plic_o   = h_dv_o[6];
  assign h_dv_i[6]   = tl_plic_i; 

  assign s1n_to_sm1[0]   = h_dv_o[7];
  assign h_dv_i[7]       = sm1_to_s1n[0];

  assign s1n_to_sm1[1]   = h2_dv_o[1];
  assign h2_dv_i[1]       = sm1_to_s1n[1]; 


  always_comb begin 
    
     device_sel_2 = 2'd3;

    if ((brqifu_to_s1n.a_address & ~(ADDR_MASK_ICCM)) == ADDR_SPACE_ICCM) begin
     device_sel_2 = 2'd0; 
    end else if ((brqifu_to_s1n.a_address & ~(ADDR_MASK_QSPI))    == ADDR_SPACE_QSPI) begin
      device_sel_2 = 2'd1;
    end
  end


  tlul_socket_1n #(
    .HReqDepth (4'h0),
    .HRspDepth (4'h0),
    .DReqDepth (36'h0),
    .DRspDepth (36'h0),
    .N         (2)
  ) host_ifu (
    .clk_i        (clk_i),
    .rst_ni       (rst_ni),
    .tl_h_i       (brqifu_to_s1n),
    .tl_h_o       (s1n_to_brqifu),
    .tl_d_o       (h2_dv_o),
    .tl_d_i       (h2_dv_i),
    .dev_select_i (device_sel_2)
  );

// host  socket
  always_comb begin 
    
     device_sel = 4'd8;

    if ((brqlsu_to_s1n.a_address & ~(ADDR_MASK_DCCM)) == ADDR_SPACE_DCCM) begin
     device_sel = 4'd0; 
    end else if ((brqlsu_to_s1n.a_address & ~(ADDR_MASK_TIMER0))    == ADDR_SPACE_TIMER0) begin
      device_sel = 4'd1;
    end else if ((brqlsu_to_s1n.a_address & ~(ADDR_MASK_UART0))     == ADDR_SPACE_UART0) begin
      device_sel = 4'd2;
    end else if ((brqlsu_to_s1n.a_address & ~(ADDR_MASK_SPI0))      == ADDR_SPACE_SPI0) begin
      device_sel = 4'd3;
    end else if ((brqlsu_to_s1n.a_address & ~(ADDR_MASK_PWM))       == ADDR_SPACE_PWM) begin
      device_sel = 4'd4;
    end else if ((brqlsu_to_s1n.a_address & ~(ADDR_MASK_GPIO))      == ADDR_SPACE_GPIO) begin
      device_sel = 4'd5;
    end else if ((brqlsu_to_s1n.a_address & ~(ADDR_MASK_PLIC))      == ADDR_SPACE_PLIC) begin
      device_sel = 4'd6;
    end else if ((brqlsu_to_s1n.a_address & ~(ADDR_MASK_QSPI))      == ADDR_SPACE_QSPI) begin
      device_sel = 4'd7;
    end
  end

// host 2 socket

  tlul_socket_1n #(
    .N         (8)
  ) host_lsu (
    .clk_i        (clk_i),
    .rst_ni       (rst_ni),
    .tl_h_i       (brqlsu_to_s1n),
    .tl_h_o       (s1n_to_brqlsu),
    .tl_d_o       (h_dv_o),
    .tl_d_i       (h_dv_i),
    .dev_select_i (device_sel)
  );
/*

 always_comb begin
   tl_qspi_o = '0;
 //  sm1_to_s1n[1] = '0;
 //  sm1_to_s1n[0] = '0;
   if(device_sel == 4'd7) begin
      tl_qspi_o     = s1n_to_sm1[0];
      sm1_to_s1n[0] = tl_qspi_i;
     // sm1_to_s1n[1] = '0;
   end else if(device_sel_2 == 2'd1) begin
      tl_qspi_o     = s1n_to_sm1[1];
      sm1_to_s1n[1] = tl_qspi_i;
     // sm1_to_s1n[0] = '0;
   end

 end
*/

  tlul_socket_m1 #(
    .M         (2)
  ) QSPI (
    .clk_i        (clk_i),
    .rst_ni       (rst_ni),
    .tl_h_i       (s1n_to_sm1),
    .tl_h_o       (sm1_to_s1n),
    .tl_d_o       (tl_qspi_o),
    .tl_d_i       (tl_qspi_i)
  );

endmodule
