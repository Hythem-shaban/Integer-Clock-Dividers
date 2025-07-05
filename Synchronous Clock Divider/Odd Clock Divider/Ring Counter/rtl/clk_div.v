module clk_div#(
  parameter RATIO = 5               // RATIO must be odd number
)(
  input  wire i_clk,
  input  wire i_rst_n,
  output wire o_clk
);

  reg [RATIO-1:0] ring_counter;
  reg q_n;

  always @(posedge i_clk, negedge i_rst_n) begin
    if(!i_rst_n)
      ring_counter <= 'b00001;
    else
      ring_counter <= {ring_counter[0], ring_counter[RATIO-1:1]};
  end

  always @(negedge i_clk, negedge i_rst_n) begin
    if(!i_rst_n)
      q_n <= 'b0;
    else
      q_n <= ring_counter[0];
  end

  assign o_clk = ring_counter[0] | ring_counter[1] | q_n;

endmodule