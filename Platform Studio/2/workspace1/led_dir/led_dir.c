/*
 * led_dir.c
 *
 *  Created on: 13 nov. 2018
 *      Author: jvalverd
 */

#include "xparameters.h"
#include "xgpio.h"

int main(void)
{
	int flag=0;
	int count=0;
	int count1=1;
	int leds=0;


	XGpio led, sw;  // defined gpio variables

	XGpio_Initialize (&led, XPAR_GPIO_0_DEVICE_ID);
	XGpio_SetDataDirection (&led,1,0); // set display as output ports

	XGpio_Initialize (&sw,XPAR_GPIO_1_DEVICE_ID);
	XGpio_SetDataDirection (&sw,1,1); // set digit as input ports

	Xuint8 data = 0;

	Xuint8 data0 = 0;


	data0=XGpio_DiscreteRead(&sw, 1);
	while (1)
	{
		data=XGpio_DiscreteRead(&sw, 1);

		/*if((data)==data0)
		{
			for (count = 0 ; count < 100000 ; count++)
			{
			}

			count1=count1+count1;

			if((count1)>129)
			{
				count1=1;
			}


			XGpio_DiscreteWrite(&led, 1, data);

		}
		else
		{

			for (count = 0 ; count < 100000 ; count++)
			{
				XGpio_DiscreteWrite(&led, 1, 0x00);

			}

		} */


		XGpio_DiscreteWrite(&led, 1, data);

	}

  return 0;
}
