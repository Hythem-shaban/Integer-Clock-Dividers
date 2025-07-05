module dff_pos(
  input  wire i_clk,
  input  wire i_rst_n,
  input  wire i_d,
  output wire o_q,
  output wire o_q_n
);

  reg q;

  always @(posedge i_clk, negedge i_rst_n) begin
    if(!i_rst_n)
      q <= 'b0;
    else
      q <= i_d;
  end

  assign o_q = q;
  assign o_q_n = ~q;

endmodule