`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:07:39 11/08/2018 
// Design Name: 
// Module Name:    I2C_state_controller 
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
module I2C_state_controller(
	input				clock,
	input				reset,
	input 				req_next,
	input				ack_failed,
	input [8:0]			dev_address_s,
	input [7:0] 		reg_address_s,
	input [7:0] 		data_s,
	
	output reg [2:0]	send_next_state,
	output reg [7:0]	send_byte_data);
	 
	parameter get_state		= 3'd0;
	parameter start	 		= 3'd1;
	parameter send_one	 	= 3'd2;
	parameter repeat_start	= 3'd3;
	parameter stop	 		= 3'd4;
	parameter send_byte		= 3'd5;
	parameter receive_byte	= 3'd6;

	reg [3:0] state_list = 4'd0;
	
	always@ (reset, state_list, dev_address_s[8], data_s, reg_address_s)
	begin
		if (reset)
			begin
				send_byte_data = 0;
				send_next_state = 0;
			end
			
		else
			case (state_list)
				0 	: if (dev_address_s[8])  																		// stay in get state until start signal is sent
							begin send_next_state = start;		send_byte_data = 0; 							end
						else
							begin send_next_state = get_state;	send_byte_data = 0;								end
			
				1 	: begin send_next_state = send_byte; 		send_byte_data = {dev_address_s[7:1], 1'b0}; 	end // send device_address + write bit 0
				
				2 	: begin send_next_state = send_byte; 		send_byte_data = reg_address_s[7:0]; 			end	// send register address 
				
				3 	: begin send_next_state = send_byte;		send_byte_data = data_s[7:0]; 					end	// send data byte
			
				4 	: begin send_next_state = repeat_start;  	send_byte_data = 0;								end	// send repeat start (for read)
			
				5 	: begin send_next_state = send_byte; 		send_byte_data = {dev_address_s[7:1], 1'b1}; 	end // send device_address + read bit 1
					
				6	: begin send_next_state = receive_byte;		send_byte_data = 0;								end	// read byte
			
				7 	: begin send_next_state = send_one;  		send_byte_data = 0;								end	// send NACK back to accelerometer

				8 	: begin send_next_state = stop;				send_byte_data = 0;								end	// send stop bit
			
				default : begin send_next_state = get_state; send_byte_data = 0;								end
			endcase
		end
		
	always@ (posedge clock)
		begin
			if (ack_failed)
				state_list <= 4'd7;
			if (req_next)
				if (state_list == 4'd2 && dev_address_s[0])				// if this is a read, skip writing byte
					state_list <= 4'd4;
				else if (state_list == 4'd3 && !dev_address_s[0])		// if this is a write, skip repeat start and read
					state_list <= 4'd8;
				else if (state_list == 4'd8)
					state_list <= 4'd0;
				else
					state_list <= state_list + 1'b1;
		end
	
	
endmodule
