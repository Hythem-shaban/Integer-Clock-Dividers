module clk_div#(
  parameter RATIO_WIDTH = 8
)(
  input  wire i_clk,
  input  wire i_rst_n,
  input  wire [RATIO_WIDTH-1:0] i_div_ratio,
  input  wire i_div_en,
  output wire o_clk
);

  reg  div_clk;
  reg  [RATIO_WIDTH-2:0] counter;
  wire [RATIO_WIDTH-2:0] pulse_counts;
  wire pulse_done;

  always @(posedge i_clk, negedge i_rst_n) begin
    if(!i_rst_n) begin
      counter <= 0;
      div_clk <= 0;
    end
    else if(i_div_en) begin
      if(pulse_done) begin
        counter <= 0;
        div_clk <= ~ div_clk;
      end
      else
        counter <= counter + 1;
    end
  end

  assign pulse_counts = ((i_div_ratio >> 1) - 1);
  assign pulse_done = (counter == pulse_counts);
  assign o_clk = div_clk;

endmodule