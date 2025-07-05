quit -sim
if [file exists "work"] {vdel -all}
vlib work

vlog ../rtl/*.v
vlog clk_div_tb.v

vsim -voptargs=+acc work.clk_div_tb

add wave -position insertpoint sim:/clk_div_tb/*
add wave -position insertpoint sim:/clk_div_tb/dut/*


run -all;
