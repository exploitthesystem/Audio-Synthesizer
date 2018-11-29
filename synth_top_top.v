/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Tue Nov 20 18:07:23 2018
/////////////////////////////////////////////////////////////


module synth_top_top ( 
	input 		  	reset_io_pad,
 	input		  	clk_io_pad,	 
 	input  			data_in_io_pad0,
 	input  			data_in_io_pad1,
 	input  			data_in_io_pad2,
 	input  			data_in_io_pad3,
 	input  			data_in_io_pad4,
 	input  			data_in_io_pad5,
 	input  			data_in_io_pad6,
 	input  			data_in_io_pad7,
 	input  			data_in_io_pad8,
 	input  			data_in_io_pad9,
 	input  			data_in_io_pad10,
 	input  			data_in_io_pad11,
 	input  			data_in_io_pad12,
 	input  			data_in_io_pad13,
 	input  			data_in_io_pad14,
 	input  			data_in_io_pad15,

 	output 		 	data_out_io_pad0, 
 	output 		 	data_out_io_pad1, 
 	output 		 	data_out_io_pad2, 
 	output 		 	data_out_io_pad3, 
 	output 		 	data_out_io_pad4, 
 	output 		 	data_out_io_pad5, 
 	output 		 	data_out_io_pad6, 
 	output 		 	data_out_io_pad7, 
 	output 		 	data_out_io_pad8, 
 	output 		 	data_out_io_pad9, 
 	output 		 	data_out_io_pad10, 
 	output 		 	data_out_io_pad11, 
 	output 		 	data_out_io_pad12, 
 	output 		 	data_out_io_pad13, 
 	output 		 	data_out_io_pad14, 
 	output 		 	data_out_io_pad15, 
 	output 		 	data_out_io_pad16, 

 	output		  	addr_out_io_pad0,
 	output		  	addr_out_io_pad1,
 	output		  	addr_out_io_pad2,
 	output		  	addr_out_io_pad3,
 	output		  	addr_out_io_pad4,
 	output		  	addr_out_io_pad5,
 	output		  	addr_out_io_pad6,
 	output		  	addr_out_io_pad7,
 	output		  	addr_out_io_pad8,
 	output		  	addr_out_io_pad9,

 	input 			core_to_mem_enable_io_pad,
 	inout		  	sda_io_pad,
 	inout		  	scl_io_pad,
 	output 			pwm0_io_pad,
 	output 			pwm1_io_pad,
 	output 			pwm2_io_pad,
 	output 			pwm3_io_pad,
 	output 			pwm4_io_pad,
 	output 			pwm5_io_pad,
 	output 			pwm6_io_pad,
 	output 			pwm7_io_pad
 	);



wire vdd_w;
wire vss_w;
wire gnd_w;
wire reset_io_w;
wire clk_io_w;

wire [15:0] data_in_io_w;
wire [15:0] data_out_io_w; 
wire [9:0] addr_out_io_w;

wire core_to_mem_enable_io_w;
wire data_out_io_pad_w;
wire pwm0_io_w;
wire pwm1_io_w;
wire pwm2_io_w;
wire pwm3_io_w;
wire pwm4_io_w;
wire pwm5_io_w;
wire pwm6_io_w;
wire pwm7_io_w;

wire sda_out;
wire scl_out;
wire sda_read;
wire scl_read;

/*
module pad_bi_dir(
	input going_out, // signal going out of chip - yes this is an input to this module
	output pad,
	input en,
	output coming_in);  // signal going into chip to be read by i2c module
*/

pad_bi_dir sda_bi(
				.going_out(sda_out),
				.pad(sda_io_pad),
				.coming_in(sda_read)
	);

pad_bi_dir scl_bi(
				.going_out(scl_out),
				.pad(scl_io_pad),
				.coming_in(scl_read)
	);

pad_in pad_in1 (.pad(	reset_io_pad			),			 	.DataIn(reset_io_w));
pad_in pad_in2 (.pad(	clk_io_pad				),			 	.DataIn(clk_io_w));

pad_in pad_in3 (.pad(	data_in_io_pad0			),			 	.DataIn(data_in_io_w[0]));
pad_in pad_in4 (.pad(	data_in_io_pad1			),			 	.DataIn(data_in_io_w[1]));
pad_in pad_in5 (.pad(	data_in_io_pad2			),			 	.DataIn(data_in_io_w[2]));
pad_in pad_in6 (.pad(	data_in_io_pad3			),			 	.DataIn(data_in_io_w[3]));
pad_in pad_in7 (.pad(	data_in_io_pad4			),			 	.DataIn(data_in_io_w[4]));
pad_in pad_in8 (.pad(	data_in_io_pad5			),			 	.DataIn(data_in_io_w[5]));
pad_in pad_in9 (.pad(	data_in_io_pad6			),			 	.DataIn(data_in_io_w[6]));
pad_in pad_in10 (.pad(	data_in_io_pad7			),			 	.DataIn(data_in_io_w[7]));
pad_in pad_in11 (.pad(	data_in_io_pad8			),			 	.DataIn(data_in_io_w[8]));
pad_in pad_in12 (.pad(	data_in_io_pad9			),			 	.DataIn(data_in_io_w[9]));
pad_in pad_in13 (.pad(	data_in_io_pad10		),			 	.DataIn(data_in_io_w[10]));
pad_in pad_in14 (.pad(	data_in_io_pad11		),			 	.DataIn(data_in_io_w[11]));
pad_in pad_in15 (.pad(	data_in_io_pad12		),			 	.DataIn(data_in_io_w[12]));
pad_in pad_in16 (.pad(	data_in_io_pad13		),			 	.DataIn(data_in_io_w[13]));
pad_in pad_in17 (.pad(	data_in_io_pad14		),			 	.DataIn(data_in_io_w[14]));
pad_in pad_in18 (.pad(	data_in_io_pad15		),			 	.DataIn(data_in_io_w[15]));

pad_in pad_in19 (.pad(	core_to_mem_enable_io_pad),    			.DataIn(C_pad));

pad_vdd pad_vdd0 (vdd_pad);
pad_gnd pad_gnd0 (gnd_pad);


pad_out_buffered pad_out0(.pad(		data_out_io_pad0	), .out(data_out_io_w[0]));
pad_out_buffered pad_out1(.pad(		data_out_io_pad1	), .out(data_out_io_w[1]));
pad_out_buffered pad_out2(.pad(		data_out_io_pad2	), .out(data_out_io_w[2]));
pad_out_buffered pad_out3(.pad(		data_out_io_pad3	), .out(data_out_io_w[3]));
pad_out_buffered pad_out4(.pad(		data_out_io_pad4	), .out(data_out_io_w[4]));
pad_out_buffered pad_out5(.pad(		data_out_io_pad5	), .out(data_out_io_w[5]));
pad_out_buffered pad_out6(.pad(		data_out_io_pad6	), .out(data_out_io_w[6]));
pad_out_buffered pad_out7(.pad(		data_out_io_pad7	), .out(data_out_io_w[7]));
pad_out_buffered pad_out8(.pad(		data_out_io_pad8	), .out(data_out_io_w[8]));
pad_out_buffered pad_out9(.pad(		data_out_io_pad9	), .out(data_out_io_w[9]));

pad_out_buffered pad_out10(.pad(		data_out_io_pad10	), .out(data_out_io_w[10]));
pad_out_buffered pad_out11(.pad(		data_out_io_pad11	), .out(data_out_io_w[11]));
pad_out_buffered pad_out12(.pad(		data_out_io_pad12	), .out(data_out_io_w[12]));
pad_out_buffered pad_out13(.pad(		data_out_io_pad13	), .out(data_out_io_w[13]));
pad_out_buffered pad_out14(.pad(		data_out_io_pad14	), .out(data_out_io_w[14]));
pad_out_buffered pad_out15(.pad(		data_out_io_pad15	), .out(data_out_io_w[15]));

pad_out_buffered pad_out16(.pad(		addr_out_io_pad0	), .DataIn(addr_out_io_w[0]));
pad_out_buffered pad_out17(.pad(		addr_out_io_pad1	), .DataIn(addr_out_io_w[1]));
pad_out_buffered pad_out18(.pad(		addr_out_io_pad2	), .DataIn(addr_out_io_w[2]));
pad_out_buffered pad_out19(.pad(		addr_out_io_pad3	), .DataIn(addr_out_io_w[3]));
pad_out_buffered pad_out20(.pad(		addr_out_io_pad4	), .DataIn(addr_out_io_w[4]));
pad_out_buffered pad_out21(.pad(		addr_out_io_pad5	), .DataIn(addr_out_io_w[5]));
pad_out_buffered pad_out22(.pad(		addr_out_io_pad6	), .DataIn(addr_out_io_w[6]));
pad_out_buffered pad_out23(.pad(		addr_out_io_pad7	), .DataIn(addr_out_io_w[7]));
pad_out_buffered pad_out24(.pad(		addr_out_io_pad8	), .DataIn(addr_out_io_w[8]));
pad_out_buffered pad_out25(.pad(		addr_out_io_pad9	), .DataIn(addr_out_io_w[9]));

pad_out_buffered pad_out26(.pad(		pwm0_io_pad		), .out(pwm0_io_w));
pad_out_buffered pad_out27(.pad(		pwm1_io_pad		), .out(pwm1_io_w));
pad_out_buffered pad_out28(.pad(		pwm2_io_pad		), .out(pwm2_io_w));
pad_out_buffered pad_out29(.pad(		pwm3_io_pad		), .out(pwm3_io_w));
pad_out_buffered pad_out30(.pad(		pwm4_io_pad		), .out(pwm4_io_w));
pad_out_buffered pad_out31(.pad(		pwm5_io_pad		), .out(pwm5_io_w));
pad_out_buffered pad_out32(.pad(		pwm6_io_pad		), .out(pwm6_io_w));
pad_out_buffered pad_out33(.pad(		pwm7_io_pad		), .out(pwm7_io_w));

pad_corner corner0 ();
pad_corner corner1 ();
pad_corner corner2 ();
pad_corner corner3 ();

synth_top s_top(

	.reset_io(reset_io_w),
	.clk_io(clk_io_w),
	.data_in_io(data_in_io_w),
	.data_out_io(data_out_io_w),
	.addr_out_io(addr_out_io_w),
	.core_to_mem_enable_io(core_to_mem_enable_io_w),
	.sda_read_io(sda_read),
	.scl_read_io(scl_read),
	.sda_out_io(sda_out),
	.scl_out_io(scl_out),
	.pwm0_io(pwm0_io_w),
	.pwm1_io(pwm1_io_w),
	.pwm2_io(pwm2_io_w),
	.pwm3_io(pwm3_io_w),
	.pwm4_io(pwm4_io_w),
	.pwm5_io(pwm5_io_w),
	.pwm6_io(pwm6_io_w),
	.pwm7_io(pwm7_io_w)

	);


/*

module synth_top(
 input 		  	reset_io,
 input		  	clk_io,	 
 input 	[15:0] 		data_in_io,
 output [15:0] 		data_out_io, 
 output [9:0]  		addr_out_io,
 output 		core_to_mem_enable_io,
 input		  	sda_read_io,
 input		  	scl_read_io,
 output			sda_out_io,
 output			scl_out_io,
 output 		pwm0_io,
 output 		pwm1_io,
 output 		pwm2_io,
 output 		pwm3_io,
 output 		pwm4_io,
 output 		pwm5_io,
 output 		pwm6_io,
 output 		pwm7_io
);


*/


/*
pad_in pad_in0 (.pad(C), .DataIn(C_pad));
pad_in pad_in1 (.pad(SI), .DataIn(SI_pad));
pad_vdd pad_vdd0 ();
pad_gnd pad_gnd0 ();
pad_out_buffered pad_out0(.pad(SO), .out(SO_pad));
pad_corner corner0 ();
pad_corner corner1 ();
pad_corner corner2 ();
pad_corner corner3 ();

shift_register_v shift_register_v_dut ( C_pad, SI_pad, SO_pad );

*/

endmodule

/*

module shift_register_v ( C, SI, SO );
  input C, SI;
  output SO;

  wire   [6:0] tmp;

  DFFQX1 \tmp_reg[0]  ( .D(SI), .CLK(C), .Q(tmp[0]) );
  DFFQX1 \tmp_reg[1]  ( .D(tmp[0]), .CLK(C), .Q(tmp[1]) );
  DFFQX1 \tmp_reg[2]  ( .D(tmp[1]), .CLK(C), .Q(tmp[2]) );
  DFFQX1 \tmp_reg[3]  ( .D(tmp[2]), .CLK(C), .Q(tmp[3]) );
  DFFQX1 \tmp_reg[4]  ( .D(tmp[3]), .CLK(C), .Q(tmp[4]) );
  DFFQX1 \tmp_reg[5]  ( .D(tmp[4]), .CLK(C), .Q(tmp[5]) );
  DFFQX1 \tmp_reg[6]  ( .D(tmp[5]), .CLK(C), .Q(tmp[6]) );
  DFFQX1 \tmp_reg[7]  ( .D(tmp[6]), .CLK(C), .Q(SO) );
endmodule

*/