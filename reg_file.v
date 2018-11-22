module reg_file(  
  // control
  input clk,
  input rst,
  input write_en,
  input [3:0] wrData, 
  // registers
  input [15:0] DataIn,
  input [3:0] rdDataA,
  input [3:0] rdDataB,   
  input [3:0] rdDataC,
  output reg [15:0] A,
  output reg [15:0] B,
  output reg [15:0] C,  
  // I2C
  input       i2c_wr_en,
  input [1:0] i2c_sts,
  output reg [8:0] i2c_addr
  // PWM
  output reg [15:0] pwm_reg0,
  output reg [15:0] pwm_reg1,
  output reg [15:0] pwm_reg2,
  output reg [15:0] pwm_reg3,
  output reg [15:0] pwm_reg4,
  output reg [15:0] pwm_reg5,
  output reg [15:0] pwm_reg6,
  output reg [15:0] pwm_reg7);

  reg [15:0] reg1,  reg2,  reg3,  reg4;
  reg [15:0] reg5,  reg6,  reg7,  reg8;
  reg [15:0] reg9,  reg10, reg11, reg12;
  reg [15:0] reg13, reg14, reg15;

	
  // Read from registers
  always@(rdDataA or rdDataB or rdDataC or rst)
  begin          
    if (rst == 1'b1)
    begin
      reg1 = 0;
      reg2 = 0;
      reg3 = 0;
      reg4 = 0;
      reg5 = 0;
      reg6 = 0;
      reg7 = 0;
      reg8 = 0;
      reg9 = 0;
      reg10 = 0;
      reg11 = 0;
      reg12 = 0;
      reg13 = 0;
      reg14 = 0;
      reg15 = 0;
    end
    else
    begin
      i2c_addr = reg6[8:0];
        
      pwm_regs0 = reg8;  
      pwm_regs1 = reg9;
      pwm_regs2 = reg10;
      pwm_regs3 = reg11;
      pwm_regs4 = reg12;
      pwm_regs5 = reg13;
      pwm_regs6 = reg14;
      pwm_regs7 = reg15;
        
      case (rdDataA)
        0  : A = 0;
	1  : A = reg1;
        2  : A = reg2;
	3  : A = reg3;
	4  : A = reg4;
	5  : A = reg5;
	6  : A = reg6;
	7  : A = reg7;
	8  : A = reg8;
	9  : A = reg9;
	10 : A = reg10;
	11 : A = reg11;
	12 : A = reg12;
	13 : A = reg13;
	14 : A = reg14;
	15 : A = reg15;
      endcase
		
      case (rdDataB)
	0  : B = 0;
	1  : B = reg1;
	2  : B = reg2;
	3  : B = reg3;
	4  : B = reg4;
	5  : B = reg5;
	6  : B = reg6;
	7  : B = reg7;
	8  : B = reg8;
	9  : B = reg9;
	10 : B = reg10;
	11 : B = reg11;
	12 : B = reg12;
	13 : B = reg13;
	14 : B = reg14;
	15 : B = reg15;
      endcase	          
   	
      case (rdDataC)
	0  : C = 0;
	1  : C = reg1;
	2  : C = reg2;
	3  : C = reg3;
	4  : C = reg4;
	5  : C = reg5;
	6  : C = reg6;
	7  : C = reg7;
	8  : C = reg8;
	9  : C = reg9;
	10 : C = reg10;
	11 : C = reg11;
	12 : C = reg12;
	13 : C = reg13;
	14 : C = reg14;
	15 : C = reg15;
     endcase	
    end
  end
	
  // Write to registers
  always@(posedge clk)
  begin             
    if (i2c_wr_en == 1'b1)
      reg6[9:8] = i2c_sts;
    
    if (write_en)
	  case (wrData)
	    0  : begin end
		1  : reg1 <= DataIn;
		2  : reg2 <= DataIn;
		3  : reg3 <= DataIn;
		4  : reg4 <= DataIn;
		5  : reg5 <= DataIn;
		6  : reg6 <= DataIn;
		7  : reg7 <= DataIn;
		8  : reg8 <= DataIn;
		9  : reg9 <= DataIn;
		10 : reg10 <= DataIn;
		11 : reg11 <= DataIn;
		12 : reg12 <= DataIn;
		13 : reg13 <= DataIn;
		14 : reg14 <= DataIn;
		15 : reg15 <= DataIn;
	  endcase
  end

endmodule
