/*
 * main.c
 *
 *  Created on: Dec 25, 2018
 *      Author: juandres666
 */

#include "xparameters.h" //information about AXI peripherals
#include "xgpio.h"  //AXI GPIO driver
#include "xsysmon.h" //XADC WIZ driver
#include "xtmrctr.h" //XTMR driver
#include "xintc.h" //XINTC driver

static XSysMon SysMonInst; //sysmon instance

XGpio gpio1;
XIntc Interrupt;
u32 led1=0x00000000;

void SwitchInterruptHandler(void *pointer)
{
	//XGpio_InterruptDisable(&Switches, XGPIO_IR_CH1_MASK);

	if (led1 != 0x00000000) // turn all LEDs on when any button is pressed
	{
		//XGpio_DiscreteWrite(&gpio1, 2, 0xFFFFFFFF);
		led1=0xFFFFFFFF;
	}
	else
	{
		//XGpio_DiscreteWrite(&gpio1, 2, 0x00000000);
		led1=0x00000000;
	}

	XGpio_InterruptClear(&gpio1, XGPIO_IR_CH1_MASK);
	//XGpio_InterruptEnable(&Switches, XGPIO_IR_CH1_MASK);
}

int main()
{
	//XADC
	u32 VccPdroRawData;
	XSysMon_Config *SysMonConfigPtr;
	XSysMon *SysMonInstPtr = &SysMonInst;
	SysMonConfigPtr = XSysMon_LookupConfig(XPAR_SYSMON_0_DEVICE_ID);

	XSysMon_CfgInitialize(SysMonInstPtr, SysMonConfigPtr,SysMonConfigPtr->BaseAddress);
	XSysMon_GetStatus(SysMonInstPtr); // Clear the old status

	//XTMR
	XTmrCtr TimerInstancePtr;
	XTmrCtr_Initialize(&TimerInstancePtr,XPAR_TMRCTR_0_DEVICE_ID);

	XTmrCtr_SetOptions(&TimerInstancePtr, 0, XTC_ENABLE_ALL_OPTION|XTC_DOWN_COUNT_OPTION|XTC_AUTO_RELOAD_OPTION); //XTmrCtr_SetOptions(&TimerInstancePtr, 0, (XTC_INT_MODE_OPTION | XTC_AUTO_RELOAD_OPTION | XTC_DOWN_COUNT_OPTION));

	u32 CounterControlReg = Xil_In32(TimerInstancePtr.BaseAddress + XTmrCtr_Offsets[0] + XTC_TCSR_OFFSET);
	CounterControlReg = CounterControlReg | XTC_CSR_ENABLE_PWM_MASK | XTC_CSR_EXT_GENERATE_MASK;
	Xil_Out32(TimerInstancePtr.BaseAddress + XTmrCtr_Offsets[0] + XTC_TCSR_OFFSET, CounterControlReg);

	XTmrCtr_SetOptions(&TimerInstancePtr, 1, XTC_ENABLE_ALL_OPTION|XTC_DOWN_COUNT_OPTION|XTC_AUTO_RELOAD_OPTION); //XTmrCtr_SetOptions(&TimerInstancePtr, 1, (XTC_INT_MODE_OPTION | XTC_AUTO_RELOAD_OPTION | XTC_DOWN_COUNT_OPTION));

	CounterControlReg = Xil_In32(TimerInstancePtr.BaseAddress + XTmrCtr_Offsets[1] + XTC_TCSR_OFFSET);
	CounterControlReg = CounterControlReg | XTC_CSR_ENABLE_PWM_MASK | XTC_CSR_EXT_GENERATE_MASK;
	Xil_Out32(TimerInstancePtr.BaseAddress + XTmrCtr_Offsets[1] + XTC_TCSR_OFFSET, CounterControlReg);

	XTmrCtr_SetResetValue(&TimerInstancePtr, 0, 2000000); //XTmrCtr_SetResetValue(&TimerInstancePtr, 0, 0x5f5e100);
	XTmrCtr_SetResetValue(&TimerInstancePtr, 1, 150000); //XTmrCtr_SetResetValue(&TimerInstancePtr,1, 0x1f78a40);

	XTmrCtr_Start(&TimerInstancePtr,0);
	XTmrCtr_Start(&TimerInstancePtr,1);

	//XGPIO
	XGpio gpio0;
	u32 btn, led;

	XGpio_Initialize(&gpio0, XPAR_GPIO_0_DEVICE_ID);
	XGpio_SetDataDirection(&gpio0, 2, 0x00000000); // set LED GPIO channel tristates to All Output
	XGpio_SetDataDirection(&gpio0, 1, 0xFFFFFFFF); // set BTN GPIO channel tristates to All Input

	XGpio_Initialize(&gpio1, XPAR_GPIO_1_DEVICE_ID);
	XGpio_SetDataDirection(&gpio1, 2, 0x00000000); // set LED GPIO channel tristates to All Output
	XGpio_SetDataDirection(&gpio1, 1, 0xFFFFFFFF); // set BTN GPIO channel tristates to All Input

	XGpio_InterruptEnable(&gpio1, XGPIO_IR_CH1_MASK);
	XGpio_InterruptGlobalEnable(&gpio1);
	// Initialize Interruption on Interruption Controller
	XIntc_Initialize(&Interrupt, XPAR_INTC_0_DEVICE_ID);//XPAR_INTC_CONTROLLER_DEVICE_ID
	XIntc_SelfTest(&Interrupt);
	// Define Interruption function and start functioning of interruption
	XIntc_Connect(&Interrupt, XPAR_AXI_INTC_0_AXI_GPIO_1_IP2INTC_IRPT_INTR, (XInterruptHandler)SwitchInterruptHandler, (void *)0);//XPAR_INTC_CONTROLLER_GPIO_SWITCHES_IP2INTC_IRPT_INTR
	XIntc_Start(&Interrupt, XIN_REAL_MODE);
	XIntc_Enable(&Interrupt, XPAR_AXI_INTC_0_AXI_GPIO_1_IP2INTC_IRPT_INTR);//XPAR_INTC_CONTROLLER_GPIO_SWITCHES_IP2INTC_IRPT_INTR

	microblaze_enable_interrupts();// Enable Microblaze interruptions

	while (1)
	{
		btn = XGpio_DiscreteRead(&gpio0, 1);
		if (btn != 0) // turn all LEDs on when any button is pressed
			led = 0xFFFFFFFF;
		else
			led = 0x00000000;
		XGpio_DiscreteWrite(&gpio0, 2, led);

		VccPdroRawData = XSysMon_GetAdcData(SysMonInstPtr,XSM_CH_AUX_MIN+2);//Read the external Vaux2 Data

		XTmrCtr_SetResetValue(&TimerInstancePtr, 1, 90000+VccPdroRawData*27);
	}
}
