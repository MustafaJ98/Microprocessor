/*
 * cMax.c
 *
 *  Created on: Sep 16, 2021
 *      Author: MUSTAFA
 * 	This file contains the C function used to find the max value in an array and its index.
 *  Taken from  ECSE 444: Microprocessors Lab 1: Assembly, C, and Optimization provided by
 *  Prof Brett Myer
 */

#include "main.h"
void cMax(float *array, uint32_t size, float *max, uint32_t *maxIndex) {
	(*max) = array[0];
	(*maxIndex) = 0;

	for (uint32_t i = 1; i < size; i++) {
		if (array[i] > (*max)) {
			(*max) = array[i];
			(*maxIndex) = i;
		} // if
	} // for
} // cMax

