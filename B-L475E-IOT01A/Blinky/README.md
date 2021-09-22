# Blinky on B-L475E-IOT01A

This project is a test to check if the enviornment setup for development is correct.

We toggle the GPIO pin connected to LEDs on the developemnt using:
1) HAL driver library
2) writing bits to GPIO ODR register

We also set up a timer (TIM2) to generate an interrupt every second and toggle the LEDs in the ISR.
