
/*******************************************************************
*
* CAUTION: This file is automatically generated by HSI.
* Version: 
* DO NOT EDIT.
*
* Copyright (C) 2010-2018 Xilinx, Inc. All Rights Reserved.*
*Permission is hereby granted, free of charge, to any person obtaining a copy
*of this software and associated documentation files (the Software), to deal
*in the Software without restriction, including without limitation the rights
*to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
*copies of the Software, and to permit persons to whom the Software is
*furnished to do so, subject to the following conditions:
*
*The above copyright notice and this permission notice shall be included in
*all copies or substantial portions of the Software.
* 
* Use of the Software is limited solely to applications:
*(a) running on a Xilinx device, or
*(b) that interact with a Xilinx device through a bus or interconnect.
*
*THE SOFTWARE IS PROVIDED AS IS, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
*IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
*FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
*XILINX BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
*WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT
*OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*
*Except as contained in this notice, the name of the Xilinx shall not be used
*in advertising or otherwise to promote the sale, use or other dealings in
*this Software without prior written authorization from Xilinx.
*

* 
* Description: Driver configuration
*
*******************************************************************/

#include "xparameters.h"
#include "xbram.h"

/*
* The configuration table for devices
*/

XBram_Config XBram_ConfigTable[] =
{
	{
		XPAR_DATA_CTRL_DEVICE_ID,
		XPAR_DATA_CTRL_DATA_WIDTH,
		XPAR_DATA_CTRL_ECC,
		XPAR_DATA_CTRL_FAULT_INJECT,
		XPAR_DATA_CTRL_CE_FAILING_REGISTERS,
		XPAR_DATA_CTRL_CE_FAILING_REGISTERS,
		XPAR_DATA_CTRL_UE_FAILING_REGISTERS,
		XPAR_DATA_CTRL_UE_FAILING_REGISTERS,
		XPAR_DATA_CTRL_ECC_STATUS_REGISTERS,
		XPAR_DATA_CTRL_CE_COUNTER_WIDTH,
		XPAR_DATA_CTRL_ECC_ONOFF_REGISTER,
		XPAR_DATA_CTRL_ECC_ONOFF_RESET_VALUE,
		XPAR_DATA_CTRL_WRITE_ACCESS,
		XPAR_DATA_CTRL_BASEADDR,
		XPAR_DATA_CTRL_HIGHADDR,
		XPAR_DATA_CTRL_S_AXI_CTRL_BASEADDR,
		XPAR_DATA_CTRL_S_AXI_CTRL_HIGHADDR
	},
	{
		XPAR_INST_CTRL_DEVICE_ID,
		XPAR_INST_CTRL_DATA_WIDTH,
		XPAR_INST_CTRL_ECC,
		XPAR_INST_CTRL_FAULT_INJECT,
		XPAR_INST_CTRL_CE_FAILING_REGISTERS,
		XPAR_INST_CTRL_CE_FAILING_REGISTERS,
		XPAR_INST_CTRL_UE_FAILING_REGISTERS,
		XPAR_INST_CTRL_UE_FAILING_REGISTERS,
		XPAR_INST_CTRL_ECC_STATUS_REGISTERS,
		XPAR_INST_CTRL_CE_COUNTER_WIDTH,
		XPAR_INST_CTRL_ECC_ONOFF_REGISTER,
		XPAR_INST_CTRL_ECC_ONOFF_RESET_VALUE,
		XPAR_INST_CTRL_WRITE_ACCESS,
		XPAR_INST_CTRL_BASEADDR,
		XPAR_INST_CTRL_HIGHADDR,
		XPAR_INST_CTRL_S_AXI_CTRL_BASEADDR,
		XPAR_INST_CTRL_S_AXI_CTRL_HIGHADDR
	}
};

