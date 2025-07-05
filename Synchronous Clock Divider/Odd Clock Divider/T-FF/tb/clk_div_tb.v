module clk_div_tb;
  parameter RATIO = 5;
  parameter CLK_PERIOD = 10;

  reg  i_clk;
  reg  rst_n;
  wire o_clk;

  always #(CLK_PERIOD/2.0) i_clk = ~i_clk;

  clk_div#(
    .RATIO(RATIO)
  ) dut(
    .i_clk(i_clk),
    .i_rst_n(rst_n),
    .o_clk(o_clk)
  );

  initial begin
    i_clk = 'b0;
    rst_n = 'b0;
    #(CLK_PERIOD);
    rst_n = 'b1;
  end

  initial begin
    $dumpfile("wave.vcd");
    $dumpvars;
  end

  initial begin
    #(CLK_PERIOD*128);
    $stop;
  end
endmodule