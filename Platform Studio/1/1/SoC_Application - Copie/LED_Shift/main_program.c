/*
 * main_program.c
 *
 *  Created on: 7 nov. 2018
 *      Author: jvalverd
 */
#include "xparameters.h";
#include "xgpio.h";

int main(void)
{
  XGpio_WriteReg(XPAR_GPIO_0_BASEADDR, XGPIO_DATA_OFFSET, 0xFF); //XGpio_WriteReg(BaseAddress, RegOffset, Data)
  return 0;
}
