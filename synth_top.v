module synth_top(
 inout		  	vdd_pad_io,	
 inout		  	vss_pad_io,	 
 input 		  	reset_io,
 input		  	clk_io,	 
 input [15:0] 	data_in_io,
 output [15:0] 	data_out_io, 
 input [9:0]  	addr_out_io,
 input 			core_to_mem_enable_io,
 inout		  	sda_io,
 inout		  	scl_io,
 output 		pwm0_io,
 output 		pwm1_io,
 output 		pwm2_io,
 output 		pwm3_io,
 output 		pwm4_io,
 output 		pwm5_io,
 output 		pwm6_io,
 output 		pwm7_io
);

wire [1:0]		i2c_sts_wire;
wire [7:0]		i2c_addr_wire;
wire [15:0]		core_to_r0;
wire [15:0]		core_to_r1;
wire [15:0]		core_to_r2;
wire [15:0]		core_to_r3;
wire [15:0]		core_to_r4;
wire [15:0]		core_to_r5;
wire [15:0]		core_to_r6;
wire [15:0]		core_to_r7;
wire 			i2c_to_core_WE;
wire [7:0]		i2c_to_core_data_wire;
wire [7:0]		core_to_i2c_data_wire;
wire [7:0]		i2c_to_core_reg_addr_wire;

/*
subcomponent subcomponent_instance_name (
  clk,
  rst_n,
  data_rx_1,
  data_tx 
  ); 
  */

Core c1(
  .clk							(clk_io),
  .rst							(reset_io),
  .mem_to_core_data				(data_in_io),          // instruction
  .core_to_mem_data				(data_out_io),          // data at address
  .core_to_mem_address			(addr_out_io),       	 // address of instruction
  .core_to_mem_write_enable		(core_to_mem_enable_io), 		 // memory write enable
  .i2c_sts						(i2c_sts_wire),
  .i2c_to_core_data				(i2c_to_core_data_wire),    
  .core_to_12c_data				(core_to_i2c_data_wire),      
  .i2c_reg_addr					(i2c_to_core_reg_addr_wire),    
  .i2c_addr						(i2c_addr_wire),
  .pwm_reg0						(core_to_r0),
  .pwm_reg1						(core_to_r1),
  .pwm_reg2						(core_to_r2),
  .pwm_reg3						(core_to_r3),
  .pwm_reg4						(core_to_r4),
  .pwm_reg5						(core_to_r5),
  .pwm_reg6						(core_to_r6),
  .pwm_reg7						(core_to_r7));

  		


pwm p0	  (	
			.clk				(clk_io), 
			.reset				(reset_io), 
			.pwm_reg			(core_to_r0),
			.pwm_out			(pwm0_io)
		  );

pwm p1	  (	
			.clk				(clk_io), 
			.reset				(reset_io), 
			.pwm_reg			(core_to_r1),
			.pwm_out			(pwm1_io)
		  );

pwm p2	  (	
			.clk				(clk_io), 
			.reset				(reset_io), 
			.pwm_reg			(core_to_r2),
			.pwm_out			(pwm2_io)
		  );

pwm p3	  (	
			.clk				(clk_io), 
			.reset				(reset_io), 
			.pwm_reg			(core_to_r3),
			.pwm_out			(pwm3_io)
		  );

pwm p4	  (	
			.clk				(clk_io), 
			.reset				(reset_io), 
			.pwm_reg			(core_to_r4),
			.pwm_out			(pwm4_io)
		  );

pwm p5	  (	
			.clk				(clk_io), 
			.reset				(reset_io), 
			.pwm_reg			(core_to_r5),
			.pwm_out			(pwm5_io)
		  );

pwm p6	  (	
			.clk				(clk_io), 
			.reset				(reset_io), 
			.pwm_reg			(core_to_r6),
			.pwm_out			(pwm6_io)
		  );

pwm p7	  (	
			.clk				(clk_io), 
			.reset				(reset_io), 
			.pwm_reg			(core_to_r7),
			.pwm_out			(pwm7_io)
		  );


i2c_test(  
			.clock				(clk_io),
			.reset				(reset_io),
			.device_address		(i2c_addr_wire),
			.reg_address		(i2c_to_core_reg_addr_wire),
			.data_in			(core_to_i2c_data_wire),
	
			.serial_data_line	(sda_io),
			.serial_clock_line	(scl_io),
	
			.data_out			(i2c_to_core_data_wire),
			.i2c_status			(i2c_sts_wire),
			.WE				    (i2c_to_core_WE)
			);


endmodule
