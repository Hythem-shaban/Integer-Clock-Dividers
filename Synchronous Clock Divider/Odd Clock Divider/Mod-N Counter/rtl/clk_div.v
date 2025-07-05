module clk_div(
  input  wire i_clk,
  input  wire i_rst_n,
  output wire o_clk
);

  wire q0, q1, q;
  wire d0, d1, d;

  assign d0 = ~(q0 ^ q1);
  assign d1 = q0;
  assign d  = q0;

  dff_pos ff0_pos (
    .i_clk(i_clk),
    .i_rst_n(i_rst_n),
    .i_d(d0),
    .o_q(q0),
    .o_q_n()
  );

  dff_pos ff1_pos (
    .i_clk(i_clk),
    .i_rst_n(i_rst_n),
    .i_d(d1),
    .o_q(q1),
    .o_q_n()
  );

  dff_neg ff0_neg (
    .i_clk(i_clk),
    .i_rst_n(i_rst_n),
    .i_d(d),
    .o_q(q),
    .o_q_n()
  );

  assign o_clk = q | q0;

endmodule