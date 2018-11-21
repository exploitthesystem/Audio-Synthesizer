`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:09:37 11/07/2018
// Design Name:   pwm
// Module Name:   C:/Users/gordb/Documents/git/u/ece/ece5710/vlsi/pwm_test.v
// Project Name:  vlsi
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pwm
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pwm_test;

	// Inputs
	reg clk;
	reg reset;
	reg [15:0] pwm_reg;

	// Outputs
	wire pwm_out;

	// Instantiate the Unit Under Test (UUT)
	pwm uut (
		.clk(clk), 
		.reset(reset), 
		.pwm_reg(pwm_reg), 
		.pwm_out(pwm_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		pwm_reg = 16'h0000;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		reset = 1;
		#100
		reset = 0;
		#10000
		pwm_reg = 16'h0080;
		#10000
		pwm_reg = 16'h8040;
		#10000
		pwm_reg = 16'h8060;
		#10000
		pwm_reg = 16'hFF60;
		#1000
		reset = 1;
		pwm_reg = 16'h0080;
		#2
		reset = 0;
	end
   always begin #5 assign clk = ~clk; end     
endmodule

