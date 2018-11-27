module Core(
  input             clk,
  input             rst,
  input      [15:0] mem_to_core_data,          // instruction
  output reg [15:0] core_to_mem_data,          // data at address
  output reg [9:0]  core_to_mem_address,       // address of instruction
  output reg        core_to_mem_write_enable,  // memory write enable
  // I2C
  input             i2c_wr_en,
  input      [1:0]  i2c_sts,
  input      [7:0]  i2c_to_core_data,      
  output      [7:0]  core_to_i2c_data,      
  output      [7:0]  i2c_reg_addr,    
  output     [8:0]  i2c_addr,
  // PWM registers
  output     [15:0] pwm_reg0,
  output     [15:0] pwm_reg1,
  output     [15:0] pwm_reg2,
  output     [15:0] pwm_reg3,
  output     [15:0] pwm_reg4,
  output     [15:0] pwm_reg5,
  output     [15:0] pwm_reg6,
  output     [15:0] pwm_reg7)
  ; 

  // Instructions
  parameter LW  = 4'b0000;
  parameter SW  = 4'b0001;
  parameter JMP = 4'b0010;
  parameter BR  = 4'b0011;
  parameter LI  = 4'b0100;
  parameter OUI = 4'b0101;
  parameter AND = 4'b0110;
  parameter OR  = 4'b0111;
  parameter SLL = 4'b1000;
  parameter SLR = 4'b1001;
  parameter ADD = 4'b1010;
  parameter SUB = 4'b1011;
  parameter LT  = 4'b1100;
  parameter EQ  = 4'b1101;
  parameter NOT = 4'b1110;
	
  // State
  parameter FETCH   = 3'b000;
  parameter DECODE  = 3'b001;
  parameter EXECUTE = 3'b010;
  parameter LOAD    = 3'b011;
  parameter STORE   = 3'b100;
  parameter BRANCH  = 3'b101;
  parameter JUMP    = 3'b110;

  // Registers for core state that persists between instructions      
  reg [2:0] core_state = FETCH;                                            
  reg [2:0] next_state = FETCH;
  reg [9:0] pc         = 0;    // Start instructions at 0  
  reg [9:0] next_pc    = 0;
	                                      
  // Registers for branches and jumps        
  reg       cond;
  reg       cb			  = 0;  
  reg       jal;
  reg 		flag_idx;
  reg [1:0] flag = 0;    
  	                                                            
  // Registers for core states that persists between cycles w/in instruction
  reg [3:0]  opcode;
  reg [3:0]  dest_index;  
  reg [3:0]  shift;
  reg [7:0]  immediate;
	
  // Wires and registers to pass data
  reg        	write_enable;
  reg [3:0]  	reg_index1;
  reg [3:0] 	reg_index2;   
  reg [3:0]  	reg_index3;
  wire [15:0] 	reg_read1;
  wire [15:0] 	reg_read2;
  wire [15:0] 	reg_read3;
  reg [3:0]  	write_index;
  reg [15:0] 	write_data;   
  reg [15:0] 	reg_data1;
  reg [15:0] 	reg_data2;
  reg [15:0] 	reg_data3;
  
  // Internal register file	
  reg_file _reg_file(
    .clk       (clk), 
	 .rst			(rst),
    .rdDataA   (reg_index1),
    .rdDataB   (reg_index2),
    .rdDataC   (reg_index3),
    .write_en  (write_enable),
    .DataIn    (write_data),
    .wrData    (write_index),
    .A	      (reg_read1),
    .B	      (reg_read2),
    .C         (reg_read3),
    .i2c_wr_en (i2c_wr_en),
    .i2c_sts   (i2c_sts),
    .i2c_addr  (i2c_addr),
    .i2c_to_reg_file_data       (i2c_to_core_data),      
    .reg_file_to_i2c_data       (core_to_i2c_data),      
    .i2c_slave_addr             (i2c_reg_addr),   

    .pwm_reg0  (pwm_reg0),
    .pwm_reg1  (pwm_reg1),
    .pwm_reg2  (pwm_reg2),
    .pwm_reg3  (pwm_reg3),
    .pwm_reg4  (pwm_reg4),
    .pwm_reg5  (pwm_reg5),
    .pwm_reg6  (pwm_reg6),
    .pwm_reg7  (pwm_reg7));	
	
  // Current state logic
  always@(*)
  begin

    //Assign values to be 0, ensuring everything has a default value
    reg_index1   = 0;
    reg_index2   = 0;    
    reg_index3   = 0;
    write_data   = 0;
    write_enable = 0;
    write_index  = 0;
	 next_pc = 0;
	
    core_to_mem_address      = 0;
    core_to_mem_data         = 0;
    core_to_mem_write_enable = 0;
	 
		 case (core_state)
		  FETCH:  
				begin
					core_to_mem_address = pc;    
				end
		  DECODE:
				begin   
					core_to_mem_address = pc;
					if (mem_to_core_data[15:12] == LW || mem_to_core_data[15:12] == SW || mem_to_core_data[15:12] == OUI)
						begin
							reg_index1 = mem_to_core_data[11:8]; // read reg 1
							reg_index2 = mem_to_core_data[7:4];  // read reg 2     
							reg_index3 = mem_to_core_data[3:0];  // read reg 3 
						end
					else if (mem_to_core_data[15:12] == JMP)             
						begin  
							reg_index1 = mem_to_core_data[3:0];
						end
					else
						begin
							reg_index1 = mem_to_core_data[7:4]; // read reg 1
							reg_index2 = mem_to_core_data[3:0]; // read reg 2
						end
				end
		  EXECUTE: 
				begin 
					write_index  = dest_index;
					write_enable = 1;     

					if      (opcode == LI)
						write_data = {8'b0, immediate};
					else if (opcode == OUI)
						write_data = reg_data1 | {immediate, 8'b0};
					else if (opcode == AND)
						write_data = reg_data1 & reg_data2;						 
					else if (opcode == OR)
						write_data = reg_data1 | reg_data2;
					else if (opcode == SLL)
						write_data = reg_data1 << shift;
					else if (opcode == SLR)
						write_data = reg_data1 >> shift;
					else if (opcode == ADD)
						if (reg_data1 + reg_data2 > 16'hffff)
							write_data = 16'hffff;
						else
							write_data = reg_data1 + reg_data2;
					else if (opcode == SUB)      
						begin
							if (reg_data2 > reg_data1)
								write_data = 0;
							else
								write_data = reg_data1 - reg_data2;  
						end
					else if (opcode == LT)
						write_enable = 0;
					else if (opcode == EQ)
						write_enable = 0;
					else if (opcode == NOT)
						write_data = ~reg_data1;
				end
		  LOAD: 
				begin          
					write_index = dest_index;
					write_enable = 1;
					write_data = mem_to_core_data;
					core_to_mem_address  = reg_data1[9:0] + reg_data2[9:0];   
				end
		  STORE:   
				begin 
					core_to_mem_address      = reg_data1[9:0] + reg_data2[9:0];   
					core_to_mem_data         = reg_data3;
					core_to_mem_write_enable = 1;
				end
		  BRANCH:
					next_pc = (cb == flag[flag_idx]) ? pc + {{2{immediate[7]}}, {immediate[7:0]}} : pc;
		  JUMP:   
				begin 
					// if conditional jump
					if (cond == 1'b1)
						next_pc = (cb == flag[flag_idx]) ? reg_data1[9:0] : next_pc;
					else
						next_pc = reg_data1[9:0]; // regular jump            
			 
					// if jump and link  
					if (jal == 1'b1)
						begin
							write_index  = 5;         // Return register index     
							write_enable = 1'b1;                   
							write_data   = pc + 1'b1; // Return = PC + 1
						end
				end  
		  default: begin
					//		next_pc 	= 0;
						end 
		 endcase
  end
	
  // Next state logic
  always@(*)
  begin	
	if (rst == 1'b1) 
		begin
			next_state = FETCH;
		end
	else begin 
		case (core_state)
			FETCH: next_state = DECODE;    
			DECODE: 
				begin
					if (mem_to_core_data[15:12] == LI  ||
						mem_to_core_data[15:12] == OUI ||
						mem_to_core_data[15:12] == AND ||
						mem_to_core_data[15:12] == OR  ||
						mem_to_core_data[15:12] == SLL ||
						mem_to_core_data[15:12] == SLR ||
						mem_to_core_data[15:12] == ADD ||
						mem_to_core_data[15:12] == SUB ||    
						mem_to_core_data[15:12] == LT  ||
						mem_to_core_data[15:12] == EQ  ||
						mem_to_core_data[15:12] == NOT)
							next_state = EXECUTE;
					else if (mem_to_core_data[15:12] == LW)
						next_state = LOAD;
					else if (mem_to_core_data[15:12] == SW)
						next_state = STORE;
					else if (mem_to_core_data[15:12] == BR)
						next_state = BRANCH;
					else if (mem_to_core_data[15:12] == JMP)
						next_state = JUMP;
					else
						next_state = FETCH;
				end
			EXECUTE: next_state = FETCH;   
			LOAD:    next_state = FETCH;
			STORE:   next_state = FETCH;
			BRANCH:  next_state = FETCH;
			JUMP:    next_state = FETCH;     
			default: next_state = FETCH;
		 endcase
		end
  end
	        
  // Next state assignment
  always@(posedge clk)
  begin 
    if (rst == 1'b1)
		begin
			core_state <= FETCH;
			pc         <= 0;
		end
    else 
		begin 
	 
			if (core_state == DECODE)
				begin	
					jal        	<= mem_to_core_data[6];
					cond       	<= mem_to_core_data[11];  
					shift      	<= mem_to_core_data[3:0];	
					immediate  	<= mem_to_core_data[7:0];  				
					opcode 		= mem_to_core_data[15:12];  
					dest_index 	<= (opcode == LW) ? mem_to_core_data[3:0] : mem_to_core_data[11:8];  				
					flag_idx 	<= (opcode == JMP) ? mem_to_core_data[7] : mem_to_core_data[8];
					cb 			<= (opcode == JMP) ? mem_to_core_data[10] : mem_to_core_data[11];			
					reg_data1 	<= reg_read1;
					reg_data2 	<= reg_read2;
					reg_data3 	<= reg_read3;
				end 

			if (core_state == EXECUTE)
				begin
					if (opcode == LT)
						flag[1] <= reg_data1 < reg_data2;
					if (opcode == EQ)
						flag[0] <= reg_data1 == reg_data2;
				end


			if (core_state == JUMP || core_state == BRANCH)
				pc <= next_pc;
			else if (core_state == DECODE)
				pc <= pc + 1'b1;
			core_state <= next_state;  
		end                       
	end 
endmodule
