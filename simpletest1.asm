0100 1111 0010 0000					li sp ADDRESS OF STACK					// set up the stack pointer, use pwm7 register for the stack pointer
0100 1000 1111 1111	DUTYINIT:		li pwm0 0xff							// set up pwm0 output, lower bits
0101 1000 0000 0000					oui pwm0 0x00							// set up pwm0 output, upper bits
0100 0100 0000 1100	DUTYLOOP:		li s1 ADDRESS OF WAIT					// get ADDRESS OF WAIT
0010 0000 0100 0100 				jump cond=0 cb=0 flag=000 JAL=1 xx s1 	// jump to WAIT in s1
1001 0001 1000 1000					shiftr t0 pwm0 0x8 						// get duty cycle of pwm0
0100 0111 0000 0001					li s0 ADDRESS OF DUTYINIT				// get ADDRESS OF DUTYINIT
1101 0000 0001 0000					equal xxxx t0 zero						// if dutycycle is zero...
0011 1000 1111 1000					branch CB=1 FLAG=000 PC+DUTYINIT		// initialize dutycycle
0100 0010 0000 0001					li t1 0x01								// get a 1
1011 1000 1000 0010					sub pwm0 pwm0 t1						// decrement dutycycle
0011 0000 1111 0111					branch CB=0 FLAG=000 PC+DUTYLOOP		// branch to DUTYLOOP
0100 0010 0000 0001	WAIT:			li t1 0x01								// get a 1
1010 1111 1111 0010					add sp sp t1							// increase stack space (sp is pwm7 = 0xf)
0001 1111 0000 0011					sw sp 0x0 s0							// save s0
0100 0011 0001 0001					li s0 (ADDRESS OF WAITLOOP) 			// load address into s0
0100 0001 1111 1111					li t0 0xff 								// load time to wait
1101 0000 0001 0000	WAITLOOP:		equal xxxx t0 zero						// if countdown reaches zero...
0011 1000 0000 0010					branch CB=1 FLAG=000 PC+WAITRETURN 		// if at 0, return
1011 0001 0001 0010					sub t0 t0 t1							// otherwise decrement counter
0010 0000 0000 0011					jump COND=0 CB=0 FLAG=000 JAL=0 xx s0	// jump to WAITLOOP
0000 1111 0000 0011	WAITRETURN: 	lw sp 0x0 s0							// restore s0
1011 1111 1111 0010					sub sp sp t1							// decrease stack space
0010 0000 0000 0101					jump COND=0 CB=0 FLAG=000 JAL=0 xx return // return from the WAIT function


put stack at 32 -> 0x10 -> 0010 0000

WAIT: 12 -> 1100
DUTYINIT: 1 -> 0001
WAITLOOP: 17 -> 0001 0001

0000 1000 -> flip bits: 1111 0111 -> add 1: 1111 1000
0000 1001 -> flip bits: 1111 0110 -> add 1: 1111 0111