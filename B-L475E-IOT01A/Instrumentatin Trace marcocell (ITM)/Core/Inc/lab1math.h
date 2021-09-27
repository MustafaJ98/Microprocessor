/*
 * lab1math.h
 *
 *  Created on: Sep 16, 2021
 *  Author: MUSTAFA Javed 260808710
 *
 *  This header file contains the function prototype for cMax and asmMax functions.
 *  Taken from  ECSE 444: Microprocessors Lab 1: Assembly, C, and Optimization provided by
 *  Prof Brett Myer
 */
#include "main.h"

#ifndef INC_LAB1MATH_H_
#define INC_LAB1MATH_H_

void cMax(float *array, uint32_t size, float *max, uint32_t *maxIndex);

extern void asmMax(float *array, uint32_t size, float *max, uint32_t *maxIndex);

void cMul(float *A, float *B, float *Mul, uint32_t block_size);

extern void asmMul(float *A, float *B, float *Mul, uint32_t block_size);

void cSDev(float *A, uint32_t size, float *std);

extern void asmDev(float *A, uint32_t size, float *std);

#endif /* INC_LAB1MATH_H_ */
