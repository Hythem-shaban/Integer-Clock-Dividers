module clk_div_tb;
  parameter RATIO_WIDTH = 8;
  parameter CLK_PERIOD = 10;

  reg  i_clk;
  reg  rst_n;
  reg  [RATIO_WIDTH-1:0] div_ratio;
  reg  div_en;
  wire o_clk;

  always #(CLK_PERIOD/2.0) i_clk = ~i_clk;

  clk_div#(
    .RATIO_WIDTH(RATIO_WIDTH)
  ) dut(
    .i_clk(i_clk),
    .i_rst_n(rst_n),
    .i_div_ratio(div_ratio),
    .i_div_en(div_en),
    .o_clk(o_clk)
  );

  initial begin
    i_clk = 'b0;
    rst_n = 'b0;
    div_ratio = 8;
    div_en = 'b1;
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