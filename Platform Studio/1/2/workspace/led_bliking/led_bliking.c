/*
 * led_bliking.c
 *
 *  Created on: 13 nov. 2018
 *      Author: jvalverd
 */

#include "xparameters.h"
#include "xgpio_l.h"

int main(void)
{

	int count =0;

	while (1)
	{

		for (count = 0 ; count < 100000 ; count++)
		{
			XGpio_WriteReg(XPAR_GPIO_0_BASEADDR, XGPIO_DATA_OFFSET, 0x02); //XGpio_WriteReg(BaseAddress, RegOffset, Data)
		}

		for (count = 0 ; count < 100000 ; count++)
		{
			XGpio_WriteReg(XPAR_GPIO_0_BASEADDR, XGPIO_DATA_OFFSET, 0x00); //XGpio_WriteReg(BaseAddress, RegOffset, Data)
		}
	}

  return 0;
}
