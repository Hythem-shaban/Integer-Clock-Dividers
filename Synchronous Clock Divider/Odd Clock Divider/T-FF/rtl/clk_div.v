module clk_div#(
  parameter RATIO = 5                     // RATIO must be odd number
)(
  input  wire i_clk,
  input  wire i_rst_n,
  output wire o_clk
);

  localparam N = $clog2(RATIO);

  wire t1, t2;
  reg [N-1:0] counter;
  reg div1, div2;

  always @(posedge i_clk, negedge i_rst_n) begin
    if(!i_rst_n)
      counter <= 'b0;
    else if(counter == (RATIO-1))
      counter <= 'b0;
    else
      counter <= counter + 1;
  end

  assign t1 = counter == 0;
  assign t2 = counter == ((RATIO + 1) >> 1);

  always @(posedge i_clk, negedge i_rst_n) begin
    if(!i_rst_n)
      div1 <= 'b0;
    else if(t1)
      div1 <= ~div1;
  end

  always @(negedge i_clk, negedge i_rst_n) begin
    if(!i_rst_n)
      div2 <= 'b0;
    else if(t2)
      div2 <= ~div2;
  end

  assign o_clk = div1 ^ div2;

endmodule