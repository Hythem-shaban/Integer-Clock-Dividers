module clk_div#(
  parameter RATIO = 8
)(
  input  wire i_clk,
  input  wire i_rst_n,
  output wire o_clk
);

  localparam N_FF = $clog2(RATIO);

  wire [N_FF:0] clk;
  wire [N_FF-1:0] d;

  assign clk[0] = i_clk;

  genvar i;
  generate
    for(i=0; i<N_FF; i=i+1) begin: gen_label
      dff ff(
        .i_clk(clk[i]),
        .i_rst_n(i_rst_n),
        .i_d(d[i]),
        .o_q(clk[i+1]),
        .o_q_n(d[i])
      );
    end
  endgenerate

  assign o_clk = clk[N_FF];
endmodule