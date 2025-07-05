module clk_div_tb;
  parameter RATIO_WIDTH = 8;
  parameter CLK_PERIOD = 10;

  reg  i_clk;
  reg  rst_n;
  reg  [RATIO_WIDTH-1:0] div_ratio;
  wire o_clk;

  integer i;

  always #(CLK_PERIOD/2.0) i_clk = ~i_clk;

  clk_div#(
    .RATIO_WIDTH(RATIO_WIDTH)
  ) dut(
    .i_clk(i_clk),
    .i_rst_n(rst_n),
    .i_div_ratio(div_ratio),
    .o_clk(o_clk)
  );

  initial begin
    i_clk = 'b0;
    rst_n = 'b0;
    #(CLK_PERIOD);
    rst_n = 'b1;
    for (i=2; i<10; i=i+1) begin
      div_ratio = i;
      #(CLK_PERIOD*20);
      rst_n = 'b0;
      #(CLK_PERIOD);
      rst_n = 'b1;
    end
    $stop;
  end

  initial begin
    $dumpfile("wave.vcd");
    $dumpvars;
  end

endmodule