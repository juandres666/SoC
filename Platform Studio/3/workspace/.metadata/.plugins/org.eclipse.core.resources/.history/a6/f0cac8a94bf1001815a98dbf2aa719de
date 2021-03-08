/*
 * led_dir.c
 *
 *  Created on: 13 nov. 2018
 *      Author: jvalverd
 */

#include "xparameters.h"
#include "xgpio.h"


void myISR( void )
{
	if( XPAR_XPS_INTC_0_BASEADDR & XPAR_XPS_GPIO_1_IP2INTC_IRPT_MASK ) // Button interrupt is pending
		button_ISR();

	//INTC_IAR = INTC_IPR; // Acknowledge Interrupts

}

int main(void)
{
	microblaze_register_handler((XInterruptHqndler)myIntHandler,(void *)0);

	//Enable interrupts on PIC
	*ier = ierEnqble;
	*mer = merInitMask;

	microblaze_enable_interrups();


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
