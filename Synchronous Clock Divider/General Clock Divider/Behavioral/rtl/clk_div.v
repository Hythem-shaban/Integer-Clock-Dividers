module clk_div#(
  parameter RATIO_WIDTH = 8               
)(
  input  wire i_clk,
  input  wire i_rst_n,
  input  wire [RATIO_WIDTH-1:0] i_div_ratio,
  output wire o_clk
);

  reg [RATIO_WIDTH-1:0] pos_cnt;
  reg [RATIO_WIDTH-1:0] neg_cnt;

  wire pos_pulse, neg_pulse;

  always @(posedge i_clk, negedge i_rst_n) begin
    if(!i_rst_n)
      pos_cnt <= 'b0;
    else if(pos_cnt == i_div_ratio - 1)
      pos_cnt <= 'b0;
    else
      pos_cnt <= pos_cnt + 1;
  end

  always @(negedge i_clk, negedge i_rst_n) begin
    if(!i_rst_n)
      neg_cnt <= 'b0;
    else if(neg_cnt == i_div_ratio - 1)
      neg_cnt <= 'b0;
    else
      neg_cnt <= neg_cnt + 1;
  end

  assign pos_pulse = pos_cnt > (i_div_ratio >> 1) - !i_div_ratio[0];
  assign neg_pulse = neg_cnt > (i_div_ratio >> 1) - !i_div_ratio[0];

  assign o_clk = pos_pulse | (neg_pulse & (i_div_ratio[0]));

endmodule