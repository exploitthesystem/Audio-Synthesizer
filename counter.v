`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:44:22 11/07/2018 
// Design Name: 
// Module Name:    counter 
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
module counter(input clk, 
					input reset, 
					input [7:0] count_to,
					output reg [7:0] count
					);

	wire [7:0] next_count;

	// if count_to is zero, pretend it's max at 0xFF and increment it
	assign next_count = (count_to == 8'd0) ? count + 1'b1 :(count < count_to) ? count + 1'b1 : 1'b0;
	
	always @(posedge clk)
	begin
		if(reset) begin
			count <= 0;
		end
		else count <= next_count;
	end
		
endmodule		
