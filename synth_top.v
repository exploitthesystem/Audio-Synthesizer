synth_top(
   input        clk,
   input        rst_n,
   input        enable,
   input  [9:0] data_rx_1,
   input  [9:0] data_rx_2,
   output [9:0] data_tx_2
);

subcomponent subcomponent_instance_name (
  clk, rst_n, data_rx_1, data_tx ); 


counter c1(	
			.clk 				(),
			.reset				(), 
			.count_to			(),
			.count      		()
		  );

pwm p0	  (	
			.clk				(), 
			.reset				(), 
			.pwm_reg			(),
			.pwm_out			()
		  );

pwm p1	  (	
			.clk				(), 
			.reset				(), 
			.pwm_reg			(),
			.pwm_out			()
		  );

pwm p2	  (	
			.clk				(), 
			.reset				(), 
			.pwm_reg			(),
			.pwm_out			()
		  );

pwm p3	  (	
			.clk				(), 
			.reset				(), 
			.pwm_reg			(),
			.pwm_out			()
		  );

pwm p4	  (	
			.clk				(), 
			.reset				(), 
			.pwm_reg			(),
			.pwm_out			()
		  );

pwm p5	  (	
			.clk				(), 
			.reset				(), 
			.pwm_reg			(),
			.pwm_out			()
		  );

pwm p6	  (	
			.clk				(), 
			.reset				(), 
			.pwm_reg			(),
			.pwm_out			()
		  );

pwm p7	  (	
			.clk				(), 
			.reset				(), 
			.pwm_reg			(),
			.pwm_out			()
		  );


I2C_state_controller i2c(
			.clock				(),
			.reset				(),
			.req_next			(),
			.ack_failed			(),
			.dev_address_s		(),
			.reg_address_s		(),
			.data_s				(),
	
			.send_next_state	(),
			.send_byte_data		()
			);



endmodule
