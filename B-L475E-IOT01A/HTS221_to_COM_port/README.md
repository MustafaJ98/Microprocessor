# HTS221 to COM port on B-L475E-IOT01A

The development kit has a HTS221 sensor. The HTS221 is an ultra-compact sensor for relative humidity and temperature.

In this project, I use I2C communication to read temperature data from HTS221 sensor. This data is then sent
over USART. The ST debugger is confgured to read data from USART and display it on the COM port.

To run the project:
- flash the program on to the baord
- Find Virtual COM port used by ST using Device Manager
- use any serial program (e.g. Putty) to listen to COM port
