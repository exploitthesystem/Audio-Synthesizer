`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:05:44 11/08/2018 
// Design Name: 
// Module Name:    i2c_test 
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
module i2c_test(  
	input 					clock,
	input 					reset,
	input			[8:0]	device_address,
	input			[7:0]	reg_address,
	input			[7:0]	data_in,
	
	inout 					serial_data_line,
	inout 					serial_clock_line,
	
	output reg	[7:0]		data_out,
	output reg  [1:0] 		i2c_status,
	output reg				WE);

	parameter get_state		= 3'd0;
	parameter start_bit 	= 3'd1;
	parameter send_one	 	= 3'd2;
	parameter repeat_start	= 3'd3;
	parameter stop_bit 		= 3'd4;	
	parameter send_byte		= 3'd5;
	parameter receive_byte	= 3'd6;
	

	wire SDA_read;
	wire SCL_read;
	reg SDA_low = 0;
	reg SCL_low = 0;
	
	assign serial_data_line 	= SDA_low ? 1'b0 : 1'bz;
	assign serial_clock_line 	= SCL_low ? 1'b0 : 1'bz;
	assign SDA_read = serial_data_line;
	assign SCL_read = serial_clock_line;
	

	reg [2:0] 	state = get_state;
	reg [2:0] 	next_state = get_state;
	reg [9:0] 	counter = 0;
	reg [5:0] 	sample_counter = 0;
	reg		 	ended = 0;
	
	
	wire [2:0] 	next_state_s;
	wire [7:0] 	send_byte_data;
	
	reg request_next_state = 0;
	reg ack_failed;
	

	I2C_state_controller i2c_state ( 	.clock				(clock),
										.reset				(reset),
										.req_next			(request_next_state),
										.ack_failed			(ack_failed),
										.dev_address_s   	(device_address),
										.reg_address_s		(reg_address),
										.data_s				(data_in),
										.send_next_state	(next_state_s),
										.send_byte_data		(send_byte_data));
												
	always@ (reset, state, ended, get_state, device_address[8], next_state_s)
	begin
		if (reset)
			begin
				next_state = get_state;
				request_next_state = 0;
			end
		else
			case (state)
				get_state	: 	begin	next_state = device_address[8] ? next_state_s : get_state;		request_next_state = 0;		end
				start_bit	: 	begin	next_state = ended ? get_state : start_bit;						request_next_state = ended;	end
				send_one	:	begin	next_state = ended ? get_state : send_one;						request_next_state = ended;	end
				repeat_start: 	begin	next_state = ended ? get_state : repeat_start;					request_next_state = ended;	end
				stop_bit	:	begin	next_state = ended ? get_state : stop_bit;						request_next_state = ended;	end
				send_byte	: 	begin	next_state = ended ? get_state : send_byte;						request_next_state = ended;	end
				receive_byte:	begin	next_state = ended ? get_state : receive_byte;					request_next_state = ended;	end
				default		:	begin	next_state = get_state;											request_next_state = 0;		end
			endcase
	end

	always@ (posedge clock)
	begin	
			state <= next_state;
	end

	
	always@ (posedge clock)
		case (state)
			get_state:
				begin
					counter 	<= 10'd0;
					ended 		<= 1'b0;
					WE			<= 1'b0;
					i2c_status 	<= 2'b01;
				end
				
			start_bit:
				begin
					SDA_low <= 1;
					if (counter == 10'd41)  // min start hold time is 4 us
						begin
							SCL_low <= 1;
							ended 	<= 1'b1;
							counter <= 10'd0;
							data_out [7:0] <= data_in [7:0];
						end
					else
						counter <= counter + 1'b1;
				end
				
			send_one: 
				begin
					if (counter == 10'd1)
						SDA_low <= 0;			// min setup time is 250 ns - met by setting data immediately
					if (counter == 10'd51)  // min SCL low is 4.7 us
						SCL_low <= 0;
					if (counter == 10'd92)  // min high period is 4.0 us
						SCL_low <= 1;
					if (counter == 10'd101) // min data hold is 300 ns (to account for max SCL fall time) 
						begin						// min clock period is 10 us
							counter 	<= 10'd0;
							ended 	<= 1'b1;
						end
					else
						counter <= counter + 1'b1;
				end
			
			send_byte:
				begin
					// send MSB 
					if (counter == 10'd1)
						SDA_low <= !send_byte_data[7];
					if (counter == 10'd51)
						SCL_low <= 0;
					if (counter == 10'd92)
						SCL_low <= 1;
						
					// send bit six
					if (counter == 10'd101)
						SDA_low <= !send_byte_data[6];
					if (counter == 10'd151)
						SCL_low <= 0;
					if (counter == 10'd192)
						SCL_low <= 1;
						
					// send bit five
					if (counter == 10'd201)
						SDA_low <= !send_byte_data[5];
					if (counter == 10'd251)
						SCL_low <= 0;
					if (counter == 10'd292)
						SCL_low <= 1;
						
					// send bit four
					if (counter == 10'd301)
						SDA_low <= !send_byte_data[4];
					if (counter == 10'd351)
						SCL_low <= 0;
					if (counter == 10'd392)
						SCL_low <= 1;

					// send bit three
					if (counter == 10'd401)
						SDA_low <= !send_byte_data[3];
					if (counter == 10'd451)
						SCL_low <= 0;
					if (counter == 10'd492)
						SCL_low <= 1;		

					// send bit two
					if (counter == 10'd501)
						SDA_low <= !send_byte_data[2];
					if (counter == 10'd551)
						SCL_low <= 0;
					if (counter == 10'd592)
						SCL_low <= 1;	

					// send bit one
					if (counter == 10'd601)
						SDA_low <= !send_byte_data[1];
					if (counter == 10'd651)
						SCL_low <= 0;
					if (counter == 10'd692)
						SCL_low <= 1;	

					// send LSB
					if (counter == 10'd701)
						SDA_low <= !send_byte_data[0];
					if (counter == 10'd751)
						SCL_low <= 0;
					if (counter == 10'd792)
						SCL_low <= 1;		

					// get ack
					if (counter == 10'd801)
						SDA_low <= 0;
					if (counter == 10'd851)
						begin
							SCL_low <= 0;
							sample_counter <= 6'd0;
						end
					if (counter == 10'd892)
						begin
							SCL_low <= 1;			
							counter <= 10'd0;
							ended 	<= 1;
							if (sample_counter > 30)
								ack_failed <= 1;
							else
								ack_failed <= 0;
						end
						
					else
						if (SCL_low || SCL_read)			// Check for clock extension and do not increment if !SCL_low && !SCL_read
							begin
								counter <= counter + 1'b1;
								if (SDA_read)
									sample_counter <= sample_counter + 1'b1;
							end
				end
			
			receive_byte :
				begin
					SDA_low <= 0;
					
					// receive MSB
					if (counter == 10'd51)
						begin
							SCL_low <= 0;
							sample_counter <= 6'd0;
						end
					if (counter == 10'd101)
						begin
							SCL_low <= 1;
							data_out [7] <= (sample_counter > 30) ? 1'b1 : 1'b0;
						end						
						
					// receive bit six
					if (counter == 10'd151)
						begin
							SCL_low <= 0;
							sample_counter <= 6'd0;
						end
					if (counter == 10'd201)
						begin
							SCL_low <= 1;
							data_out [6] <= (sample_counter > 30) ? 1'b1 : 1'b0;
						end		

					// receive bit five
					if (counter == 10'd251)
						begin
							SCL_low <= 0;
							sample_counter <= 6'd0;
						end
					if (counter == 10'd301)
						begin
							SCL_low <= 1;							
							data_out [5] <= (sample_counter > 30) ? 1'b1 : 1'b0;
						end			

					// receive bit four
					if (counter == 10'd351)
						begin
							SCL_low <= 0;
							sample_counter <= 6'd0;
						end
					if (counter == 10'd401)
						begin
							SCL_low <= 1;
							data_out [4] <= (sample_counter > 30) ? 1'b1 : 1'b0;
						end	

					// receive bit three
					if (counter == 10'd451)
						begin
							SCL_low <= 0;
							sample_counter <= 6'd0;
						end
					if (counter == 10'd501)
						begin
							SCL_low <= 1;
							data_out [3] <= (sample_counter > 30) ? 1'b1 : 1'b0;
						end	

					// receive bit two
					if (counter == 10'd551)
						begin
							SCL_low <= 0;
							sample_counter <= 6'd0;
						end
					if (counter == 10'd601)
						begin
							SCL_low <= 1;
							data_out [2] <= (sample_counter > 30) ? 1'b1 : 1'b0;
						end	

					// receive bit one
					if (counter == 10'd651)
						begin
							SCL_low <= 0;
							sample_counter <= 6'd0;
						end
					if (counter == 10'd701)
						begin
							SCL_low <= 1;
							data_out [1] <= (sample_counter > 30) ? 1'b1 : 1'b0;
						end

					// receive LSB
					if (counter == 10'd751)
						begin
							SCL_low <= 0;
							sample_counter <= 6'd0;
						end
					if (counter == 10'd801)
						begin
							SCL_low <= 1;
							counter <= 10'd0;
							ended <= 1;
							data_out [0] <= (sample_counter > 30) ? 1'b1 : 1'b0;
						end	
					else
						if (SCL_low || SCL_read)			// Check for clock extension and do not increment if !SCL_low && !SCL_read
							begin
								counter <= counter + 1'b1;
								if (SDA_read)
									sample_counter <= sample_counter + 1'b1;
							end
				end

				
			repeat_start:
				begin
					if (counter == 10'd1)
						SDA_low <= 1;
					if (counter == 10'd51)
						SDA_low <= 0;
					if (counter == 10'd101) 
						SCL_low <= 0;
					if (counter == 10'd151) 		// Min setup time for repeat start is 4.7 us
						SDA_low <= 1;
					if (counter == 10'd201) 
						begin
							SCL_low <= 1;
							counter <= 10'd0;
							ended <= 1'b1;
						end
					else
						counter <= counter + 1'b1;
				end
				
			stop_bit: 
				begin
					if (counter == 10'd1)
						SDA_low <= 1;
					if (counter == 10'd51) 
						SCL_low <= 0;
					if (counter == 10'd101) 		// min setup time for stop is 4.0 us
						begin
							SDA_low <= 0;
							i2c_status <= {ack_failed, 1'b0};
							WE <= 1'b1;
						end
					if (counter == 10'd103)
						WE <= 1'b0;
					if (counter == 10'd151)			//  min wait period between i2c communications is 4.7 us
						begin
							counter <= 10'd0;
							ended <= 1'b1;
						end
					else
						counter <= counter + 1'b1;
				end

			default:
				begin
					ended <= 1'b1;
					counter <= 10'd0;
				end
		endcase
	
endmodule
