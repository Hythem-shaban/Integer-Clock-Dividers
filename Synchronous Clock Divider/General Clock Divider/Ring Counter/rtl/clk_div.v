module clk_div#(
  parameter RATIO = 8               
)(
  input  wire i_clk,
  input  wire i_rst_n,
  output wire o_clk
);

  reg [RATIO-1:0] ring_counter;
  reg q_n;

  always @(posedge i_clk, negedge i_rst_n) begin
    if(!i_rst_n)
      ring_counter <= 'b1;
    else
      ring_counter <= {ring_counter[0], ring_counter[RATIO-1:1]};
  end

  always @(negedge i_clk, negedge i_rst_n) begin
    if(!i_rst_n)
      q_n <= 'b0;
    else
      q_n <= ring_counter[0];
  end


  assign o_clk = RATIO[0]? (|ring_counter[RATIO/2-1:0] | q_n) : (|ring_counter[RATIO/2-1:0]);

endmodule