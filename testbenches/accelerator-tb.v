`timescale 1ns / 1ps

module acclerator_tb();

`define n 9'h00a
`define k 9'h003
`define p 9'h002 
`define tn 0
//`define c_size 32

reg clk,global_rst,ce;
reg [15:0] activation;
reg [(`k*`k)*16-1:0] weight1;
wire [31:0] data_out;
wire valid_op;
wire end_op;
parameter clkp = 40;
integer i;

acclerator #(`n,`k,`p) dut(
clk,
ce,
weight1,
global_rst,
activation,
data_out,
valid_op,
end_op
 );

initial begin

		clk = 0;
		ce = 0;
		weight1 = 0;
		global_rst = 0;
		activation = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
    clk = 0;
		ce = 0;
		weight1 = 0;
		activation = 0;
    global_rst =1;
    #50;
    global_rst =0;
    #10;		
		ce=1;
		weight1 = 144'h0000_0001_0002_0003_0004_0005_0006_0007_0008;  //basic testbench for k = 3
		// Initialize Inputs
		for(i=0;i<100;i=i+1) begin
		activation = i;
		#clkp; 
		end

end
always #(clkp/2) clk = ~clk;
endmodule