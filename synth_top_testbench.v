`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:51:55 11/27/2018
// Design Name:   synth_top
// Module Name:   C:/Users/gordb/Documents/git/Audio-Synthesizer/synth_top_testbench.v
// Project Name:  Audio-Synthesizer
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: synth_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module synth_top_testbench;

	// Inputs
	reg reset_io;
	reg clk_io;
	reg [15:0] data_in_io;

	// Outputs
	wire core_to_mem_enable_io;
	wire [9:0] addr_out_io;
	wire [15:0] data_out_io;
	wire pwm0_io;
	wire pwm1_io;
	wire pwm2_io;
	wire pwm3_io;
	wire pwm4_io;
	wire pwm5_io;
	wire pwm6_io;
	wire pwm7_io;
	
	reg [15:0] mem [0:1023];

	// Bidirs
	wire sda_io;
	wire scl_io;

	// Instantiate the Unit Under Test (UUT)
	synth_top uut (
		.reset_io(reset_io), 
		.clk_io(clk_io), 
		.data_in_io(data_in_io), 
		.data_out_io(data_out_io), 
		.addr_out_io(addr_out_io), 
		.core_to_mem_enable_io(core_to_mem_enable_io), 
		.sda_io(sda_io), 
		.scl_io(scl_io), 
		.pwm0_io(pwm0_io), 
		.pwm1_io(pwm1_io), 
		.pwm2_io(pwm2_io), 
		.pwm3_io(pwm3_io), 
		.pwm4_io(pwm4_io), 
		.pwm5_io(pwm5_io), 
		.pwm6_io(pwm6_io), 
		.pwm7_io(pwm7_io)
	);

	initial begin
		// Initialize Inputs
		reset_io = 0;
		clk_io = 0;
		data_in_io = 0;

		// make memory
		//* program to test PWM
		mem[0]	= 16'b0100_1111_0010_0000;	
		mem[1]	= 16'b0100_1000_1111_1111;	
		mem[2]	= 16'b0101_1000_0000_0000;	
		mem[3]	= 16'b0100_0100_0000_1100;	
		mem[4]	= 16'b0010_0000_0100_0100; 
		mem[5]	= 16'b1001_0001_1000_0000;	
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
		/*end of test PWM */

		/* program to test I2C
		mem[0]	= 16'b0100_0110_0101_1000;	
		mem[1]	= 16'b0100_0111_0010_0001;	
		mem[2]	= 16'b0101_0111_1111_0001;	
		mem[3]	= 16'b0101_0110_0000_0001;
		/*end of test I2C */

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#11;
		reset_io = 1;
		#502 reset_io = 0;

	end

	// read from memory
	always @(*)
	begin
		data_in_io = mem[addr_out_io];
	end
	
	//write to memory
	always @(posedge clk_io)
	begin
		if(core_to_mem_enable_io) begin
			mem[addr_out_io] = data_out_io;
		end
	end

	// run 10 MHz clock
	always begin #50 assign clk_io = ~clk_io; end 
endmodule

