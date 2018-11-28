`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:12:13 11/27/2018 
// Design Name: 
// Module Name:    pad_bi_dir 
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
module pad_bi_dir(
	input going_out, // signal going out of chip - yes this is an input to this module
	output pad,
	output coming_in);  // signal coming into chip to be read by i2c module

wire out_pre, out_pre1, out_pre2, out_buf, sda_en;

assign sda_en = going_out == 1'd0;

INVX1 inv0 (.A(going_out), .Z(out_pre));
INVX4 inv1 (.A(out_pre), .Z(out_pre1));
INVX16 inv2 (.A(out_pre1), .Z(out_pre2));
INVX32 inv3 (.A(out_pre2), .Z(out_buf));
pad_bidirhe pad_bidirhe0(.EN(sda_en), .DataOut(out_buf), .DataIn(coming_in), .pad(pad));

endmodule 


