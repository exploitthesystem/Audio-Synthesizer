/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Tue Nov 20 18:07:23 2018
/////////////////////////////////////////////////////////////



module pad_out_buffered (out, pad);
  input out;
  output pad;

INVX1 inv0 (.A(out), .Z(out_pre));
INVX4 inv1 (.A(out_pre), .Z(out_pre1));
INVX16 inv2 (.A(out_pre1), .Z(out_pre2));
INVX32 inv3 (.A(out_pre2), .Z(out_buf));
pad_out pad_out0(.pad(pad), .DataOut(out_buf));
endmodule

module shift_register_v_top ( C, SI, SO );
  input C, SI;
  output SO;


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
endmodule

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

