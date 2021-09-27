/*
 * cStd.c
 *
 *  Created on: Sep 21, 2021
 *      Author: MUSTAFA
 */

#include "main.h"
#include "math.h"

void cSDev(float *A, uint32_t size, float *std){
	float sum = 0;
	float mean = 0;
	float var = 0;

	for(uint32_t i = 0; i < size; i++){
		sum += A[i];
	}
	mean = sum/size;

	for(uint32_t i = 0; i < size; i++){
			var  += pow((A[i]-mean),2);
		}
	*std = sqrt(var/(size-1));
}
