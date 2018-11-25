`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:26:21 11/24/2018
// Design Name:   Core
// Module Name:   C:/Users/gordb/Documents/git/Audio-Synthesizer/trash_this_test.v
// Project Name:  Audio-Synthesizer
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Core
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module core_cpu_test;

	// Inputs
	reg clk;
	reg rst;
	wire [15:0] mem_to_core_data;
	reg i2c_wr_en;
	reg [1:0] i2c_sts;
	reg [7:0] i2c_to_core_data;

	// Outputs
	wire [15:0] core_to_mem_data;
	wire [9:0] core_to_mem_address;
	wire core_to_mem_write_enable;
	wire [7:0] core_to_i2c_data;
	wire [7:0] i2c_reg_addr;
	wire [8:0] i2c_addr;
	wire [15:0] pwm_reg0;
	wire [15:0] pwm_reg1;
	wire [15:0] pwm_reg2;
	wire [15:0] pwm_reg3;
	wire [15:0] pwm_reg4;
	wire [15:0] pwm_reg5;
	wire [15:0] pwm_reg6;
	wire [15:0] pwm_reg7;
	
	reg [15:0] mem [0:1023];

	// Instantiate the Unit Under Test (UUT)
	Core uut (
		.clk(clk), 
		.rst(rst), 
		.mem_to_core_data(mem_to_core_data), 
		.core_to_mem_data(core_to_mem_data), 
		.core_to_mem_address(core_to_mem_address), 
		.core_to_mem_write_enable(core_to_mem_write_enable), 
		.i2c_wr_en(i2c_wr_en), 
		.i2c_sts(i2c_sts), 
		.i2c_to_core_data(i2c_to_core_data), 
		.core_to_i2c_data(core_to_i2c_data), 
		.i2c_reg_addr(i2c_reg_addr), 
		.i2c_addr(i2c_addr), 
		.pwm_reg0(pwm_reg0), 
		.pwm_reg1(pwm_reg1), 
		.pwm_reg2(pwm_reg2), 
		.pwm_reg3(pwm_reg3), 
		.pwm_reg4(pwm_reg4), 
		.pwm_reg5(pwm_reg5), 
		.pwm_reg6(pwm_reg6), 
		.pwm_reg7(pwm_reg7)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		//mem_to_core_data = 0;
		i2c_wr_en = 0;
		i2c_sts = 0;
		i2c_to_core_data = 0;
		
		// make memory
		mem[0]	= 16'b0100_1111_0010_0000;	
		mem[1]	= 16'b0100_1000_1111_1111;	
		mem[2]	= 16'b0101_1000_0000_0000;	
		mem[3]	= 16'b0100_0100_0000_1100;	
		mem[4]	= 16'b0010_0000_0100_0100; 
		mem[5]	= 16'b1001_0001_1000_1000;	
		mem[6]	= 16'b0100_0111_0000_0001;	
		mem[7]	= 16'b1101_0000_0001_0000;	
		mem[8]	= 16'b0011_1000_1111_1000;	
		mem[9]	= 16'b0100_0010_0000_0001;	
		mem[10] = 16'b1011_1000_1000_0010;	
		mem[11] = 16'b0011_0000_1111_0111;		
		mem[12] = 16'b0100_0010_0000_0001;	
		mem[13] = 16'b1010_1111_1111_0010;	
		mem[14] = 16'b0001_1111_0000_0011;	
		mem[15] = 16'b0100_0011_0001_0001;	
		mem[16] = 16'b0100_0001_1111_1111;	
		mem[17] = 16'b1101_0000_0001_0000;	
		mem[18] = 16'b0011_1000_0000_0010;	
		mem[19] = 16'b1011_0001_0001_0010;	
		mem[20] = 16'b0010_0000_0000_0011;	
		mem[21] = 16'b0000_1111_0000_0011;	
		mem[22] = 16'b1011_1111_1111_0010;	
		mem[23] = 16'b0010_0000_0000_0101;

		// Wait 100 ns for global reset to finish
		#100;
		#11;
		rst = 1;
		#502 rst = 0;
        
		// Add stimulus here

	end
	
	assign mem_to_core_data = mem[core_to_mem_address];
	always @(posedge clk)
	begin
		if(core_to_mem_write_enable) begin
			mem[core_to_mem_address] = core_to_mem_data;
		end
	end
	always begin #50 assign clk = ~clk; end   
      
endmodule

