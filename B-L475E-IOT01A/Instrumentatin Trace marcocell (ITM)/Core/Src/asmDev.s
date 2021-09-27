/*
 * asmDev.s
 *
 *  Created on: Sep 21, 2021
 *      Author: MUSTAFA

 * This file contains the assembly function used to find the element wise multiplication of two arrays.
 *  Parts Taken from  ECSE 444: Microprocessors Lab 1: Assembly, C, and Optimization provided by
 *  Prof Brett Myer
 */

// unified indicates that we're using a mix of different ARM instructions,
// e.g., 16-bit Thumb and 32-bit ARM instructions may be present (and are)
.syntax unified

// .global exports the label asmDev, which is expected by lab1math.h
.global asmDev

asmDev:

	PUSH {R4}								// saving context according to calling convention
	VSUB.F32 S0, S0, S0					    // Clear registers for stable result
	VSUB.F32 S1, S1, S1
	VSUB.F32 S2, S2, S2
	VSUB.F32 S3, S3, S3


	MOV R3, R0								// R3 = base address
	MOV R4, R1								// R4 = size
	MOV R5 , R4


sum:
	SUBS R4, R4, #1						    //	size = size-1
	BLT mean							    //	loop finishes when R4 < 0
	VLDR.F32 S0, [R3]					    //	move matrix value to S0
	VADD.F32 S1, S1, S0				 	    //	Sum
	ADD R3, R3, #4						    //	next index
	B sum

mean:
	VMOV.F32 S0, R1							// S0 = size
	VCVT.F32.U32 S0, S0 					// S0 type float
	VDIV.F32 S1, S1, S0						// S1 = sum/size

var_num:
	SUBS R1, R1, #1							//	size = size-1
	BLT var									//	loop finishes when R1 < 0
	VLDR.F32 S2, [R0]						//	S2 = current element
	VSUB.F32 S2, S2, S1						//  S2 = S2-mean
	VMLA.F32 S3, S2, S2						//	S3 += (S2-mean)^2
	ADD R0, R0, #4							// next index
	B var_num

var:
	SUBS R5,R5,#1							// size = size -1
	VMOV.F32 S0, R5							// S0 = size
	VCVT.F32.U32 S0, S0 					// S0 type float
	VDIV.F32 S3, S3, S0						// S3 = variance

done:
	VSQRT.F32 S3, S3
	VSTR.F32 S3, [R2]               		// store std dev value
	POP {R4}								// restore context
	BX LR

