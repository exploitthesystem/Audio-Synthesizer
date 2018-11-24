`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2018 03:02:46 PM
// Design Name: 
// Module Name: top_test_bench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_test_bench;

wire 		vdd_pad_io_tst;	
wire 		vss_pad_io_tst;	 
wire 		reset_io_tst;
reg 		clk_io_tst;	 
reg[15:0] 	data_in_io_tst;
reg[15:0] 	data_out_io_tst; 
reg [9:0] 	addr_out_io_tst;
reg 		core_to_mem_enable_io_tst;
reg 		sda_io_tst;
reg 		scl_io_tst;
wire 		pwm0_io_tst;
wire 		pwm1_io_tst;
wire 		pwm2_io_tst;
wire 		pwm3_io_tst;
wire 		pwm4_io_tst;
wire 		pwm5_io_tst;
wire 		pwm6_io_tst;
wire 		pwm7_io_tst;		

reg [1023:0] mem [15:0];



synth_top top1(
	.vdd_pad_io					(vdd_pad_io_tst),
	.vss_pad_io					(vss_pad_io_tst),
	.reset_io					(reset_io_tst),
	.clk_io						(clk_io_tst),
	.data_in_io					(data_in_io_tst),
	.data_out_io				(data_out_io_tst),
	.addr_out_io				(addr_out_io_tst),
	.core_to_mem_enable_io		(core_to_mem_enable_io_tst),
	.sda_io						(sda_io_tst),
	.scl_io						(scl_io_tst),
	.pwm0_io					(pwm0_io_tst),
	.pwm1_io					(pwm1_io_tst),
	.pwm2_io					(pwm2_io_tst),
	.pwm3_io					(pwm3_io_tst),
	.pwm4_io					(pwm4_io_tst),
	.pwm5_io					(pwm5_io_tst),
	.pwm6_io					(pwm6_io_tst),
	.pwm7_io					(pwm7_io_tst)				
);


initial begin
// $readmemh("memory.list", my_memory);

mem[0]	= 16'b0100_1111_0010_0000;	
mem[1]	= 16'b0100_1000_1111_1111;	
mem[2]	= 16'b0101_1000_0000_0000;	
mem[3]	= 16'b0100_0100_0000_1100;	
mem[4]	= 16'b0010_0000_0100_0100; 
mem[5]	= 16'b1001_0001_1000_1000;	
mem[6]	= 16'b0100_0111_0000_0001;	
mem[7]	= 16'b1101_0000_0001_0000;	
mem[8]	= 16'b0011_1001_1111_1000;	
mem[9]	= 16'b0100_0010_0000_0001;	
mem[10] = 16'b1011_1000_1000_0010;	
mem[11] = 16'b0011_0000_1111_0111;		
mem[12] = 16'b0100_0010_0000_0001;	
mem[13] = 16'b1010_1111_1111_0010;	
mem[14] = 16'b0001_1111_0000_0011;	
mem[15] = 16'b0100_0011_0001_0001;	
mem[16] = 16'b0100_0001_1111_1111;	
mem[17] = 16'b1101_0000_0001_0000;	
mem[18] = 16'b0011_1001_0000_0010;	
mem[19] = 16'b1011_0001_0001_0010;	
mem[20] = 16'b0010_0000_0000_0011;	
mem[21] = 16'b0000_1111_0000_0010;	
mem[22] = 16'b1011_1111_1111_0010;	
mem[23] = 16'b0010_0000_0000_0101;

assign data_in_io_tst = mem[addr_out_io_tst];

end

always 
   #50  clk_io_tst =  ! clk_io_tst;

endmodule