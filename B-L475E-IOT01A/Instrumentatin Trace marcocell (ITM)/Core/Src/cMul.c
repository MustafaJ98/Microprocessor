/*
 * cMul.c
 *
 *  Created on: Sep 21, 2021
 *      Author: MUSTAFA
 */

#include "main.h"

void cMul(float *A, float *B, float *result, uint32_t block_size){
	for (uint32_t i = 0; i <block_size; i++ ){
		result[i] = A[i]*B[i];
	}
}

