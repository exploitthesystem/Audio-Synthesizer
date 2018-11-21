`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:01:39 11/07/2018 
// Design Name: 
// Module Name:    pwm 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module pwm(	input clk, 
				input rst, 
				input [15:0] pwm_reg,
				output reg pwm_out
				);
				
	wire [7:0] count;
	counter U1(.clk(clk), .rst(rst), .count_to(pwm_reg[15:8]), .count(count));
	assign next_pwm_out = (pwm_reg[7:0] >= count);

	always @(posedge clk or negedge rst)
	begin
		if(rst == 0) begin
			pwm_out <= 0;
		end
		else begin
			pwm_out <= next_pwm_out;
		end
	end

endmodule
