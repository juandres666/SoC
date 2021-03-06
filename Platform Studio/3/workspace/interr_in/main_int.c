#include "xparameters.h"
#include "xgpio.h"
#include "xintc.h"

XGpio Switches, Leds;
XIntc Interrupt;
int inputs;

const int switchs_ch = 1;
const int leds_ch    = 1;

void SwitchInterruptHandler(void *pointer)
{
  //XGpio_InterruptDisable(&Switches, XGPIO_IR_CH1_MASK);
  inputs = XGpio_DiscreteRead(&Switches, switchs_ch);
  XGpio_DiscreteWrite(&Leds, leds_ch, inputs);
  XGpio_InterruptClear(&Switches, XGPIO_IR_CH1_MASK);
  //XGpio_InterruptEnable(&Switches, XGPIO_IR_CH1_MASK);
}

void SoC_Configuration()
{
  // Initialize Level 1 of IO Interfaces
  XGpio_Initialize(&Switches, XPAR_GPIO_0_DEVICE_ID);
  XGpio_Initialize(&Leds, XPAR_GPIO_1_DEVICE_ID);
  // Enable Interruptions in GPIO Devices
  XGpio_InterruptEnable(&Switches, XGPIO_IR_CH1_MASK);
  XGpio_InterruptGlobalEnable(&Switches);
  // Initialize Interruption on Interruption Controller
  XIntc_Initialize(&Interrupt, XPAR_XPS_INTC_0_DEVICE_ID);//XPAR_INTC_CONTROLLER_DEVICE_ID
  XIntc_SelfTest(&Interrupt);
  // Define Interruption function and start functioning of interruption
  XIntc_Connect(&Interrupt, XPAR_XPS_INTC_0_XPS_GPIO_1_IP2INTC_IRPT_INTR, (XInterruptHandler)SwitchInterruptHandler, (void *)0);//XPAR_INTC_CONTROLLER_GPIO_SWITCHES_IP2INTC_IRPT_INTR
  XIntc_Start(&Interrupt, XIN_REAL_MODE);
  XIntc_Enable(&Interrupt, XPAR_XPS_INTC_0_XPS_GPIO_1_IP2INTC_IRPT_INTR);//XPAR_INTC_CONTROLLER_GPIO_SWITCHES_IP2INTC_IRPT_INTR
  // Define direction of inputs and outputs
  XGpio_SetDataDirection(&Switches, switchs_ch, 1);
  XGpio_SetDataDirection(&Leds, leds_ch, 0);
  // Enable Microblaze interruptions
  microblaze_enable_interrupts();
}

int main()
{
  SoC_Configuration();
  // PROGRAM START
  while(1){


  }
  return 0;
}
