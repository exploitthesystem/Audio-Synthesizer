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
	reg reset_io_p;
	reg clk_io_p;
	reg [15:0] data_in_io_p;

	// Outputs
	wire core_to_mem_enable_io_p;
	wire [9:0] addr_out_io_p;
	wire [15:0] data_out_io_p;
	wire pwm0_io_p;
	wire pwm1_io_p;
	wire pwm2_io_p;
	wire pwm3_io_p;
	wire pwm4_io_p;
	wire pwm5_io_p;
	wire pwm6_io_p;
	wire pwm7_io_p;
	
	reg [15:0] mem [0:1023];

	// Bidirs
	wire sda_io_p;
	wire scl_io_p;


/*
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

*/

synth_top_top uut(
	.reset_io(reset_io), 
	.clk_io(clk_io_p), 
	.data_in_io(data_in_io_p), 
	.data_out_io(data_out_io_p), 
	.addr_out_io(addr_out_io_p), 
	.core_to_mem_enable_io(core_to_mem_enable_io_p), 
	.sda_io(sda_io_p), 
	.scl_io(scl_io_p), 
	.pwm0_io(pwm0_io_p), 
	.pwm1_io(pwm1_io_p), 
	.pwm2_io(pwm2_io_p), 
	.pwm3_io(pwm3_io_p), 
	.pwm4_io(pwm4_io_p), 
	.pwm5_io(pwm5_io_p), 
	.pwm6_io(pwm6_io_p), 
	.pwm7_io(pwm7_io_p)
);



	initial begin
		// Initialize Inputs
		reset_io_p = 0;
		clk_io_p = 0;
		data_in_io_p = 0;

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
		reset_io_p = 1;
		#502 reset_io_p = 0;

	end

	// read from memory
	always @(*)
	begin
		data_in_io_p = mem[addr_out_io_p];
	end
	
	//write to memory
	always @(posedge clk_io_p)
	begin
		if(core_to_mem_enable_io_p) begin
			mem[addr_out_io_p] = data_out_io_p;
		end
	end

	// run 10 MHz clock
	always begin #50 assign clk_io_p = ~clk_io_p; end 
endmodule

