/*
 * asmMul.s
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

// .global exports the label asmMax, which is expected by lab1math.h
.global asmMul

// .section marks a new section in assembly. .text identifies it as source code;
// .rodata marks it as read-only, setting it to go in FLASH, not SRAM
.section .text.rodata

/**
 * void asmMax(float *array, uint32_t size, float *max, uint32_t *maxIndex);
 *
 * R0 = pointer to array A
 * R1 = pointer to array B
 * R2 = pointer to array result
 * R3 = size of vectors
 */

asmMul:
  PUSH 		{R4, R5, R6}		// saving R4 and R5 according to calling convention

loop:
  SUBS		R3, R3, #1		// size = size - 1
  BLT		done			// loop finishes when R1 < 0
  ADD		R4, R0, R3, LSL #2	// calculate base address (in R4) for array element A
  ADD		R5, R1, R3, LSL #2	// calculate base address (in R5) for array element B
  ADD		R6, R2, R3, LSL #2	// calculate base address (in R6) for array element result


  VLDR.f32	S1, [R4]		// load element into fp register S1 (from address in R5)
  VLDR.f32	S2, [R5]		// load element into fp register S2 (from address in R6)

  VMUL.f32  S0, S1, S2
  VSTR.f32  S0,  [R6]		// store element from fp register S0 (to address in R7)

  B		loop			// next iteration

done:
  POP		{R4, R5, R6}		// restore context
  BX LR					// return

