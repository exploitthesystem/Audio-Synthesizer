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
module I2C(
	input 				clock,
	input 				reset,
	input			[8:0]	device_address,
	input			[7:0]	reg_address,
	input			[7:0]	data_in,
	
	input 				sda_read,
	input 				scl_read,

	output reg			sda_out,
	output reg			scl_out,	
	output reg		[7:0]	data_out,
	output reg  		[1:0] 	i2c_status,
	output reg			WE);

	parameter get_state	= 3'd0;
	parameter start_bit 	= 3'd1;
	parameter send_one	= 3'd2;
	parameter repeat_start	= 3'd3;
	parameter stop_bit 	= 3'd4;	
	parameter send_byte	= 3'd5;
	parameter receive_byte	= 3'd6;


	reg [2:0] 	state;
	reg [2:0] 	next_state;
	reg [9:0] 	counter;
	reg [5:0] 	sample_counter;
	reg		ended;
	
	
	wire [2:0] 	next_state_s;
	wire [7:0] 	send_byte_data;
	
	reg request_next_state;
	reg ack_failed;
	

	I2C_state_controller i2c_state ( 	.clock			(clock),
						.reset			(reset),
						.req_next		(request_next_state),
						.ack_failed		(ack_failed),
						.dev_address_s   	(device_address),
						.reg_address_s		(reg_address),
						.data_s			(data_in),
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
				start_bit	: 	begin	next_state = ended ? get_state : start_bit;				request_next_state = ended;	end
				send_one	:	begin	next_state = ended ? get_state : send_one;				request_next_state = ended;	end
				repeat_start	: 	begin	next_state = ended ? get_state : repeat_start;				request_next_state = ended;	end
				stop_bit	:	begin	next_state = ended ? get_state : stop_bit;				request_next_state = ended;	end
				send_byte	: 	begin	next_state = ended ? get_state : send_byte;				request_next_state = ended;	end
				receive_byte	:	begin	next_state = ended ? get_state : receive_byte;				request_next_state = ended;	end
				default		:	begin	next_state = get_state;							request_next_state = 0;		end
			endcase
	end

	always@ (posedge clock)
	begin	
			state <= next_state;
	end

	
	always@ (posedge clock)
	begin

		state <= next_state;

		case (state)
			get_state:
				begin
					counter 	<= 10'd0;
					ended 		<= 1'b0;
					WE		<= 1'b0;
					sample_counter	<= 6'b0;
				end
				
			start_bit:
				begin
					sda_out <= 0;
					i2c_status[1:0] 	<= 2'b1;
					if (counter == 10'd41)  // min start hold time is 4 us
						begin
							scl_out <= 0;
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
						sda_out <= 1;			// min setup time is 250 ns - met by setting data immediately
					if (counter == 10'd51)  // min SCL low is 4.7 us
						scl_out <= 1;
					if (counter == 10'd92)  // min high period is 4.0 us
						scl_out <= 0;
					if (counter == 10'd101) // min data hold is 300 ns (to account for max SCL fall time) 
						begin						// min clock period is 10 us
							counter <= 10'd0;
							ended 	<= 1'b1;
						end
					else
						counter <= counter + 1'b1;
				end
			
			send_byte:
				begin
					case (counter)
						10'd1	: sda_out <= send_byte_data[7];	// send MSB
						10'd51	: scl_out <= 1;
						10'd95	: scl_out <= 0;			

						10'd101	: sda_out <= send_byte_data[6];	// send bit six
						10'd151	: scl_out <= 1;
						10'd195	: scl_out <= 0;	
								
						10'd201	: sda_out <= send_byte_data[5];	// send bit five
						10'd251	: scl_out <= 1;
						10'd295	: scl_out <= 0;	

						10'd301	: sda_out <= send_byte_data[4];	// send bit four
						10'd351	: scl_out <= 1;
						10'd395	: scl_out <= 0;	

						10'd401	: sda_out <= send_byte_data[3];	// send bit three
						10'd451	: scl_out <= 1;
						10'd495	: scl_out <= 0;	

						10'd501	: sda_out <= send_byte_data[2];	// send bit two
						10'd551	: scl_out <= 1;
						10'd595	: scl_out <= 0;	

						10'd601	: sda_out <= send_byte_data[1];	// send bit one
						10'd651	: scl_out <= 1;
						10'd695	: scl_out <= 0;	

						10'd701	: sda_out <= send_byte_data[0];	// send LSB
						10'd751	: scl_out <= 1;
						10'd795	: scl_out <= 0;			

						10'd801 : sda_out <= 1;			// receive ack
						10'd851	: begin scl_out <= 1;	sample_counter <= 6'd0;		end
						10'd895	: begin 
								scl_out <= 0;
								if (sample_counter > 30)
									begin
										ack_failed 	<= 1;
										i2c_status[1] 	<= 1'b1;							
									end
								else
									ack_failed <= 0;
							  end
						10'd900	: begin ack_failed <= 0;	ended <= 1;		end

						default : if ((!scl_out || scl_read) && sda_read) 
								sample_counter <= sample_counter + 1'b1;	
					endcase
					
					if (!scl_out || scl_read)	
						counter <= counter + 1'b1;
				end
			
			receive_byte :
				begin
					case (counter)
						10'd51	: begin scl_out <= 1;	sample_counter <= 6'd0;					end // receive MSB
						10'd101	: begin	scl_out <= 0;	data_out [7] <= (sample_counter > 30) ? 1'b1 : 1'b0;	end 

						10'd151	: begin	scl_out <= 1;	sample_counter <= 6'd0;					end // receive bit six
						10'd201	: begin	scl_out <= 0;	data_out [6] <= (sample_counter > 30) ? 1'b1 : 1'b0;	end 

						10'd251	: begin	scl_out <= 1;	sample_counter <= 6'd0;					end // receive bit five
						10'd301	: begin	scl_out <= 0;	data_out [5] <= (sample_counter > 30) ? 1'b1 : 1'b0;	end 

						10'd351	: begin	scl_out <= 1;	sample_counter <= 6'd0;					end // receive bit four
						10'd401	: begin	scl_out <= 0;	data_out [4] <= (sample_counter > 30) ? 1'b1 : 1'b0;	end 

						10'd451	: begin	scl_out <= 1;	sample_counter <= 6'd0;					end // receive bit three
						10'd501	: begin	scl_out <= 0;	data_out [3] <= (sample_counter > 30) ? 1'b1 : 1'b0;	end 

						10'd551	: begin	scl_out <= 1;	sample_counter <= 6'd0;					end // receive bit two
						10'd601	: begin	scl_out <= 0;	data_out [2] <= (sample_counter > 30) ? 1'b1 : 1'b0;	end 

						10'd651	: begin	scl_out <= 1;	sample_counter <= 6'd0;					end // receive bit one
						10'd701	: begin	scl_out <= 0;	data_out [1] <= (sample_counter > 30) ? 1'b1 : 1'b0;	end 

						10'd751	: begin	scl_out <= 1;	sample_counter <= 6'd0;					end // receive bit LSB
						10'd801	: begin	scl_out <= 0;	data_out [0] <= (sample_counter > 30) ? 1'b1 : 1'b0;	ended <= 1;		end	

						default : if ((!scl_out || scl_read) && sda_read) 
								sample_counter <= sample_counter + 1'b1;	
					endcase
					
					if (!scl_out || scl_read)	
						counter <= counter + 1'b1;
				end

				
			repeat_start:
				begin
					if (counter == 10'd1)
						sda_out <= 1;
					if (counter == 10'd51) 
						scl_out <= 1;
					if (counter == 10'd101) 		// Min setup time for repeat start is 4.7 us
						sda_out <= 0;
					if (counter == 10'd151) 
						begin
							scl_out <= 0;
							counter <= 10'd0;
							ended <= 1'b1;
						end
					else
						counter <= counter + 1'b1;
				end
				
			stop_bit: 
				begin
					if (counter == 10'd1)
						sda_out <= 0;
					if (counter == 10'd51) 
						scl_out <= 1;
					if (counter == 10'd101) 		// min setup time for stop is 4.0 us
						begin
							i2c_status[0] <= 1'b0;
							sda_out <= 1;
						end
					if (counter == 10'd150)
						WE <= 1'b1;
					if (counter == 10'd151)			//  min wait period between i2c communications is 4.7 us
						begin
							counter <= 10'd0;
							WE <= 1'b0;
							i2c_status[1] <= 1'b0;
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
	end
	
endmodule
