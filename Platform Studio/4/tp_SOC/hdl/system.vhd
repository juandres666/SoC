-------------------------------------------------------------------------------
-- system.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity system is
  port (
    clock_generator_0_CLKIN_pin : in std_logic;
    clock_generator_0_RST_pin : in std_logic;
    xps_gpio_0_GPIO_IO_O_pin : out std_logic_vector(0 to 7);
    xps_gpio_1_GPIO_IO_I_pin : in std_logic_vector(0 to 7);
    xps_spi_0_SPISEL_pin : in std_logic;
    xps_spi_0_SCK_pin : inout std_logic;
    xps_spi_0_MISO_pin : inout std_logic;
    xps_spi_0_MOSI_pin : inout std_logic;
    xps_spi_0_SS_pin : inout std_logic;
    xps_timer_0_PWM0_pin : out std_logic;
    xps_timer_0_GenerateOut0_pin : out std_logic;
    xps_timer_0_GenerateOut1_pin : out std_logic
  );
end system;

architecture STRUCTURE of system is

  component system_microblaze_0_wrapper is
    port (
      CLK : in std_logic;
      RESET : in std_logic;
      MB_RESET : in std_logic;
      INTERRUPT : in std_logic;
      INTERRUPT_ADDRESS : in std_logic_vector(0 to 31);
      INTERRUPT_ACK : out std_logic_vector(0 to 1);
      EXT_BRK : in std_logic;
      EXT_NM_BRK : in std_logic;
      DBG_STOP : in std_logic;
      MB_Halted : out std_logic;
      MB_Error : out std_logic;
      WAKEUP : in std_logic_vector(0 to 1);
      SLEEP : out std_logic;
      DBG_WAKEUP : out std_logic;
      LOCKSTEP_MASTER_OUT : out std_logic_vector(0 to 4095);
      LOCKSTEP_SLAVE_IN : in std_logic_vector(0 to 4095);
      LOCKSTEP_OUT : out std_logic_vector(0 to 4095);
      INSTR : in std_logic_vector(0 to 31);
      IREADY : in std_logic;
      IWAIT : in std_logic;
      ICE : in std_logic;
      IUE : in std_logic;
      INSTR_ADDR : out std_logic_vector(0 to 31);
      IFETCH : out std_logic;
      I_AS : out std_logic;
      IPLB_M_ABort : out std_logic;
      IPLB_M_ABus : out std_logic_vector(0 to 31);
      IPLB_M_UABus : out std_logic_vector(0 to 31);
      IPLB_M_BE : out std_logic_vector(0 to 3);
      IPLB_M_busLock : out std_logic;
      IPLB_M_lockErr : out std_logic;
      IPLB_M_MSize : out std_logic_vector(0 to 1);
      IPLB_M_priority : out std_logic_vector(0 to 1);
      IPLB_M_rdBurst : out std_logic;
      IPLB_M_request : out std_logic;
      IPLB_M_RNW : out std_logic;
      IPLB_M_size : out std_logic_vector(0 to 3);
      IPLB_M_TAttribute : out std_logic_vector(0 to 15);
      IPLB_M_type : out std_logic_vector(0 to 2);
      IPLB_M_wrBurst : out std_logic;
      IPLB_M_wrDBus : out std_logic_vector(0 to 31);
      IPLB_MBusy : in std_logic;
      IPLB_MRdErr : in std_logic;
      IPLB_MWrErr : in std_logic;
      IPLB_MIRQ : in std_logic;
      IPLB_MWrBTerm : in std_logic;
      IPLB_MWrDAck : in std_logic;
      IPLB_MAddrAck : in std_logic;
      IPLB_MRdBTerm : in std_logic;
      IPLB_MRdDAck : in std_logic;
      IPLB_MRdDBus : in std_logic_vector(0 to 31);
      IPLB_MRdWdAddr : in std_logic_vector(0 to 3);
      IPLB_MRearbitrate : in std_logic;
      IPLB_MSSize : in std_logic_vector(0 to 1);
      IPLB_MTimeout : in std_logic;
      DATA_READ : in std_logic_vector(0 to 31);
      DREADY : in std_logic;
      DWAIT : in std_logic;
      DCE : in std_logic;
      DUE : in std_logic;
      DATA_WRITE : out std_logic_vector(0 to 31);
      DATA_ADDR : out std_logic_vector(0 to 31);
      D_AS : out std_logic;
      READ_STROBE : out std_logic;
      WRITE_STROBE : out std_logic;
      BYTE_ENABLE : out std_logic_vector(0 to 3);
      DPLB_M_ABort : out std_logic;
      DPLB_M_ABus : out std_logic_vector(0 to 31);
      DPLB_M_UABus : out std_logic_vector(0 to 31);
      DPLB_M_BE : out std_logic_vector(0 to 3);
      DPLB_M_busLock : out std_logic;
      DPLB_M_lockErr : out std_logic;
      DPLB_M_MSize : out std_logic_vector(0 to 1);
      DPLB_M_priority : out std_logic_vector(0 to 1);
      DPLB_M_rdBurst : out std_logic;
      DPLB_M_request : out std_logic;
      DPLB_M_RNW : out std_logic;
      DPLB_M_size : out std_logic_vector(0 to 3);
      DPLB_M_TAttribute : out std_logic_vector(0 to 15);
      DPLB_M_type : out std_logic_vector(0 to 2);
      DPLB_M_wrBurst : out std_logic;
      DPLB_M_wrDBus : out std_logic_vector(0 to 31);
      DPLB_MBusy : in std_logic;
      DPLB_MRdErr : in std_logic;
      DPLB_MWrErr : in std_logic;
      DPLB_MIRQ : in std_logic;
      DPLB_MWrBTerm : in std_logic;
      DPLB_MWrDAck : in std_logic;
      DPLB_MAddrAck : in std_logic;
      DPLB_MRdBTerm : in std_logic;
      DPLB_MRdDAck : in std_logic;
      DPLB_MRdDBus : in std_logic_vector(0 to 31);
      DPLB_MRdWdAddr : in std_logic_vector(0 to 3);
      DPLB_MRearbitrate : in std_logic;
      DPLB_MSSize : in std_logic_vector(0 to 1);
      DPLB_MTimeout : in std_logic;
      M_AXI_IP_AWID : out std_logic_vector(0 downto 0);
      M_AXI_IP_AWADDR : out std_logic_vector(31 downto 0);
      M_AXI_IP_AWLEN : out std_logic_vector(7 downto 0);
      M_AXI_IP_AWSIZE : out std_logic_vector(2 downto 0);
      M_AXI_IP_AWBURST : out std_logic_vector(1 downto 0);
      M_AXI_IP_AWLOCK : out std_logic;
      M_AXI_IP_AWCACHE : out std_logic_vector(3 downto 0);
      M_AXI_IP_AWPROT : out std_logic_vector(2 downto 0);
      M_AXI_IP_AWQOS : out std_logic_vector(3 downto 0);
      M_AXI_IP_AWVALID : out std_logic;
      M_AXI_IP_AWREADY : in std_logic;
      M_AXI_IP_WDATA : out std_logic_vector(31 downto 0);
      M_AXI_IP_WSTRB : out std_logic_vector(3 downto 0);
      M_AXI_IP_WLAST : out std_logic;
      M_AXI_IP_WVALID : out std_logic;
      M_AXI_IP_WREADY : in std_logic;
      M_AXI_IP_BID : in std_logic_vector(0 downto 0);
      M_AXI_IP_BRESP : in std_logic_vector(1 downto 0);
      M_AXI_IP_BVALID : in std_logic;
      M_AXI_IP_BREADY : out std_logic;
      M_AXI_IP_ARID : out std_logic_vector(0 downto 0);
      M_AXI_IP_ARADDR : out std_logic_vector(31 downto 0);
      M_AXI_IP_ARLEN : out std_logic_vector(7 downto 0);
      M_AXI_IP_ARSIZE : out std_logic_vector(2 downto 0);
      M_AXI_IP_ARBURST : out std_logic_vector(1 downto 0);
      M_AXI_IP_ARLOCK : out std_logic;
      M_AXI_IP_ARCACHE : out std_logic_vector(3 downto 0);
      M_AXI_IP_ARPROT : out std_logic_vector(2 downto 0);
      M_AXI_IP_ARQOS : out std_logic_vector(3 downto 0);
      M_AXI_IP_ARVALID : out std_logic;
      M_AXI_IP_ARREADY : in std_logic;
      M_AXI_IP_RID : in std_logic_vector(0 downto 0);
      M_AXI_IP_RDATA : in std_logic_vector(31 downto 0);
      M_AXI_IP_RRESP : in std_logic_vector(1 downto 0);
      M_AXI_IP_RLAST : in std_logic;
      M_AXI_IP_RVALID : in std_logic;
      M_AXI_IP_RREADY : out std_logic;
      M_AXI_DP_AWID : out std_logic_vector(0 downto 0);
      M_AXI_DP_AWADDR : out std_logic_vector(31 downto 0);
      M_AXI_DP_AWLEN : out std_logic_vector(7 downto 0);
      M_AXI_DP_AWSIZE : out std_logic_vector(2 downto 0);
      M_AXI_DP_AWBURST : out std_logic_vector(1 downto 0);
      M_AXI_DP_AWLOCK : out std_logic;
      M_AXI_DP_AWCACHE : out std_logic_vector(3 downto 0);
      M_AXI_DP_AWPROT : out std_logic_vector(2 downto 0);
      M_AXI_DP_AWQOS : out std_logic_vector(3 downto 0);
      M_AXI_DP_AWVALID : out std_logic;
      M_AXI_DP_AWREADY : in std_logic;
      M_AXI_DP_WDATA : out std_logic_vector(31 downto 0);
      M_AXI_DP_WSTRB : out std_logic_vector(3 downto 0);
      M_AXI_DP_WLAST : out std_logic;
      M_AXI_DP_WVALID : out std_logic;
      M_AXI_DP_WREADY : in std_logic;
      M_AXI_DP_BID : in std_logic_vector(0 downto 0);
      M_AXI_DP_BRESP : in std_logic_vector(1 downto 0);
      M_AXI_DP_BVALID : in std_logic;
      M_AXI_DP_BREADY : out std_logic;
      M_AXI_DP_ARID : out std_logic_vector(0 downto 0);
      M_AXI_DP_ARADDR : out std_logic_vector(31 downto 0);
      M_AXI_DP_ARLEN : out std_logic_vector(7 downto 0);
      M_AXI_DP_ARSIZE : out std_logic_vector(2 downto 0);
      M_AXI_DP_ARBURST : out std_logic_vector(1 downto 0);
      M_AXI_DP_ARLOCK : out std_logic;
      M_AXI_DP_ARCACHE : out std_logic_vector(3 downto 0);
      M_AXI_DP_ARPROT : out std_logic_vector(2 downto 0);
      M_AXI_DP_ARQOS : out std_logic_vector(3 downto 0);
      M_AXI_DP_ARVALID : out std_logic;
      M_AXI_DP_ARREADY : in std_logic;
      M_AXI_DP_RID : in std_logic_vector(0 downto 0);
      M_AXI_DP_RDATA : in std_logic_vector(31 downto 0);
      M_AXI_DP_RRESP : in std_logic_vector(1 downto 0);
      M_AXI_DP_RLAST : in std_logic;
      M_AXI_DP_RVALID : in std_logic;
      M_AXI_DP_RREADY : out std_logic;
      M_AXI_IC_AWID : out std_logic_vector(0 downto 0);
      M_AXI_IC_AWADDR : out std_logic_vector(31 downto 0);
      M_AXI_IC_AWLEN : out std_logic_vector(7 downto 0);
      M_AXI_IC_AWSIZE : out std_logic_vector(2 downto 0);
      M_AXI_IC_AWBURST : out std_logic_vector(1 downto 0);
      M_AXI_IC_AWLOCK : out std_logic;
      M_AXI_IC_AWCACHE : out std_logic_vector(3 downto 0);
      M_AXI_IC_AWPROT : out std_logic_vector(2 downto 0);
      M_AXI_IC_AWQOS : out std_logic_vector(3 downto 0);
      M_AXI_IC_AWVALID : out std_logic;
      M_AXI_IC_AWREADY : in std_logic;
      M_AXI_IC_AWUSER : out std_logic_vector(4 downto 0);
      M_AXI_IC_AWDOMAIN : out std_logic_vector(1 downto 0);
      M_AXI_IC_AWSNOOP : out std_logic_vector(2 downto 0);
      M_AXI_IC_AWBAR : out std_logic_vector(1 downto 0);
      M_AXI_IC_WDATA : out std_logic_vector(31 downto 0);
      M_AXI_IC_WSTRB : out std_logic_vector(3 downto 0);
      M_AXI_IC_WLAST : out std_logic;
      M_AXI_IC_WVALID : out std_logic;
      M_AXI_IC_WREADY : in std_logic;
      M_AXI_IC_WUSER : out std_logic_vector(0 downto 0);
      M_AXI_IC_BID : in std_logic_vector(0 downto 0);
      M_AXI_IC_BRESP : in std_logic_vector(1 downto 0);
      M_AXI_IC_BVALID : in std_logic;
      M_AXI_IC_BREADY : out std_logic;
      M_AXI_IC_BUSER : in std_logic_vector(0 downto 0);
      M_AXI_IC_WACK : out std_logic;
      M_AXI_IC_ARID : out std_logic_vector(0 downto 0);
      M_AXI_IC_ARADDR : out std_logic_vector(31 downto 0);
      M_AXI_IC_ARLEN : out std_logic_vector(7 downto 0);
      M_AXI_IC_ARSIZE : out std_logic_vector(2 downto 0);
      M_AXI_IC_ARBURST : out std_logic_vector(1 downto 0);
      M_AXI_IC_ARLOCK : out std_logic;
      M_AXI_IC_ARCACHE : out std_logic_vector(3 downto 0);
      M_AXI_IC_ARPROT : out std_logic_vector(2 downto 0);
      M_AXI_IC_ARQOS : out std_logic_vector(3 downto 0);
      M_AXI_IC_ARVALID : out std_logic;
      M_AXI_IC_ARREADY : in std_logic;
      M_AXI_IC_ARUSER : out std_logic_vector(4 downto 0);
      M_AXI_IC_ARDOMAIN : out std_logic_vector(1 downto 0);
      M_AXI_IC_ARSNOOP : out std_logic_vector(3 downto 0);
      M_AXI_IC_ARBAR : out std_logic_vector(1 downto 0);
      M_AXI_IC_RID : in std_logic_vector(0 downto 0);
      M_AXI_IC_RDATA : in std_logic_vector(31 downto 0);
      M_AXI_IC_RRESP : in std_logic_vector(1 downto 0);
      M_AXI_IC_RLAST : in std_logic;
      M_AXI_IC_RVALID : in std_logic;
      M_AXI_IC_RREADY : out std_logic;
      M_AXI_IC_RUSER : in std_logic_vector(0 downto 0);
      M_AXI_IC_RACK : out std_logic;
      M_AXI_IC_ACVALID : in std_logic;
      M_AXI_IC_ACADDR : in std_logic_vector(31 downto 0);
      M_AXI_IC_ACSNOOP : in std_logic_vector(3 downto 0);
      M_AXI_IC_ACPROT : in std_logic_vector(2 downto 0);
      M_AXI_IC_ACREADY : out std_logic;
      M_AXI_IC_CRREADY : in std_logic;
      M_AXI_IC_CRVALID : out std_logic;
      M_AXI_IC_CRRESP : out std_logic_vector(4 downto 0);
      M_AXI_IC_CDVALID : out std_logic;
      M_AXI_IC_CDREADY : in std_logic;
      M_AXI_IC_CDDATA : out std_logic_vector(31 downto 0);
      M_AXI_IC_CDLAST : out std_logic;
      M_AXI_DC_AWID : out std_logic_vector(0 downto 0);
      M_AXI_DC_AWADDR : out std_logic_vector(31 downto 0);
      M_AXI_DC_AWLEN : out std_logic_vector(7 downto 0);
      M_AXI_DC_AWSIZE : out std_logic_vector(2 downto 0);
      M_AXI_DC_AWBURST : out std_logic_vector(1 downto 0);
      M_AXI_DC_AWLOCK : out std_logic;
      M_AXI_DC_AWCACHE : out std_logic_vector(3 downto 0);
      M_AXI_DC_AWPROT : out std_logic_vector(2 downto 0);
      M_AXI_DC_AWQOS : out std_logic_vector(3 downto 0);
      M_AXI_DC_AWVALID : out std_logic;
      M_AXI_DC_AWREADY : in std_logic;
      M_AXI_DC_AWUSER : out std_logic_vector(4 downto 0);
      M_AXI_DC_AWDOMAIN : out std_logic_vector(1 downto 0);
      M_AXI_DC_AWSNOOP : out std_logic_vector(2 downto 0);
      M_AXI_DC_AWBAR : out std_logic_vector(1 downto 0);
      M_AXI_DC_WDATA : out std_logic_vector(31 downto 0);
      M_AXI_DC_WSTRB : out std_logic_vector(3 downto 0);
      M_AXI_DC_WLAST : out std_logic;
      M_AXI_DC_WVALID : out std_logic;
      M_AXI_DC_WREADY : in std_logic;
      M_AXI_DC_WUSER : out std_logic_vector(0 downto 0);
      M_AXI_DC_BID : in std_logic_vector(0 downto 0);
      M_AXI_DC_BRESP : in std_logic_vector(1 downto 0);
      M_AXI_DC_BVALID : in std_logic;
      M_AXI_DC_BREADY : out std_logic;
      M_AXI_DC_BUSER : in std_logic_vector(0 downto 0);
      M_AXI_DC_WACK : out std_logic;
      M_AXI_DC_ARID : out std_logic_vector(0 downto 0);
      M_AXI_DC_ARADDR : out std_logic_vector(31 downto 0);
      M_AXI_DC_ARLEN : out std_logic_vector(7 downto 0);
      M_AXI_DC_ARSIZE : out std_logic_vector(2 downto 0);
      M_AXI_DC_ARBURST : out std_logic_vector(1 downto 0);
      M_AXI_DC_ARLOCK : out std_logic;
      M_AXI_DC_ARCACHE : out std_logic_vector(3 downto 0);
      M_AXI_DC_ARPROT : out std_logic_vector(2 downto 0);
      M_AXI_DC_ARQOS : out std_logic_vector(3 downto 0);
      M_AXI_DC_ARVALID : out std_logic;
      M_AXI_DC_ARREADY : in std_logic;
      M_AXI_DC_ARUSER : out std_logic_vector(4 downto 0);
      M_AXI_DC_ARDOMAIN : out std_logic_vector(1 downto 0);
      M_AXI_DC_ARSNOOP : out std_logic_vector(3 downto 0);
      M_AXI_DC_ARBAR : out std_logic_vector(1 downto 0);
      M_AXI_DC_RID : in std_logic_vector(0 downto 0);
      M_AXI_DC_RDATA : in std_logic_vector(31 downto 0);
      M_AXI_DC_RRESP : in std_logic_vector(1 downto 0);
      M_AXI_DC_RLAST : in std_logic;
      M_AXI_DC_RVALID : in std_logic;
      M_AXI_DC_RREADY : out std_logic;
      M_AXI_DC_RUSER : in std_logic_vector(0 downto 0);
      M_AXI_DC_RACK : out std_logic;
      M_AXI_DC_ACVALID : in std_logic;
      M_AXI_DC_ACADDR : in std_logic_vector(31 downto 0);
      M_AXI_DC_ACSNOOP : in std_logic_vector(3 downto 0);
      M_AXI_DC_ACPROT : in std_logic_vector(2 downto 0);
      M_AXI_DC_ACREADY : out std_logic;
      M_AXI_DC_CRREADY : in std_logic;
      M_AXI_DC_CRVALID : out std_logic;
      M_AXI_DC_CRRESP : out std_logic_vector(4 downto 0);
      M_AXI_DC_CDVALID : out std_logic;
      M_AXI_DC_CDREADY : in std_logic;
      M_AXI_DC_CDDATA : out std_logic_vector(31 downto 0);
      M_AXI_DC_CDLAST : out std_logic;
      DBG_CLK : in std_logic;
      DBG_TDI : in std_logic;
      DBG_TDO : out std_logic;
      DBG_REG_EN : in std_logic_vector(0 to 7);
      DBG_SHIFT : in std_logic;
      DBG_CAPTURE : in std_logic;
      DBG_UPDATE : in std_logic;
      DEBUG_RST : in std_logic;
      Trace_Instruction : out std_logic_vector(0 to 31);
      Trace_Valid_Instr : out std_logic;
      Trace_PC : out std_logic_vector(0 to 31);
      Trace_Reg_Write : out std_logic;
      Trace_Reg_Addr : out std_logic_vector(0 to 4);
      Trace_MSR_Reg : out std_logic_vector(0 to 14);
      Trace_PID_Reg : out std_logic_vector(0 to 7);
      Trace_New_Reg_Value : out std_logic_vector(0 to 31);
      Trace_Exception_Taken : out std_logic;
      Trace_Exception_Kind : out std_logic_vector(0 to 4);
      Trace_Jump_Taken : out std_logic;
      Trace_Delay_Slot : out std_logic;
      Trace_Data_Address : out std_logic_vector(0 to 31);
      Trace_Data_Access : out std_logic;
      Trace_Data_Read : out std_logic;
      Trace_Data_Write : out std_logic;
      Trace_Data_Write_Value : out std_logic_vector(0 to 31);
      Trace_Data_Byte_Enable : out std_logic_vector(0 to 3);
      Trace_DCache_Req : out std_logic;
      Trace_DCache_Hit : out std_logic;
      Trace_DCache_Rdy : out std_logic;
      Trace_DCache_Read : out std_logic;
      Trace_ICache_Req : out std_logic;
      Trace_ICache_Hit : out std_logic;
      Trace_ICache_Rdy : out std_logic;
      Trace_OF_PipeRun : out std_logic;
      Trace_EX_PipeRun : out std_logic;
      Trace_MEM_PipeRun : out std_logic;
      Trace_MB_Halted : out std_logic;
      Trace_Jump_Hit : out std_logic;
      FSL0_S_CLK : out std_logic;
      FSL0_S_READ : out std_logic;
      FSL0_S_DATA : in std_logic_vector(0 to 31);
      FSL0_S_CONTROL : in std_logic;
      FSL0_S_EXISTS : in std_logic;
      FSL0_M_CLK : out std_logic;
      FSL0_M_WRITE : out std_logic;
      FSL0_M_DATA : out std_logic_vector(0 to 31);
      FSL0_M_CONTROL : out std_logic;
      FSL0_M_FULL : in std_logic;
      FSL1_S_CLK : out std_logic;
      FSL1_S_READ : out std_logic;
      FSL1_S_DATA : in std_logic_vector(0 to 31);
      FSL1_S_CONTROL : in std_logic;
      FSL1_S_EXISTS : in std_logic;
      FSL1_M_CLK : out std_logic;
      FSL1_M_WRITE : out std_logic;
      FSL1_M_DATA : out std_logic_vector(0 to 31);
      FSL1_M_CONTROL : out std_logic;
      FSL1_M_FULL : in std_logic;
      FSL2_S_CLK : out std_logic;
      FSL2_S_READ : out std_logic;
      FSL2_S_DATA : in std_logic_vector(0 to 31);
      FSL2_S_CONTROL : in std_logic;
      FSL2_S_EXISTS : in std_logic;
      FSL2_M_CLK : out std_logic;
      FSL2_M_WRITE : out std_logic;
      FSL2_M_DATA : out std_logic_vector(0 to 31);
      FSL2_M_CONTROL : out std_logic;
      FSL2_M_FULL : in std_logic;
      FSL3_S_CLK : out std_logic;
      FSL3_S_READ : out std_logic;
      FSL3_S_DATA : in std_logic_vector(0 to 31);
      FSL3_S_CONTROL : in std_logic;
      FSL3_S_EXISTS : in std_logic;
      FSL3_M_CLK : out std_logic;
      FSL3_M_WRITE : out std_logic;
      FSL3_M_DATA : out std_logic_vector(0 to 31);
      FSL3_M_CONTROL : out std_logic;
      FSL3_M_FULL : in std_logic;
      FSL4_S_CLK : out std_logic;
      FSL4_S_READ : out std_logic;
      FSL4_S_DATA : in std_logic_vector(0 to 31);
      FSL4_S_CONTROL : in std_logic;
      FSL4_S_EXISTS : in std_logic;
      FSL4_M_CLK : out std_logic;
      FSL4_M_WRITE : out std_logic;
      FSL4_M_DATA : out std_logic_vector(0 to 31);
      FSL4_M_CONTROL : out std_logic;
      FSL4_M_FULL : in std_logic;
      FSL5_S_CLK : out std_logic;
      FSL5_S_READ : out std_logic;
      FSL5_S_DATA : in std_logic_vector(0 to 31);
      FSL5_S_CONTROL : in std_logic;
      FSL5_S_EXISTS : in std_logic;
      FSL5_M_CLK : out std_logic;
      FSL5_M_WRITE : out std_logic;
      FSL5_M_DATA : out std_logic_vector(0 to 31);
      FSL5_M_CONTROL : out std_logic;
      FSL5_M_FULL : in std_logic;
      FSL6_S_CLK : out std_logic;
      FSL6_S_READ : out std_logic;
      FSL6_S_DATA : in std_logic_vector(0 to 31);
      FSL6_S_CONTROL : in std_logic;
      FSL6_S_EXISTS : in std_logic;
      FSL6_M_CLK : out std_logic;
      FSL6_M_WRITE : out std_logic;
      FSL6_M_DATA : out std_logic_vector(0 to 31);
      FSL6_M_CONTROL : out std_logic;
      FSL6_M_FULL : in std_logic;
      FSL7_S_CLK : out std_logic;
      FSL7_S_READ : out std_logic;
      FSL7_S_DATA : in std_logic_vector(0 to 31);
      FSL7_S_CONTROL : in std_logic;
      FSL7_S_EXISTS : in std_logic;
      FSL7_M_CLK : out std_logic;
      FSL7_M_WRITE : out std_logic;
      FSL7_M_DATA : out std_logic_vector(0 to 31);
      FSL7_M_CONTROL : out std_logic;
      FSL7_M_FULL : in std_logic;
      FSL8_S_CLK : out std_logic;
      FSL8_S_READ : out std_logic;
      FSL8_S_DATA : in std_logic_vector(0 to 31);
      FSL8_S_CONTROL : in std_logic;
      FSL8_S_EXISTS : in std_logic;
      FSL8_M_CLK : out std_logic;
      FSL8_M_WRITE : out std_logic;
      FSL8_M_DATA : out std_logic_vector(0 to 31);
      FSL8_M_CONTROL : out std_logic;
      FSL8_M_FULL : in std_logic;
      FSL9_S_CLK : out std_logic;
      FSL9_S_READ : out std_logic;
      FSL9_S_DATA : in std_logic_vector(0 to 31);
      FSL9_S_CONTROL : in std_logic;
      FSL9_S_EXISTS : in std_logic;
      FSL9_M_CLK : out std_logic;
      FSL9_M_WRITE : out std_logic;
      FSL9_M_DATA : out std_logic_vector(0 to 31);
      FSL9_M_CONTROL : out std_logic;
      FSL9_M_FULL : in std_logic;
      FSL10_S_CLK : out std_logic;
      FSL10_S_READ : out std_logic;
      FSL10_S_DATA : in std_logic_vector(0 to 31);
      FSL10_S_CONTROL : in std_logic;
      FSL10_S_EXISTS : in std_logic;
      FSL10_M_CLK : out std_logic;
      FSL10_M_WRITE : out std_logic;
      FSL10_M_DATA : out std_logic_vector(0 to 31);
      FSL10_M_CONTROL : out std_logic;
      FSL10_M_FULL : in std_logic;
      FSL11_S_CLK : out std_logic;
      FSL11_S_READ : out std_logic;
      FSL11_S_DATA : in std_logic_vector(0 to 31);
      FSL11_S_CONTROL : in std_logic;
      FSL11_S_EXISTS : in std_logic;
      FSL11_M_CLK : out std_logic;
      FSL11_M_WRITE : out std_logic;
      FSL11_M_DATA : out std_logic_vector(0 to 31);
      FSL11_M_CONTROL : out std_logic;
      FSL11_M_FULL : in std_logic;
      FSL12_S_CLK : out std_logic;
      FSL12_S_READ : out std_logic;
      FSL12_S_DATA : in std_logic_vector(0 to 31);
      FSL12_S_CONTROL : in std_logic;
      FSL12_S_EXISTS : in std_logic;
      FSL12_M_CLK : out std_logic;
      FSL12_M_WRITE : out std_logic;
      FSL12_M_DATA : out std_logic_vector(0 to 31);
      FSL12_M_CONTROL : out std_logic;
      FSL12_M_FULL : in std_logic;
      FSL13_S_CLK : out std_logic;
      FSL13_S_READ : out std_logic;
      FSL13_S_DATA : in std_logic_vector(0 to 31);
      FSL13_S_CONTROL : in std_logic;
      FSL13_S_EXISTS : in std_logic;
      FSL13_M_CLK : out std_logic;
      FSL13_M_WRITE : out std_logic;
      FSL13_M_DATA : out std_logic_vector(0 to 31);
      FSL13_M_CONTROL : out std_logic;
      FSL13_M_FULL : in std_logic;
      FSL14_S_CLK : out std_logic;
      FSL14_S_READ : out std_logic;
      FSL14_S_DATA : in std_logic_vector(0 to 31);
      FSL14_S_CONTROL : in std_logic;
      FSL14_S_EXISTS : in std_logic;
      FSL14_M_CLK : out std_logic;
      FSL14_M_WRITE : out std_logic;
      FSL14_M_DATA : out std_logic_vector(0 to 31);
      FSL14_M_CONTROL : out std_logic;
      FSL14_M_FULL : in std_logic;
      FSL15_S_CLK : out std_logic;
      FSL15_S_READ : out std_logic;
      FSL15_S_DATA : in std_logic_vector(0 to 31);
      FSL15_S_CONTROL : in std_logic;
      FSL15_S_EXISTS : in std_logic;
      FSL15_M_CLK : out std_logic;
      FSL15_M_WRITE : out std_logic;
      FSL15_M_DATA : out std_logic_vector(0 to 31);
      FSL15_M_CONTROL : out std_logic;
      FSL15_M_FULL : in std_logic;
      M0_AXIS_TLAST : out std_logic;
      M0_AXIS_TDATA : out std_logic_vector(31 downto 0);
      M0_AXIS_TVALID : out std_logic;
      M0_AXIS_TREADY : in std_logic;
      S0_AXIS_TLAST : in std_logic;
      S0_AXIS_TDATA : in std_logic_vector(31 downto 0);
      S0_AXIS_TVALID : in std_logic;
      S0_AXIS_TREADY : out std_logic;
      M1_AXIS_TLAST : out std_logic;
      M1_AXIS_TDATA : out std_logic_vector(31 downto 0);
      M1_AXIS_TVALID : out std_logic;
      M1_AXIS_TREADY : in std_logic;
      S1_AXIS_TLAST : in std_logic;
      S1_AXIS_TDATA : in std_logic_vector(31 downto 0);
      S1_AXIS_TVALID : in std_logic;
      S1_AXIS_TREADY : out std_logic;
      M2_AXIS_TLAST : out std_logic;
      M2_AXIS_TDATA : out std_logic_vector(31 downto 0);
      M2_AXIS_TVALID : out std_logic;
      M2_AXIS_TREADY : in std_logic;
      S2_AXIS_TLAST : in std_logic;
      S2_AXIS_TDATA : in std_logic_vector(31 downto 0);
      S2_AXIS_TVALID : in std_logic;
      S2_AXIS_TREADY : out std_logic;
      M3_AXIS_TLAST : out std_logic;
      M3_AXIS_TDATA : out std_logic_vector(31 downto 0);
      M3_AXIS_TVALID : out std_logic;
      M3_AXIS_TREADY : in std_logic;
      S3_AXIS_TLAST : in std_logic;
      S3_AXIS_TDATA : in std_logic_vector(31 downto 0);
      S3_AXIS_TVALID : in std_logic;
      S3_AXIS_TREADY : out std_logic;
      M4_AXIS_TLAST : out std_logic;
      M4_AXIS_TDATA : out std_logic_vector(31 downto 0);
      M4_AXIS_TVALID : out std_logic;
      M4_AXIS_TREADY : in std_logic;
      S4_AXIS_TLAST : in std_logic;
      S4_AXIS_TDATA : in std_logic_vector(31 downto 0);
      S4_AXIS_TVALID : in std_logic;
      S4_AXIS_TREADY : out std_logic;
      M5_AXIS_TLAST : out std_logic;
      M5_AXIS_TDATA : out std_logic_vector(31 downto 0);
      M5_AXIS_TVALID : out std_logic;
      M5_AXIS_TREADY : in std_logic;
      S5_AXIS_TLAST : in std_logic;
      S5_AXIS_TDATA : in std_logic_vector(31 downto 0);
      S5_AXIS_TVALID : in std_logic;
      S5_AXIS_TREADY : out std_logic;
      M6_AXIS_TLAST : out std_logic;
      M6_AXIS_TDATA : out std_logic_vector(31 downto 0);
      M6_AXIS_TVALID : out std_logic;
      M6_AXIS_TREADY : in std_logic;
      S6_AXIS_TLAST : in std_logic;
      S6_AXIS_TDATA : in std_logic_vector(31 downto 0);
      S6_AXIS_TVALID : in std_logic;
      S6_AXIS_TREADY : out std_logic;
      M7_AXIS_TLAST : out std_logic;
      M7_AXIS_TDATA : out std_logic_vector(31 downto 0);
      M7_AXIS_TVALID : out std_logic;
      M7_AXIS_TREADY : in std_logic;
      S7_AXIS_TLAST : in std_logic;
      S7_AXIS_TDATA : in std_logic_vector(31 downto 0);
      S7_AXIS_TVALID : in std_logic;
      S7_AXIS_TREADY : out std_logic;
      M8_AXIS_TLAST : out std_logic;
      M8_AXIS_TDATA : out std_logic_vector(31 downto 0);
      M8_AXIS_TVALID : out std_logic;
      M8_AXIS_TREADY : in std_logic;
      S8_AXIS_TLAST : in std_logic;
      S8_AXIS_TDATA : in std_logic_vector(31 downto 0);
      S8_AXIS_TVALID : in std_logic;
      S8_AXIS_TREADY : out std_logic;
      M9_AXIS_TLAST : out std_logic;
      M9_AXIS_TDATA : out std_logic_vector(31 downto 0);
      M9_AXIS_TVALID : out std_logic;
      M9_AXIS_TREADY : in std_logic;
      S9_AXIS_TLAST : in std_logic;
      S9_AXIS_TDATA : in std_logic_vector(31 downto 0);
      S9_AXIS_TVALID : in std_logic;
      S9_AXIS_TREADY : out std_logic;
      M10_AXIS_TLAST : out std_logic;
      M10_AXIS_TDATA : out std_logic_vector(31 downto 0);
      M10_AXIS_TVALID : out std_logic;
      M10_AXIS_TREADY : in std_logic;
      S10_AXIS_TLAST : in std_logic;
      S10_AXIS_TDATA : in std_logic_vector(31 downto 0);
      S10_AXIS_TVALID : in std_logic;
      S10_AXIS_TREADY : out std_logic;
      M11_AXIS_TLAST : out std_logic;
      M11_AXIS_TDATA : out std_logic_vector(31 downto 0);
      M11_AXIS_TVALID : out std_logic;
      M11_AXIS_TREADY : in std_logic;
      S11_AXIS_TLAST : in std_logic;
      S11_AXIS_TDATA : in std_logic_vector(31 downto 0);
      S11_AXIS_TVALID : in std_logic;
      S11_AXIS_TREADY : out std_logic;
      M12_AXIS_TLAST : out std_logic;
      M12_AXIS_TDATA : out std_logic_vector(31 downto 0);
      M12_AXIS_TVALID : out std_logic;
      M12_AXIS_TREADY : in std_logic;
      S12_AXIS_TLAST : in std_logic;
      S12_AXIS_TDATA : in std_logic_vector(31 downto 0);
      S12_AXIS_TVALID : in std_logic;
      S12_AXIS_TREADY : out std_logic;
      M13_AXIS_TLAST : out std_logic;
      M13_AXIS_TDATA : out std_logic_vector(31 downto 0);
      M13_AXIS_TVALID : out std_logic;
      M13_AXIS_TREADY : in std_logic;
      S13_AXIS_TLAST : in std_logic;
      S13_AXIS_TDATA : in std_logic_vector(31 downto 0);
      S13_AXIS_TVALID : in std_logic;
      S13_AXIS_TREADY : out std_logic;
      M14_AXIS_TLAST : out std_logic;
      M14_AXIS_TDATA : out std_logic_vector(31 downto 0);
      M14_AXIS_TVALID : out std_logic;
      M14_AXIS_TREADY : in std_logic;
      S14_AXIS_TLAST : in std_logic;
      S14_AXIS_TDATA : in std_logic_vector(31 downto 0);
      S14_AXIS_TVALID : in std_logic;
      S14_AXIS_TREADY : out std_logic;
      M15_AXIS_TLAST : out std_logic;
      M15_AXIS_TDATA : out std_logic_vector(31 downto 0);
      M15_AXIS_TVALID : out std_logic;
      M15_AXIS_TREADY : in std_logic;
      S15_AXIS_TLAST : in std_logic;
      S15_AXIS_TDATA : in std_logic_vector(31 downto 0);
      S15_AXIS_TVALID : in std_logic;
      S15_AXIS_TREADY : out std_logic;
      ICACHE_FSL_IN_CLK : out std_logic;
      ICACHE_FSL_IN_READ : out std_logic;
      ICACHE_FSL_IN_DATA : in std_logic_vector(0 to 31);
      ICACHE_FSL_IN_CONTROL : in std_logic;
      ICACHE_FSL_IN_EXISTS : in std_logic;
      ICACHE_FSL_OUT_CLK : out std_logic;
      ICACHE_FSL_OUT_WRITE : out std_logic;
      ICACHE_FSL_OUT_DATA : out std_logic_vector(0 to 31);
      ICACHE_FSL_OUT_CONTROL : out std_logic;
      ICACHE_FSL_OUT_FULL : in std_logic;
      DCACHE_FSL_IN_CLK : out std_logic;
      DCACHE_FSL_IN_READ : out std_logic;
      DCACHE_FSL_IN_DATA : in std_logic_vector(0 to 31);
      DCACHE_FSL_IN_CONTROL : in std_logic;
      DCACHE_FSL_IN_EXISTS : in std_logic;
      DCACHE_FSL_OUT_CLK : out std_logic;
      DCACHE_FSL_OUT_WRITE : out std_logic;
      DCACHE_FSL_OUT_DATA : out std_logic_vector(0 to 31);
      DCACHE_FSL_OUT_CONTROL : out std_logic;
      DCACHE_FSL_OUT_FULL : in std_logic
    );
  end component;

  component system_data_lmb_wrapper is
    port (
      LMB_Clk : in std_logic;
      SYS_Rst : in std_logic;
      LMB_Rst : out std_logic;
      M_ABus : in std_logic_vector(0 to 31);
      M_ReadStrobe : in std_logic;
      M_WriteStrobe : in std_logic;
      M_AddrStrobe : in std_logic;
      M_DBus : in std_logic_vector(0 to 31);
      M_BE : in std_logic_vector(0 to 3);
      Sl_DBus : in std_logic_vector(0 to 31);
      Sl_Ready : in std_logic_vector(0 to 0);
      Sl_Wait : in std_logic_vector(0 to 0);
      Sl_UE : in std_logic_vector(0 to 0);
      Sl_CE : in std_logic_vector(0 to 0);
      LMB_ABus : out std_logic_vector(0 to 31);
      LMB_ReadStrobe : out std_logic;
      LMB_WriteStrobe : out std_logic;
      LMB_AddrStrobe : out std_logic;
      LMB_ReadDBus : out std_logic_vector(0 to 31);
      LMB_WriteDBus : out std_logic_vector(0 to 31);
      LMB_Ready : out std_logic;
      LMB_Wait : out std_logic;
      LMB_UE : out std_logic;
      LMB_CE : out std_logic;
      LMB_BE : out std_logic_vector(0 to 3)
    );
  end component;

  component system_inst_lmb_wrapper is
    port (
      LMB_Clk : in std_logic;
      SYS_Rst : in std_logic;
      LMB_Rst : out std_logic;
      M_ABus : in std_logic_vector(0 to 31);
      M_ReadStrobe : in std_logic;
      M_WriteStrobe : in std_logic;
      M_AddrStrobe : in std_logic;
      M_DBus : in std_logic_vector(0 to 31);
      M_BE : in std_logic_vector(0 to 3);
      Sl_DBus : in std_logic_vector(0 to 31);
      Sl_Ready : in std_logic_vector(0 to 0);
      Sl_Wait : in std_logic_vector(0 to 0);
      Sl_UE : in std_logic_vector(0 to 0);
      Sl_CE : in std_logic_vector(0 to 0);
      LMB_ABus : out std_logic_vector(0 to 31);
      LMB_ReadStrobe : out std_logic;
      LMB_WriteStrobe : out std_logic;
      LMB_AddrStrobe : out std_logic;
      LMB_ReadDBus : out std_logic_vector(0 to 31);
      LMB_WriteDBus : out std_logic_vector(0 to 31);
      LMB_Ready : out std_logic;
      LMB_Wait : out std_logic;
      LMB_UE : out std_logic;
      LMB_CE : out std_logic;
      LMB_BE : out std_logic_vector(0 to 3)
    );
  end component;

  component system_plb_v46_0_wrapper is
    port (
      PLB_Clk : in std_logic;
      SYS_Rst : in std_logic;
      PLB_Rst : out std_logic;
      SPLB_Rst : out std_logic_vector(0 to 3);
      MPLB_Rst : out std_logic_vector(0 to 0);
      PLB_dcrAck : out std_logic;
      PLB_dcrDBus : out std_logic_vector(0 to 31);
      DCR_ABus : in std_logic_vector(0 to 9);
      DCR_DBus : in std_logic_vector(0 to 31);
      DCR_Read : in std_logic;
      DCR_Write : in std_logic;
      M_ABus : in std_logic_vector(0 to 31);
      M_UABus : in std_logic_vector(0 to 31);
      M_BE : in std_logic_vector(0 to 3);
      M_RNW : in std_logic_vector(0 to 0);
      M_abort : in std_logic_vector(0 to 0);
      M_busLock : in std_logic_vector(0 to 0);
      M_TAttribute : in std_logic_vector(0 to 15);
      M_lockErr : in std_logic_vector(0 to 0);
      M_MSize : in std_logic_vector(0 to 1);
      M_priority : in std_logic_vector(0 to 1);
      M_rdBurst : in std_logic_vector(0 to 0);
      M_request : in std_logic_vector(0 to 0);
      M_size : in std_logic_vector(0 to 3);
      M_type : in std_logic_vector(0 to 2);
      M_wrBurst : in std_logic_vector(0 to 0);
      M_wrDBus : in std_logic_vector(0 to 31);
      Sl_addrAck : in std_logic_vector(0 to 3);
      Sl_MRdErr : in std_logic_vector(0 to 3);
      Sl_MWrErr : in std_logic_vector(0 to 3);
      Sl_MBusy : in std_logic_vector(0 to 3);
      Sl_rdBTerm : in std_logic_vector(0 to 3);
      Sl_rdComp : in std_logic_vector(0 to 3);
      Sl_rdDAck : in std_logic_vector(0 to 3);
      Sl_rdDBus : in std_logic_vector(0 to 127);
      Sl_rdWdAddr : in std_logic_vector(0 to 15);
      Sl_rearbitrate : in std_logic_vector(0 to 3);
      Sl_SSize : in std_logic_vector(0 to 7);
      Sl_wait : in std_logic_vector(0 to 3);
      Sl_wrBTerm : in std_logic_vector(0 to 3);
      Sl_wrComp : in std_logic_vector(0 to 3);
      Sl_wrDAck : in std_logic_vector(0 to 3);
      Sl_MIRQ : in std_logic_vector(0 to 3);
      PLB_MIRQ : out std_logic_vector(0 to 0);
      PLB_ABus : out std_logic_vector(0 to 31);
      PLB_UABus : out std_logic_vector(0 to 31);
      PLB_BE : out std_logic_vector(0 to 3);
      PLB_MAddrAck : out std_logic_vector(0 to 0);
      PLB_MTimeout : out std_logic_vector(0 to 0);
      PLB_MBusy : out std_logic_vector(0 to 0);
      PLB_MRdErr : out std_logic_vector(0 to 0);
      PLB_MWrErr : out std_logic_vector(0 to 0);
      PLB_MRdBTerm : out std_logic_vector(0 to 0);
      PLB_MRdDAck : out std_logic_vector(0 to 0);
      PLB_MRdDBus : out std_logic_vector(0 to 31);
      PLB_MRdWdAddr : out std_logic_vector(0 to 3);
      PLB_MRearbitrate : out std_logic_vector(0 to 0);
      PLB_MWrBTerm : out std_logic_vector(0 to 0);
      PLB_MWrDAck : out std_logic_vector(0 to 0);
      PLB_MSSize : out std_logic_vector(0 to 1);
      PLB_PAValid : out std_logic;
      PLB_RNW : out std_logic;
      PLB_SAValid : out std_logic;
      PLB_abort : out std_logic;
      PLB_busLock : out std_logic;
      PLB_TAttribute : out std_logic_vector(0 to 15);
      PLB_lockErr : out std_logic;
      PLB_masterID : out std_logic_vector(0 to 0);
      PLB_MSize : out std_logic_vector(0 to 1);
      PLB_rdPendPri : out std_logic_vector(0 to 1);
      PLB_wrPendPri : out std_logic_vector(0 to 1);
      PLB_rdPendReq : out std_logic;
      PLB_wrPendReq : out std_logic;
      PLB_rdBurst : out std_logic;
      PLB_rdPrim : out std_logic_vector(0 to 3);
      PLB_reqPri : out std_logic_vector(0 to 1);
      PLB_size : out std_logic_vector(0 to 3);
      PLB_type : out std_logic_vector(0 to 2);
      PLB_wrBurst : out std_logic;
      PLB_wrDBus : out std_logic_vector(0 to 31);
      PLB_wrPrim : out std_logic_vector(0 to 3);
      PLB_SaddrAck : out std_logic;
      PLB_SMRdErr : out std_logic_vector(0 to 0);
      PLB_SMWrErr : out std_logic_vector(0 to 0);
      PLB_SMBusy : out std_logic_vector(0 to 0);
      PLB_SrdBTerm : out std_logic;
      PLB_SrdComp : out std_logic;
      PLB_SrdDAck : out std_logic;
      PLB_SrdDBus : out std_logic_vector(0 to 31);
      PLB_SrdWdAddr : out std_logic_vector(0 to 3);
      PLB_Srearbitrate : out std_logic;
      PLB_Sssize : out std_logic_vector(0 to 1);
      PLB_Swait : out std_logic;
      PLB_SwrBTerm : out std_logic;
      PLB_SwrComp : out std_logic;
      PLB_SwrDAck : out std_logic;
      Bus_Error_Det : out std_logic
    );
  end component;

  component system_bram_block_0_wrapper is
    port (
      BRAM_Rst_A : in std_logic;
      BRAM_Clk_A : in std_logic;
      BRAM_EN_A : in std_logic;
      BRAM_WEN_A : in std_logic_vector(0 to 3);
      BRAM_Addr_A : in std_logic_vector(0 to 31);
      BRAM_Din_A : out std_logic_vector(0 to 31);
      BRAM_Dout_A : in std_logic_vector(0 to 31);
      BRAM_Rst_B : in std_logic;
      BRAM_Clk_B : in std_logic;
      BRAM_EN_B : in std_logic;
      BRAM_WEN_B : in std_logic_vector(0 to 3);
      BRAM_Addr_B : in std_logic_vector(0 to 31);
      BRAM_Din_B : out std_logic_vector(0 to 31);
      BRAM_Dout_B : in std_logic_vector(0 to 31)
    );
  end component;

  component system_data_ctrl_wrapper is
    port (
      LMB_Clk : in std_logic;
      LMB_Rst : in std_logic;
      LMB_ABus : in std_logic_vector(0 to 31);
      LMB_WriteDBus : in std_logic_vector(0 to 31);
      LMB_AddrStrobe : in std_logic;
      LMB_ReadStrobe : in std_logic;
      LMB_WriteStrobe : in std_logic;
      LMB_BE : in std_logic_vector(0 to 3);
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_Ready : out std_logic;
      Sl_Wait : out std_logic;
      Sl_UE : out std_logic;
      Sl_CE : out std_logic;
      LMB1_ABus : in std_logic_vector(0 to 31);
      LMB1_WriteDBus : in std_logic_vector(0 to 31);
      LMB1_AddrStrobe : in std_logic;
      LMB1_ReadStrobe : in std_logic;
      LMB1_WriteStrobe : in std_logic;
      LMB1_BE : in std_logic_vector(0 to 3);
      Sl1_DBus : out std_logic_vector(0 to 31);
      Sl1_Ready : out std_logic;
      Sl1_Wait : out std_logic;
      Sl1_UE : out std_logic;
      Sl1_CE : out std_logic;
      LMB2_ABus : in std_logic_vector(0 to 31);
      LMB2_WriteDBus : in std_logic_vector(0 to 31);
      LMB2_AddrStrobe : in std_logic;
      LMB2_ReadStrobe : in std_logic;
      LMB2_WriteStrobe : in std_logic;
      LMB2_BE : in std_logic_vector(0 to 3);
      Sl2_DBus : out std_logic_vector(0 to 31);
      Sl2_Ready : out std_logic;
      Sl2_Wait : out std_logic;
      Sl2_UE : out std_logic;
      Sl2_CE : out std_logic;
      LMB3_ABus : in std_logic_vector(0 to 31);
      LMB3_WriteDBus : in std_logic_vector(0 to 31);
      LMB3_AddrStrobe : in std_logic;
      LMB3_ReadStrobe : in std_logic;
      LMB3_WriteStrobe : in std_logic;
      LMB3_BE : in std_logic_vector(0 to 3);
      Sl3_DBus : out std_logic_vector(0 to 31);
      Sl3_Ready : out std_logic;
      Sl3_Wait : out std_logic;
      Sl3_UE : out std_logic;
      Sl3_CE : out std_logic;
      BRAM_Rst_A : out std_logic;
      BRAM_Clk_A : out std_logic;
      BRAM_EN_A : out std_logic;
      BRAM_WEN_A : out std_logic_vector(0 to 3);
      BRAM_Addr_A : out std_logic_vector(0 to 31);
      BRAM_Din_A : in std_logic_vector(0 to 31);
      BRAM_Dout_A : out std_logic_vector(0 to 31);
      Interrupt : out std_logic;
      UE : out std_logic;
      CE : out std_logic;
      SPLB_CTRL_PLB_ABus : in std_logic_vector(0 to 31);
      SPLB_CTRL_PLB_PAValid : in std_logic;
      SPLB_CTRL_PLB_masterID : in std_logic_vector(0 to 0);
      SPLB_CTRL_PLB_RNW : in std_logic;
      SPLB_CTRL_PLB_BE : in std_logic_vector(0 to 3);
      SPLB_CTRL_PLB_size : in std_logic_vector(0 to 3);
      SPLB_CTRL_PLB_type : in std_logic_vector(0 to 2);
      SPLB_CTRL_PLB_wrDBus : in std_logic_vector(0 to 31);
      SPLB_CTRL_Sl_addrAck : out std_logic;
      SPLB_CTRL_Sl_SSize : out std_logic_vector(0 to 1);
      SPLB_CTRL_Sl_wait : out std_logic;
      SPLB_CTRL_Sl_rearbitrate : out std_logic;
      SPLB_CTRL_Sl_wrDAck : out std_logic;
      SPLB_CTRL_Sl_wrComp : out std_logic;
      SPLB_CTRL_Sl_rdDBus : out std_logic_vector(0 to 31);
      SPLB_CTRL_Sl_rdDAck : out std_logic;
      SPLB_CTRL_Sl_rdComp : out std_logic;
      SPLB_CTRL_Sl_MBusy : out std_logic_vector(0 to 0);
      SPLB_CTRL_Sl_MWrErr : out std_logic_vector(0 to 0);
      SPLB_CTRL_Sl_MRdErr : out std_logic_vector(0 to 0);
      SPLB_CTRL_PLB_UABus : in std_logic_vector(0 to 31);
      SPLB_CTRL_PLB_SAValid : in std_logic;
      SPLB_CTRL_PLB_rdPrim : in std_logic;
      SPLB_CTRL_PLB_wrPrim : in std_logic;
      SPLB_CTRL_PLB_abort : in std_logic;
      SPLB_CTRL_PLB_busLock : in std_logic;
      SPLB_CTRL_PLB_MSize : in std_logic_vector(0 to 1);
      SPLB_CTRL_PLB_lockErr : in std_logic;
      SPLB_CTRL_PLB_wrBurst : in std_logic;
      SPLB_CTRL_PLB_rdBurst : in std_logic;
      SPLB_CTRL_PLB_wrPendReq : in std_logic;
      SPLB_CTRL_PLB_rdPendReq : in std_logic;
      SPLB_CTRL_PLB_wrPendPri : in std_logic_vector(0 to 1);
      SPLB_CTRL_PLB_rdPendPri : in std_logic_vector(0 to 1);
      SPLB_CTRL_PLB_reqPri : in std_logic_vector(0 to 1);
      SPLB_CTRL_PLB_TAttribute : in std_logic_vector(0 to 15);
      SPLB_CTRL_Sl_wrBTerm : out std_logic;
      SPLB_CTRL_Sl_rdWdAddr : out std_logic_vector(0 to 3);
      SPLB_CTRL_Sl_rdBTerm : out std_logic;
      SPLB_CTRL_Sl_MIRQ : out std_logic_vector(0 to 0);
      S_AXI_CTRL_ACLK : in std_logic;
      S_AXI_CTRL_ARESETN : in std_logic;
      S_AXI_CTRL_AWADDR : in std_logic_vector(31 downto 0);
      S_AXI_CTRL_AWVALID : in std_logic;
      S_AXI_CTRL_AWREADY : out std_logic;
      S_AXI_CTRL_WDATA : in std_logic_vector(31 downto 0);
      S_AXI_CTRL_WSTRB : in std_logic_vector(3 downto 0);
      S_AXI_CTRL_WVALID : in std_logic;
      S_AXI_CTRL_WREADY : out std_logic;
      S_AXI_CTRL_BRESP : out std_logic_vector(1 downto 0);
      S_AXI_CTRL_BVALID : out std_logic;
      S_AXI_CTRL_BREADY : in std_logic;
      S_AXI_CTRL_ARADDR : in std_logic_vector(31 downto 0);
      S_AXI_CTRL_ARVALID : in std_logic;
      S_AXI_CTRL_ARREADY : out std_logic;
      S_AXI_CTRL_RDATA : out std_logic_vector(31 downto 0);
      S_AXI_CTRL_RRESP : out std_logic_vector(1 downto 0);
      S_AXI_CTRL_RVALID : out std_logic;
      S_AXI_CTRL_RREADY : in std_logic
    );
  end component;

  component system_inst_ctrl_wrapper is
    port (
      LMB_Clk : in std_logic;
      LMB_Rst : in std_logic;
      LMB_ABus : in std_logic_vector(0 to 31);
      LMB_WriteDBus : in std_logic_vector(0 to 31);
      LMB_AddrStrobe : in std_logic;
      LMB_ReadStrobe : in std_logic;
      LMB_WriteStrobe : in std_logic;
      LMB_BE : in std_logic_vector(0 to 3);
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_Ready : out std_logic;
      Sl_Wait : out std_logic;
      Sl_UE : out std_logic;
      Sl_CE : out std_logic;
      LMB1_ABus : in std_logic_vector(0 to 31);
      LMB1_WriteDBus : in std_logic_vector(0 to 31);
      LMB1_AddrStrobe : in std_logic;
      LMB1_ReadStrobe : in std_logic;
      LMB1_WriteStrobe : in std_logic;
      LMB1_BE : in std_logic_vector(0 to 3);
      Sl1_DBus : out std_logic_vector(0 to 31);
      Sl1_Ready : out std_logic;
      Sl1_Wait : out std_logic;
      Sl1_UE : out std_logic;
      Sl1_CE : out std_logic;
      LMB2_ABus : in std_logic_vector(0 to 31);
      LMB2_WriteDBus : in std_logic_vector(0 to 31);
      LMB2_AddrStrobe : in std_logic;
      LMB2_ReadStrobe : in std_logic;
      LMB2_WriteStrobe : in std_logic;
      LMB2_BE : in std_logic_vector(0 to 3);
      Sl2_DBus : out std_logic_vector(0 to 31);
      Sl2_Ready : out std_logic;
      Sl2_Wait : out std_logic;
      Sl2_UE : out std_logic;
      Sl2_CE : out std_logic;
      LMB3_ABus : in std_logic_vector(0 to 31);
      LMB3_WriteDBus : in std_logic_vector(0 to 31);
      LMB3_AddrStrobe : in std_logic;
      LMB3_ReadStrobe : in std_logic;
      LMB3_WriteStrobe : in std_logic;
      LMB3_BE : in std_logic_vector(0 to 3);
      Sl3_DBus : out std_logic_vector(0 to 31);
      Sl3_Ready : out std_logic;
      Sl3_Wait : out std_logic;
      Sl3_UE : out std_logic;
      Sl3_CE : out std_logic;
      BRAM_Rst_A : out std_logic;
      BRAM_Clk_A : out std_logic;
      BRAM_EN_A : out std_logic;
      BRAM_WEN_A : out std_logic_vector(0 to 3);
      BRAM_Addr_A : out std_logic_vector(0 to 31);
      BRAM_Din_A : in std_logic_vector(0 to 31);
      BRAM_Dout_A : out std_logic_vector(0 to 31);
      Interrupt : out std_logic;
      UE : out std_logic;
      CE : out std_logic;
      SPLB_CTRL_PLB_ABus : in std_logic_vector(0 to 31);
      SPLB_CTRL_PLB_PAValid : in std_logic;
      SPLB_CTRL_PLB_masterID : in std_logic_vector(0 to 0);
      SPLB_CTRL_PLB_RNW : in std_logic;
      SPLB_CTRL_PLB_BE : in std_logic_vector(0 to 3);
      SPLB_CTRL_PLB_size : in std_logic_vector(0 to 3);
      SPLB_CTRL_PLB_type : in std_logic_vector(0 to 2);
      SPLB_CTRL_PLB_wrDBus : in std_logic_vector(0 to 31);
      SPLB_CTRL_Sl_addrAck : out std_logic;
      SPLB_CTRL_Sl_SSize : out std_logic_vector(0 to 1);
      SPLB_CTRL_Sl_wait : out std_logic;
      SPLB_CTRL_Sl_rearbitrate : out std_logic;
      SPLB_CTRL_Sl_wrDAck : out std_logic;
      SPLB_CTRL_Sl_wrComp : out std_logic;
      SPLB_CTRL_Sl_rdDBus : out std_logic_vector(0 to 31);
      SPLB_CTRL_Sl_rdDAck : out std_logic;
      SPLB_CTRL_Sl_rdComp : out std_logic;
      SPLB_CTRL_Sl_MBusy : out std_logic_vector(0 to 0);
      SPLB_CTRL_Sl_MWrErr : out std_logic_vector(0 to 0);
      SPLB_CTRL_Sl_MRdErr : out std_logic_vector(0 to 0);
      SPLB_CTRL_PLB_UABus : in std_logic_vector(0 to 31);
      SPLB_CTRL_PLB_SAValid : in std_logic;
      SPLB_CTRL_PLB_rdPrim : in std_logic;
      SPLB_CTRL_PLB_wrPrim : in std_logic;
      SPLB_CTRL_PLB_abort : in std_logic;
      SPLB_CTRL_PLB_busLock : in std_logic;
      SPLB_CTRL_PLB_MSize : in std_logic_vector(0 to 1);
      SPLB_CTRL_PLB_lockErr : in std_logic;
      SPLB_CTRL_PLB_wrBurst : in std_logic;
      SPLB_CTRL_PLB_rdBurst : in std_logic;
      SPLB_CTRL_PLB_wrPendReq : in std_logic;
      SPLB_CTRL_PLB_rdPendReq : in std_logic;
      SPLB_CTRL_PLB_wrPendPri : in std_logic_vector(0 to 1);
      SPLB_CTRL_PLB_rdPendPri : in std_logic_vector(0 to 1);
      SPLB_CTRL_PLB_reqPri : in std_logic_vector(0 to 1);
      SPLB_CTRL_PLB_TAttribute : in std_logic_vector(0 to 15);
      SPLB_CTRL_Sl_wrBTerm : out std_logic;
      SPLB_CTRL_Sl_rdWdAddr : out std_logic_vector(0 to 3);
      SPLB_CTRL_Sl_rdBTerm : out std_logic;
      SPLB_CTRL_Sl_MIRQ : out std_logic_vector(0 to 0);
      S_AXI_CTRL_ACLK : in std_logic;
      S_AXI_CTRL_ARESETN : in std_logic;
      S_AXI_CTRL_AWADDR : in std_logic_vector(31 downto 0);
      S_AXI_CTRL_AWVALID : in std_logic;
      S_AXI_CTRL_AWREADY : out std_logic;
      S_AXI_CTRL_WDATA : in std_logic_vector(31 downto 0);
      S_AXI_CTRL_WSTRB : in std_logic_vector(3 downto 0);
      S_AXI_CTRL_WVALID : in std_logic;
      S_AXI_CTRL_WREADY : out std_logic;
      S_AXI_CTRL_BRESP : out std_logic_vector(1 downto 0);
      S_AXI_CTRL_BVALID : out std_logic;
      S_AXI_CTRL_BREADY : in std_logic;
      S_AXI_CTRL_ARADDR : in std_logic_vector(31 downto 0);
      S_AXI_CTRL_ARVALID : in std_logic;
      S_AXI_CTRL_ARREADY : out std_logic;
      S_AXI_CTRL_RDATA : out std_logic_vector(31 downto 0);
      S_AXI_CTRL_RRESP : out std_logic_vector(1 downto 0);
      S_AXI_CTRL_RVALID : out std_logic;
      S_AXI_CTRL_RREADY : in std_logic
    );
  end component;

  component system_clock_generator_0_wrapper is
    port (
      CLKIN : in std_logic;
      CLKOUT0 : out std_logic;
      CLKOUT1 : out std_logic;
      CLKOUT2 : out std_logic;
      CLKOUT3 : out std_logic;
      CLKOUT4 : out std_logic;
      CLKOUT5 : out std_logic;
      CLKOUT6 : out std_logic;
      CLKOUT7 : out std_logic;
      CLKOUT8 : out std_logic;
      CLKOUT9 : out std_logic;
      CLKOUT10 : out std_logic;
      CLKOUT11 : out std_logic;
      CLKOUT12 : out std_logic;
      CLKOUT13 : out std_logic;
      CLKOUT14 : out std_logic;
      CLKOUT15 : out std_logic;
      CLKFBIN : in std_logic;
      CLKFBOUT : out std_logic;
      PSCLK : in std_logic;
      PSEN : in std_logic;
      PSINCDEC : in std_logic;
      PSDONE : out std_logic;
      RST : in std_logic;
      LOCKED : out std_logic
    );
  end component;

  component system_reset_0_wrapper is
    port (
      Slowest_sync_clk : in std_logic;
      Ext_Reset_In : in std_logic;
      Aux_Reset_In : in std_logic;
      MB_Debug_Sys_Rst : in std_logic;
      Core_Reset_Req_0 : in std_logic;
      Chip_Reset_Req_0 : in std_logic;
      System_Reset_Req_0 : in std_logic;
      Core_Reset_Req_1 : in std_logic;
      Chip_Reset_Req_1 : in std_logic;
      System_Reset_Req_1 : in std_logic;
      Dcm_locked : in std_logic;
      RstcPPCresetcore_0 : out std_logic;
      RstcPPCresetchip_0 : out std_logic;
      RstcPPCresetsys_0 : out std_logic;
      RstcPPCresetcore_1 : out std_logic;
      RstcPPCresetchip_1 : out std_logic;
      RstcPPCresetsys_1 : out std_logic;
      MB_Reset : out std_logic;
      Bus_Struct_Reset : out std_logic_vector(0 to 0);
      Peripheral_Reset : out std_logic_vector(0 to 0);
      Interconnect_aresetn : out std_logic_vector(0 to 0);
      Peripheral_aresetn : out std_logic_vector(0 to 0)
    );
  end component;

  component system_xps_gpio_0_wrapper is
    port (
      SPLB_Clk : in std_logic;
      SPLB_Rst : in std_logic;
      PLB_ABus : in std_logic_vector(0 to 31);
      PLB_UABus : in std_logic_vector(0 to 31);
      PLB_PAValid : in std_logic;
      PLB_SAValid : in std_logic;
      PLB_rdPrim : in std_logic;
      PLB_wrPrim : in std_logic;
      PLB_masterID : in std_logic_vector(0 to 0);
      PLB_abort : in std_logic;
      PLB_busLock : in std_logic;
      PLB_RNW : in std_logic;
      PLB_BE : in std_logic_vector(0 to 3);
      PLB_MSize : in std_logic_vector(0 to 1);
      PLB_size : in std_logic_vector(0 to 3);
      PLB_type : in std_logic_vector(0 to 2);
      PLB_lockErr : in std_logic;
      PLB_wrDBus : in std_logic_vector(0 to 31);
      PLB_wrBurst : in std_logic;
      PLB_rdBurst : in std_logic;
      PLB_wrPendReq : in std_logic;
      PLB_rdPendReq : in std_logic;
      PLB_wrPendPri : in std_logic_vector(0 to 1);
      PLB_rdPendPri : in std_logic_vector(0 to 1);
      PLB_reqPri : in std_logic_vector(0 to 1);
      PLB_TAttribute : in std_logic_vector(0 to 15);
      Sl_addrAck : out std_logic;
      Sl_SSize : out std_logic_vector(0 to 1);
      Sl_wait : out std_logic;
      Sl_rearbitrate : out std_logic;
      Sl_wrDAck : out std_logic;
      Sl_wrComp : out std_logic;
      Sl_wrBTerm : out std_logic;
      Sl_rdDBus : out std_logic_vector(0 to 31);
      Sl_rdWdAddr : out std_logic_vector(0 to 3);
      Sl_rdDAck : out std_logic;
      Sl_rdComp : out std_logic;
      Sl_rdBTerm : out std_logic;
      Sl_MBusy : out std_logic_vector(0 to 0);
      Sl_MWrErr : out std_logic_vector(0 to 0);
      Sl_MRdErr : out std_logic_vector(0 to 0);
      Sl_MIRQ : out std_logic_vector(0 to 0);
      IP2INTC_Irpt : out std_logic;
      GPIO_IO_I : in std_logic_vector(0 to 7);
      GPIO_IO_O : out std_logic_vector(0 to 7);
      GPIO_IO_T : out std_logic_vector(0 to 7);
      GPIO2_IO_I : in std_logic_vector(0 to 31);
      GPIO2_IO_O : out std_logic_vector(0 to 31);
      GPIO2_IO_T : out std_logic_vector(0 to 31)
    );
  end component;

  component system_xps_gpio_1_wrapper is
    port (
      SPLB_Clk : in std_logic;
      SPLB_Rst : in std_logic;
      PLB_ABus : in std_logic_vector(0 to 31);
      PLB_UABus : in std_logic_vector(0 to 31);
      PLB_PAValid : in std_logic;
      PLB_SAValid : in std_logic;
      PLB_rdPrim : in std_logic;
      PLB_wrPrim : in std_logic;
      PLB_masterID : in std_logic_vector(0 to 0);
      PLB_abort : in std_logic;
      PLB_busLock : in std_logic;
      PLB_RNW : in std_logic;
      PLB_BE : in std_logic_vector(0 to 3);
      PLB_MSize : in std_logic_vector(0 to 1);
      PLB_size : in std_logic_vector(0 to 3);
      PLB_type : in std_logic_vector(0 to 2);
      PLB_lockErr : in std_logic;
      PLB_wrDBus : in std_logic_vector(0 to 31);
      PLB_wrBurst : in std_logic;
      PLB_rdBurst : in std_logic;
      PLB_wrPendReq : in std_logic;
      PLB_rdPendReq : in std_logic;
      PLB_wrPendPri : in std_logic_vector(0 to 1);
      PLB_rdPendPri : in std_logic_vector(0 to 1);
      PLB_reqPri : in std_logic_vector(0 to 1);
      PLB_TAttribute : in std_logic_vector(0 to 15);
      Sl_addrAck : out std_logic;
      Sl_SSize : out std_logic_vector(0 to 1);
      Sl_wait : out std_logic;
      Sl_rearbitrate : out std_logic;
      Sl_wrDAck : out std_logic;
      Sl_wrComp : out std_logic;
      Sl_wrBTerm : out std_logic;
      Sl_rdDBus : out std_logic_vector(0 to 31);
      Sl_rdWdAddr : out std_logic_vector(0 to 3);
      Sl_rdDAck : out std_logic;
      Sl_rdComp : out std_logic;
      Sl_rdBTerm : out std_logic;
      Sl_MBusy : out std_logic_vector(0 to 0);
      Sl_MWrErr : out std_logic_vector(0 to 0);
      Sl_MRdErr : out std_logic_vector(0 to 0);
      Sl_MIRQ : out std_logic_vector(0 to 0);
      IP2INTC_Irpt : out std_logic;
      GPIO_IO_I : in std_logic_vector(0 to 7);
      GPIO_IO_O : out std_logic_vector(0 to 7);
      GPIO_IO_T : out std_logic_vector(0 to 7);
      GPIO2_IO_I : in std_logic_vector(0 to 31);
      GPIO2_IO_O : out std_logic_vector(0 to 31);
      GPIO2_IO_T : out std_logic_vector(0 to 31)
    );
  end component;

  component system_xps_spi_0_wrapper is
    port (
      SCK_I : in std_logic;
      SCK_O : out std_logic;
      SCK_T : out std_logic;
      MISO_I : in std_logic;
      MISO_O : out std_logic;
      MISO_T : out std_logic;
      MOSI_I : in std_logic;
      MOSI_O : out std_logic;
      MOSI_T : out std_logic;
      SPISEL : in std_logic;
      SS_I : in std_logic_vector(0 to 0);
      SS_O : out std_logic_vector(0 to 0);
      SS_T : out std_logic;
      SPLB_Clk : in std_logic;
      SPLB_Rst : in std_logic;
      PLB_ABus : in std_logic_vector(0 to 31);
      PLB_PAValid : in std_logic;
      PLB_masterID : in std_logic_vector(0 to 0);
      PLB_RNW : in std_logic;
      PLB_BE : in std_logic_vector(0 to 3);
      PLB_size : in std_logic_vector(0 to 3);
      PLB_type : in std_logic_vector(0 to 2);
      PLB_wrDBus : in std_logic_vector(0 to 31);
      Sl_addrAck : out std_logic;
      Sl_SSize : out std_logic_vector(0 to 1);
      Sl_wait : out std_logic;
      Sl_rearbitrate : out std_logic;
      Sl_wrDAck : out std_logic;
      Sl_wrComp : out std_logic;
      Sl_rdDBus : out std_logic_vector(0 to 31);
      Sl_rdDAck : out std_logic;
      Sl_rdComp : out std_logic;
      Sl_MBusy : out std_logic_vector(0 to 0);
      Sl_MWrErr : out std_logic_vector(0 to 0);
      Sl_MRdErr : out std_logic_vector(0 to 0);
      PLB_UABus : in std_logic_vector(0 to 31);
      PLB_SAValid : in std_logic;
      PLB_rdPrim : in std_logic;
      PLB_wrPrim : in std_logic;
      PLB_abort : in std_logic;
      PLB_busLock : in std_logic;
      PLB_MSize : in std_logic_vector(0 to 1);
      PLB_lockErr : in std_logic;
      PLB_wrBurst : in std_logic;
      PLB_rdBurst : in std_logic;
      PLB_wrPendReq : in std_logic;
      PLB_rdPendReq : in std_logic;
      PLB_wrPendPri : in std_logic_vector(0 to 1);
      PLB_rdPendPri : in std_logic_vector(0 to 1);
      PLB_reqPri : in std_logic_vector(0 to 1);
      PLB_TAttribute : in std_logic_vector(0 to 15);
      Sl_wrBTerm : out std_logic;
      Sl_rdWdAddr : out std_logic_vector(0 to 3);
      Sl_rdBTerm : out std_logic;
      Sl_MIRQ : out std_logic_vector(0 to 0);
      IP2INTC_Irpt : out std_logic
    );
  end component;

  component system_xps_timer_0_wrapper is
    port (
      CaptureTrig0 : in std_logic;
      CaptureTrig1 : in std_logic;
      GenerateOut0 : out std_logic;
      GenerateOut1 : out std_logic;
      PWM0 : out std_logic;
      Interrupt : out std_logic;
      Freeze : in std_logic;
      SPLB_Clk : in std_logic;
      SPLB_Rst : in std_logic;
      PLB_ABus : in std_logic_vector(0 to 31);
      PLB_PAValid : in std_logic;
      PLB_masterID : in std_logic_vector(0 to 0);
      PLB_RNW : in std_logic;
      PLB_BE : in std_logic_vector(0 to 3);
      PLB_size : in std_logic_vector(0 to 3);
      PLB_type : in std_logic_vector(0 to 2);
      PLB_wrDBus : in std_logic_vector(0 to 31);
      Sl_addrAck : out std_logic;
      Sl_SSize : out std_logic_vector(0 to 1);
      Sl_wait : out std_logic;
      Sl_rearbitrate : out std_logic;
      Sl_wrDAck : out std_logic;
      Sl_wrComp : out std_logic;
      Sl_rdDBus : out std_logic_vector(0 to 31);
      Sl_rdDAck : out std_logic;
      Sl_rdComp : out std_logic;
      Sl_MBusy : out std_logic_vector(0 to 0);
      Sl_MWrErr : out std_logic_vector(0 to 0);
      Sl_MRdErr : out std_logic_vector(0 to 0);
      PLB_UABus : in std_logic_vector(0 to 31);
      PLB_SAValid : in std_logic;
      PLB_rdPrim : in std_logic;
      PLB_wrPrim : in std_logic;
      PLB_abort : in std_logic;
      PLB_busLock : in std_logic;
      PLB_MSize : in std_logic_vector(0 to 1);
      PLB_lockErr : in std_logic;
      PLB_wrBurst : in std_logic;
      PLB_rdBurst : in std_logic;
      PLB_wrPendReq : in std_logic;
      PLB_rdPendReq : in std_logic;
      PLB_wrPendPri : in std_logic_vector(0 to 1);
      PLB_rdPendPri : in std_logic_vector(0 to 1);
      PLB_reqPri : in std_logic_vector(0 to 1);
      PLB_TAttribute : in std_logic_vector(0 to 15);
      Sl_wrBTerm : out std_logic;
      Sl_rdWdAddr : out std_logic_vector(0 to 3);
      Sl_rdBTerm : out std_logic;
      Sl_MIRQ : out std_logic_vector(0 to 0)
    );
  end component;

  component IOBUF is
    port (
      I : in std_logic;
      IO : inout std_logic;
      O : out std_logic;
      T : in std_logic
    );
  end component;

  -- Internal signals

  signal clock_generator_0_CLKOUT0 : std_logic;
  signal clock_generator_0_LOCKED : std_logic;
  signal data_ctrl_BRAM_PORT_BRAM_Addr : std_logic_vector(0 to 31);
  signal data_ctrl_BRAM_PORT_BRAM_Clk : std_logic;
  signal data_ctrl_BRAM_PORT_BRAM_Din : std_logic_vector(0 to 31);
  signal data_ctrl_BRAM_PORT_BRAM_Dout : std_logic_vector(0 to 31);
  signal data_ctrl_BRAM_PORT_BRAM_EN : std_logic;
  signal data_ctrl_BRAM_PORT_BRAM_Rst : std_logic;
  signal data_ctrl_BRAM_PORT_BRAM_WEN : std_logic_vector(0 to 3);
  signal data_lmb_LMB_ABus : std_logic_vector(0 to 31);
  signal data_lmb_LMB_AddrStrobe : std_logic;
  signal data_lmb_LMB_BE : std_logic_vector(0 to 3);
  signal data_lmb_LMB_CE : std_logic;
  signal data_lmb_LMB_ReadDBus : std_logic_vector(0 to 31);
  signal data_lmb_LMB_ReadStrobe : std_logic;
  signal data_lmb_LMB_Ready : std_logic;
  signal data_lmb_LMB_Rst : std_logic;
  signal data_lmb_LMB_UE : std_logic;
  signal data_lmb_LMB_Wait : std_logic;
  signal data_lmb_LMB_WriteDBus : std_logic_vector(0 to 31);
  signal data_lmb_LMB_WriteStrobe : std_logic;
  signal data_lmb_M_ABus : std_logic_vector(0 to 31);
  signal data_lmb_M_AddrStrobe : std_logic;
  signal data_lmb_M_ReadStrobe : std_logic;
  signal data_lmb_Sl_CE : std_logic_vector(0 to 0);
  signal data_lmb_Sl_DBus : std_logic_vector(0 to 31);
  signal data_lmb_Sl_Ready : std_logic_vector(0 to 0);
  signal data_lmb_Sl_UE : std_logic_vector(0 to 0);
  signal data_lmb_Sl_Wait : std_logic_vector(0 to 0);
  signal inst_ctrl_BRAM_PORT_BRAM_Addr : std_logic_vector(0 to 31);
  signal inst_ctrl_BRAM_PORT_BRAM_Clk : std_logic;
  signal inst_ctrl_BRAM_PORT_BRAM_Din : std_logic_vector(0 to 31);
  signal inst_ctrl_BRAM_PORT_BRAM_Dout : std_logic_vector(0 to 31);
  signal inst_ctrl_BRAM_PORT_BRAM_EN : std_logic;
  signal inst_ctrl_BRAM_PORT_BRAM_Rst : std_logic;
  signal inst_ctrl_BRAM_PORT_BRAM_WEN : std_logic_vector(0 to 3);
  signal inst_lmb_LMB_ABus : std_logic_vector(0 to 31);
  signal inst_lmb_LMB_AddrStrobe : std_logic;
  signal inst_lmb_LMB_BE : std_logic_vector(0 to 3);
  signal inst_lmb_LMB_CE : std_logic;
  signal inst_lmb_LMB_ReadDBus : std_logic_vector(0 to 31);
  signal inst_lmb_LMB_ReadStrobe : std_logic;
  signal inst_lmb_LMB_Ready : std_logic;
  signal inst_lmb_LMB_Rst : std_logic;
  signal inst_lmb_LMB_UE : std_logic;
  signal inst_lmb_LMB_Wait : std_logic;
  signal inst_lmb_LMB_WriteDBus : std_logic_vector(0 to 31);
  signal inst_lmb_LMB_WriteStrobe : std_logic;
  signal inst_lmb_M_ABus : std_logic_vector(0 to 31);
  signal inst_lmb_M_AddrStrobe : std_logic;
  signal inst_lmb_M_BE : std_logic_vector(0 to 3);
  signal inst_lmb_M_DBus : std_logic_vector(0 to 31);
  signal inst_lmb_M_ReadStrobe : std_logic;
  signal inst_lmb_M_WriteStrobe : std_logic;
  signal inst_lmb_Sl_CE : std_logic_vector(0 to 0);
  signal inst_lmb_Sl_DBus : std_logic_vector(0 to 31);
  signal inst_lmb_Sl_Ready : std_logic_vector(0 to 0);
  signal inst_lmb_Sl_UE : std_logic_vector(0 to 0);
  signal inst_lmb_Sl_Wait : std_logic_vector(0 to 0);
  signal net_clock_generator_0_CLKIN_pin : std_logic;
  signal net_clock_generator_0_RST_pin : std_logic;
  signal net_gnd0 : std_logic;
  signal net_gnd1 : std_logic_vector(0 downto 0);
  signal net_gnd2 : std_logic_vector(0 to 1);
  signal net_gnd3 : std_logic_vector(2 downto 0);
  signal net_gnd4 : std_logic_vector(0 to 3);
  signal net_gnd8 : std_logic_vector(0 to 7);
  signal net_gnd10 : std_logic_vector(0 to 9);
  signal net_gnd16 : std_logic_vector(0 to 15);
  signal net_gnd32 : std_logic_vector(0 to 31);
  signal net_gnd4096 : std_logic_vector(0 to 4095);
  signal net_vcc0 : std_logic;
  signal plb_v46_0_M_ABort : std_logic_vector(0 to 0);
  signal plb_v46_0_M_ABus : std_logic_vector(0 to 31);
  signal plb_v46_0_M_BE : std_logic_vector(0 to 3);
  signal plb_v46_0_M_MSize : std_logic_vector(0 to 1);
  signal plb_v46_0_M_RNW : std_logic_vector(0 to 0);
  signal plb_v46_0_M_TAttribute : std_logic_vector(0 to 15);
  signal plb_v46_0_M_UABus : std_logic_vector(0 to 31);
  signal plb_v46_0_M_busLock : std_logic_vector(0 to 0);
  signal plb_v46_0_M_lockErr : std_logic_vector(0 to 0);
  signal plb_v46_0_M_priority : std_logic_vector(0 to 1);
  signal plb_v46_0_M_rdBurst : std_logic_vector(0 to 0);
  signal plb_v46_0_M_request : std_logic_vector(0 to 0);
  signal plb_v46_0_M_size : std_logic_vector(0 to 3);
  signal plb_v46_0_M_type : std_logic_vector(0 to 2);
  signal plb_v46_0_M_wrBurst : std_logic_vector(0 to 0);
  signal plb_v46_0_M_wrDBus : std_logic_vector(0 to 31);
  signal plb_v46_0_PLB_ABus : std_logic_vector(0 to 31);
  signal plb_v46_0_PLB_BE : std_logic_vector(0 to 3);
  signal plb_v46_0_PLB_MAddrAck : std_logic_vector(0 to 0);
  signal plb_v46_0_PLB_MBusy : std_logic_vector(0 to 0);
  signal plb_v46_0_PLB_MIRQ : std_logic_vector(0 to 0);
  signal plb_v46_0_PLB_MRdBTerm : std_logic_vector(0 to 0);
  signal plb_v46_0_PLB_MRdDAck : std_logic_vector(0 to 0);
  signal plb_v46_0_PLB_MRdDBus : std_logic_vector(0 to 31);
  signal plb_v46_0_PLB_MRdErr : std_logic_vector(0 to 0);
  signal plb_v46_0_PLB_MRdWdAddr : std_logic_vector(0 to 3);
  signal plb_v46_0_PLB_MRearbitrate : std_logic_vector(0 to 0);
  signal plb_v46_0_PLB_MSSize : std_logic_vector(0 to 1);
  signal plb_v46_0_PLB_MSize : std_logic_vector(0 to 1);
  signal plb_v46_0_PLB_MTimeout : std_logic_vector(0 to 0);
  signal plb_v46_0_PLB_MWrBTerm : std_logic_vector(0 to 0);
  signal plb_v46_0_PLB_MWrDAck : std_logic_vector(0 to 0);
  signal plb_v46_0_PLB_MWrErr : std_logic_vector(0 to 0);
  signal plb_v46_0_PLB_PAValid : std_logic;
  signal plb_v46_0_PLB_RNW : std_logic;
  signal plb_v46_0_PLB_SAValid : std_logic;
  signal plb_v46_0_PLB_TAttribute : std_logic_vector(0 to 15);
  signal plb_v46_0_PLB_UABus : std_logic_vector(0 to 31);
  signal plb_v46_0_PLB_abort : std_logic;
  signal plb_v46_0_PLB_busLock : std_logic;
  signal plb_v46_0_PLB_lockErr : std_logic;
  signal plb_v46_0_PLB_masterID : std_logic_vector(0 to 0);
  signal plb_v46_0_PLB_rdBurst : std_logic;
  signal plb_v46_0_PLB_rdPendPri : std_logic_vector(0 to 1);
  signal plb_v46_0_PLB_rdPendReq : std_logic;
  signal plb_v46_0_PLB_rdPrim : std_logic_vector(0 to 3);
  signal plb_v46_0_PLB_reqPri : std_logic_vector(0 to 1);
  signal plb_v46_0_PLB_size : std_logic_vector(0 to 3);
  signal plb_v46_0_PLB_type : std_logic_vector(0 to 2);
  signal plb_v46_0_PLB_wrBurst : std_logic;
  signal plb_v46_0_PLB_wrDBus : std_logic_vector(0 to 31);
  signal plb_v46_0_PLB_wrPendPri : std_logic_vector(0 to 1);
  signal plb_v46_0_PLB_wrPendReq : std_logic;
  signal plb_v46_0_PLB_wrPrim : std_logic_vector(0 to 3);
  signal plb_v46_0_SPLB_Rst : std_logic_vector(0 to 3);
  signal plb_v46_0_Sl_MBusy : std_logic_vector(0 to 3);
  signal plb_v46_0_Sl_MIRQ : std_logic_vector(0 to 3);
  signal plb_v46_0_Sl_MRdErr : std_logic_vector(0 to 3);
  signal plb_v46_0_Sl_MWrErr : std_logic_vector(0 to 3);
  signal plb_v46_0_Sl_SSize : std_logic_vector(0 to 7);
  signal plb_v46_0_Sl_addrAck : std_logic_vector(0 to 3);
  signal plb_v46_0_Sl_rdBTerm : std_logic_vector(0 to 3);
  signal plb_v46_0_Sl_rdComp : std_logic_vector(0 to 3);
  signal plb_v46_0_Sl_rdDAck : std_logic_vector(0 to 3);
  signal plb_v46_0_Sl_rdDBus : std_logic_vector(0 to 127);
  signal plb_v46_0_Sl_rdWdAddr : std_logic_vector(0 to 15);
  signal plb_v46_0_Sl_rearbitrate : std_logic_vector(0 to 3);
  signal plb_v46_0_Sl_wait : std_logic_vector(0 to 3);
  signal plb_v46_0_Sl_wrBTerm : std_logic_vector(0 to 3);
  signal plb_v46_0_Sl_wrComp : std_logic_vector(0 to 3);
  signal plb_v46_0_Sl_wrDAck : std_logic_vector(0 to 3);
  signal reset_0_Bus_Struct_Reset : std_logic_vector(0 to 0);
  signal reset_0_MB_Reset : std_logic;
  signal xps_gpio_0_GPIO_IO_O : std_logic_vector(0 to 7);
  signal xps_gpio_1_GPIO_IO_I : std_logic_vector(0 to 7);
  signal xps_spi_0_MISO_I : std_logic;
  signal xps_spi_0_MISO_O : std_logic;
  signal xps_spi_0_MISO_T : std_logic;
  signal xps_spi_0_MOSI_I : std_logic;
  signal xps_spi_0_MOSI_O : std_logic;
  signal xps_spi_0_MOSI_T : std_logic;
  signal xps_spi_0_SCK_I : std_logic;
  signal xps_spi_0_SCK_O : std_logic;
  signal xps_spi_0_SCK_T : std_logic;
  signal xps_spi_0_SPISEL : std_logic;
  signal xps_spi_0_SS_I : std_logic_vector(0 to 0);
  signal xps_spi_0_SS_O : std_logic_vector(0 to 0);
  signal xps_spi_0_SS_T : std_logic;
  signal xps_timer_0_GenerateOut0 : std_logic;
  signal xps_timer_0_GenerateOut1 : std_logic;
  signal xps_timer_0_PWM0 : std_logic;

  attribute BOX_TYPE : STRING;
  attribute BOX_TYPE of system_microblaze_0_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_data_lmb_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_inst_lmb_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_plb_v46_0_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_bram_block_0_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_data_ctrl_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_inst_ctrl_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_clock_generator_0_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_reset_0_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_xps_gpio_0_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_xps_gpio_1_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_xps_spi_0_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_xps_timer_0_wrapper : component is "user_black_box";

begin

  -- Internal assignments

  net_clock_generator_0_CLKIN_pin <= clock_generator_0_CLKIN_pin;
  net_clock_generator_0_RST_pin <= clock_generator_0_RST_pin;
  xps_gpio_0_GPIO_IO_O_pin <= xps_gpio_0_GPIO_IO_O;
  xps_gpio_1_GPIO_IO_I <= xps_gpio_1_GPIO_IO_I_pin;
  xps_spi_0_SPISEL <= xps_spi_0_SPISEL_pin;
  xps_timer_0_PWM0_pin <= xps_timer_0_PWM0;
  xps_timer_0_GenerateOut0_pin <= xps_timer_0_GenerateOut0;
  xps_timer_0_GenerateOut1_pin <= xps_timer_0_GenerateOut1;
  net_gnd0 <= '0';
  net_gnd1(0 downto 0) <= B"0";
  net_gnd10(0 to 9) <= B"0000000000";
  net_gnd16(0 to 15) <= B"0000000000000000";
  net_gnd2(0 to 1) <= B"00";
  net_gnd3(2 downto 0) <= B"000";
  net_gnd32(0 to 31) <= B"00000000000000000000000000000000";
  net_gnd4(0 to 3) <= B"0000";
  net_gnd4096(0 to 4095) <= X"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
  net_gnd8(0 to 7) <= B"00000000";
  net_vcc0 <= '1';

  microblaze_0 : system_microblaze_0_wrapper
    port map (
      CLK => clock_generator_0_CLKOUT0,
      RESET => inst_lmb_LMB_Rst,
      MB_RESET => reset_0_MB_Reset,
      INTERRUPT => net_gnd0,
      INTERRUPT_ADDRESS => net_gnd32,
      INTERRUPT_ACK => open,
      EXT_BRK => net_gnd0,
      EXT_NM_BRK => net_gnd0,
      DBG_STOP => net_gnd0,
      MB_Halted => open,
      MB_Error => open,
      WAKEUP => net_gnd2,
      SLEEP => open,
      DBG_WAKEUP => open,
      LOCKSTEP_MASTER_OUT => open,
      LOCKSTEP_SLAVE_IN => net_gnd4096,
      LOCKSTEP_OUT => open,
      INSTR => data_lmb_LMB_ReadDBus,
      IREADY => data_lmb_LMB_Ready,
      IWAIT => data_lmb_LMB_Wait,
      ICE => data_lmb_LMB_CE,
      IUE => data_lmb_LMB_UE,
      INSTR_ADDR => data_lmb_M_ABus,
      IFETCH => data_lmb_M_ReadStrobe,
      I_AS => data_lmb_M_AddrStrobe,
      IPLB_M_ABort => open,
      IPLB_M_ABus => open,
      IPLB_M_UABus => open,
      IPLB_M_BE => open,
      IPLB_M_busLock => open,
      IPLB_M_lockErr => open,
      IPLB_M_MSize => open,
      IPLB_M_priority => open,
      IPLB_M_rdBurst => open,
      IPLB_M_request => open,
      IPLB_M_RNW => open,
      IPLB_M_size => open,
      IPLB_M_TAttribute => open,
      IPLB_M_type => open,
      IPLB_M_wrBurst => open,
      IPLB_M_wrDBus => open,
      IPLB_MBusy => net_gnd0,
      IPLB_MRdErr => net_gnd0,
      IPLB_MWrErr => net_gnd0,
      IPLB_MIRQ => net_gnd0,
      IPLB_MWrBTerm => net_gnd0,
      IPLB_MWrDAck => net_gnd0,
      IPLB_MAddrAck => net_gnd0,
      IPLB_MRdBTerm => net_gnd0,
      IPLB_MRdDAck => net_gnd0,
      IPLB_MRdDBus => net_gnd32,
      IPLB_MRdWdAddr => net_gnd4,
      IPLB_MRearbitrate => net_gnd0,
      IPLB_MSSize => net_gnd2,
      IPLB_MTimeout => net_gnd0,
      DATA_READ => inst_lmb_LMB_ReadDBus,
      DREADY => inst_lmb_LMB_Ready,
      DWAIT => inst_lmb_LMB_Wait,
      DCE => inst_lmb_LMB_CE,
      DUE => inst_lmb_LMB_UE,
      DATA_WRITE => inst_lmb_M_DBus,
      DATA_ADDR => inst_lmb_M_ABus,
      D_AS => inst_lmb_M_AddrStrobe,
      READ_STROBE => inst_lmb_M_ReadStrobe,
      WRITE_STROBE => inst_lmb_M_WriteStrobe,
      BYTE_ENABLE => inst_lmb_M_BE,
      DPLB_M_ABort => plb_v46_0_M_ABort(0),
      DPLB_M_ABus => plb_v46_0_M_ABus,
      DPLB_M_UABus => plb_v46_0_M_UABus,
      DPLB_M_BE => plb_v46_0_M_BE,
      DPLB_M_busLock => plb_v46_0_M_busLock(0),
      DPLB_M_lockErr => plb_v46_0_M_lockErr(0),
      DPLB_M_MSize => plb_v46_0_M_MSize,
      DPLB_M_priority => plb_v46_0_M_priority,
      DPLB_M_rdBurst => plb_v46_0_M_rdBurst(0),
      DPLB_M_request => plb_v46_0_M_request(0),
      DPLB_M_RNW => plb_v46_0_M_RNW(0),
      DPLB_M_size => plb_v46_0_M_size,
      DPLB_M_TAttribute => plb_v46_0_M_TAttribute,
      DPLB_M_type => plb_v46_0_M_type,
      DPLB_M_wrBurst => plb_v46_0_M_wrBurst(0),
      DPLB_M_wrDBus => plb_v46_0_M_wrDBus,
      DPLB_MBusy => plb_v46_0_PLB_MBusy(0),
      DPLB_MRdErr => plb_v46_0_PLB_MRdErr(0),
      DPLB_MWrErr => plb_v46_0_PLB_MWrErr(0),
      DPLB_MIRQ => plb_v46_0_PLB_MIRQ(0),
      DPLB_MWrBTerm => plb_v46_0_PLB_MWrBTerm(0),
      DPLB_MWrDAck => plb_v46_0_PLB_MWrDAck(0),
      DPLB_MAddrAck => plb_v46_0_PLB_MAddrAck(0),
      DPLB_MRdBTerm => plb_v46_0_PLB_MRdBTerm(0),
      DPLB_MRdDAck => plb_v46_0_PLB_MRdDAck(0),
      DPLB_MRdDBus => plb_v46_0_PLB_MRdDBus,
      DPLB_MRdWdAddr => plb_v46_0_PLB_MRdWdAddr,
      DPLB_MRearbitrate => plb_v46_0_PLB_MRearbitrate(0),
      DPLB_MSSize => plb_v46_0_PLB_MSSize,
      DPLB_MTimeout => plb_v46_0_PLB_MTimeout(0),
      M_AXI_IP_AWID => open,
      M_AXI_IP_AWADDR => open,
      M_AXI_IP_AWLEN => open,
      M_AXI_IP_AWSIZE => open,
      M_AXI_IP_AWBURST => open,
      M_AXI_IP_AWLOCK => open,
      M_AXI_IP_AWCACHE => open,
      M_AXI_IP_AWPROT => open,
      M_AXI_IP_AWQOS => open,
      M_AXI_IP_AWVALID => open,
      M_AXI_IP_AWREADY => net_gnd0,
      M_AXI_IP_WDATA => open,
      M_AXI_IP_WSTRB => open,
      M_AXI_IP_WLAST => open,
      M_AXI_IP_WVALID => open,
      M_AXI_IP_WREADY => net_gnd0,
      M_AXI_IP_BID => net_gnd1(0 downto 0),
      M_AXI_IP_BRESP => net_gnd2(0 to 1),
      M_AXI_IP_BVALID => net_gnd0,
      M_AXI_IP_BREADY => open,
      M_AXI_IP_ARID => open,
      M_AXI_IP_ARADDR => open,
      M_AXI_IP_ARLEN => open,
      M_AXI_IP_ARSIZE => open,
      M_AXI_IP_ARBURST => open,
      M_AXI_IP_ARLOCK => open,
      M_AXI_IP_ARCACHE => open,
      M_AXI_IP_ARPROT => open,
      M_AXI_IP_ARQOS => open,
      M_AXI_IP_ARVALID => open,
      M_AXI_IP_ARREADY => net_gnd0,
      M_AXI_IP_RID => net_gnd1(0 downto 0),
      M_AXI_IP_RDATA => net_gnd32(0 to 31),
      M_AXI_IP_RRESP => net_gnd2(0 to 1),
      M_AXI_IP_RLAST => net_gnd0,
      M_AXI_IP_RVALID => net_gnd0,
      M_AXI_IP_RREADY => open,
      M_AXI_DP_AWID => open,
      M_AXI_DP_AWADDR => open,
      M_AXI_DP_AWLEN => open,
      M_AXI_DP_AWSIZE => open,
      M_AXI_DP_AWBURST => open,
      M_AXI_DP_AWLOCK => open,
      M_AXI_DP_AWCACHE => open,
      M_AXI_DP_AWPROT => open,
      M_AXI_DP_AWQOS => open,
      M_AXI_DP_AWVALID => open,
      M_AXI_DP_AWREADY => net_gnd0,
      M_AXI_DP_WDATA => open,
      M_AXI_DP_WSTRB => open,
      M_AXI_DP_WLAST => open,
      M_AXI_DP_WVALID => open,
      M_AXI_DP_WREADY => net_gnd0,
      M_AXI_DP_BID => net_gnd1(0 downto 0),
      M_AXI_DP_BRESP => net_gnd2(0 to 1),
      M_AXI_DP_BVALID => net_gnd0,
      M_AXI_DP_BREADY => open,
      M_AXI_DP_ARID => open,
      M_AXI_DP_ARADDR => open,
      M_AXI_DP_ARLEN => open,
      M_AXI_DP_ARSIZE => open,
      M_AXI_DP_ARBURST => open,
      M_AXI_DP_ARLOCK => open,
      M_AXI_DP_ARCACHE => open,
      M_AXI_DP_ARPROT => open,
      M_AXI_DP_ARQOS => open,
      M_AXI_DP_ARVALID => open,
      M_AXI_DP_ARREADY => net_gnd0,
      M_AXI_DP_RID => net_gnd1(0 downto 0),
      M_AXI_DP_RDATA => net_gnd32(0 to 31),
      M_AXI_DP_RRESP => net_gnd2(0 to 1),
      M_AXI_DP_RLAST => net_gnd0,
      M_AXI_DP_RVALID => net_gnd0,
      M_AXI_DP_RREADY => open,
      M_AXI_IC_AWID => open,
      M_AXI_IC_AWADDR => open,
      M_AXI_IC_AWLEN => open,
      M_AXI_IC_AWSIZE => open,
      M_AXI_IC_AWBURST => open,
      M_AXI_IC_AWLOCK => open,
      M_AXI_IC_AWCACHE => open,
      M_AXI_IC_AWPROT => open,
      M_AXI_IC_AWQOS => open,
      M_AXI_IC_AWVALID => open,
      M_AXI_IC_AWREADY => net_gnd0,
      M_AXI_IC_AWUSER => open,
      M_AXI_IC_AWDOMAIN => open,
      M_AXI_IC_AWSNOOP => open,
      M_AXI_IC_AWBAR => open,
      M_AXI_IC_WDATA => open,
      M_AXI_IC_WSTRB => open,
      M_AXI_IC_WLAST => open,
      M_AXI_IC_WVALID => open,
      M_AXI_IC_WREADY => net_gnd0,
      M_AXI_IC_WUSER => open,
      M_AXI_IC_BID => net_gnd1(0 downto 0),
      M_AXI_IC_BRESP => net_gnd2(0 to 1),
      M_AXI_IC_BVALID => net_gnd0,
      M_AXI_IC_BREADY => open,
      M_AXI_IC_BUSER => net_gnd1(0 downto 0),
      M_AXI_IC_WACK => open,
      M_AXI_IC_ARID => open,
      M_AXI_IC_ARADDR => open,
      M_AXI_IC_ARLEN => open,
      M_AXI_IC_ARSIZE => open,
      M_AXI_IC_ARBURST => open,
      M_AXI_IC_ARLOCK => open,
      M_AXI_IC_ARCACHE => open,
      M_AXI_IC_ARPROT => open,
      M_AXI_IC_ARQOS => open,
      M_AXI_IC_ARVALID => open,
      M_AXI_IC_ARREADY => net_gnd0,
      M_AXI_IC_ARUSER => open,
      M_AXI_IC_ARDOMAIN => open,
      M_AXI_IC_ARSNOOP => open,
      M_AXI_IC_ARBAR => open,
      M_AXI_IC_RID => net_gnd1(0 downto 0),
      M_AXI_IC_RDATA => net_gnd32(0 to 31),
      M_AXI_IC_RRESP => net_gnd2(0 to 1),
      M_AXI_IC_RLAST => net_gnd0,
      M_AXI_IC_RVALID => net_gnd0,
      M_AXI_IC_RREADY => open,
      M_AXI_IC_RUSER => net_gnd1(0 downto 0),
      M_AXI_IC_RACK => open,
      M_AXI_IC_ACVALID => net_gnd0,
      M_AXI_IC_ACADDR => net_gnd32(0 to 31),
      M_AXI_IC_ACSNOOP => net_gnd4(0 to 3),
      M_AXI_IC_ACPROT => net_gnd3,
      M_AXI_IC_ACREADY => open,
      M_AXI_IC_CRREADY => net_gnd0,
      M_AXI_IC_CRVALID => open,
      M_AXI_IC_CRRESP => open,
      M_AXI_IC_CDVALID => open,
      M_AXI_IC_CDREADY => net_gnd0,
      M_AXI_IC_CDDATA => open,
      M_AXI_IC_CDLAST => open,
      M_AXI_DC_AWID => open,
      M_AXI_DC_AWADDR => open,
      M_AXI_DC_AWLEN => open,
      M_AXI_DC_AWSIZE => open,
      M_AXI_DC_AWBURST => open,
      M_AXI_DC_AWLOCK => open,
      M_AXI_DC_AWCACHE => open,
      M_AXI_DC_AWPROT => open,
      M_AXI_DC_AWQOS => open,
      M_AXI_DC_AWVALID => open,
      M_AXI_DC_AWREADY => net_gnd0,
      M_AXI_DC_AWUSER => open,
      M_AXI_DC_AWDOMAIN => open,
      M_AXI_DC_AWSNOOP => open,
      M_AXI_DC_AWBAR => open,
      M_AXI_DC_WDATA => open,
      M_AXI_DC_WSTRB => open,
      M_AXI_DC_WLAST => open,
      M_AXI_DC_WVALID => open,
      M_AXI_DC_WREADY => net_gnd0,
      M_AXI_DC_WUSER => open,
      M_AXI_DC_BID => net_gnd1(0 downto 0),
      M_AXI_DC_BRESP => net_gnd2(0 to 1),
      M_AXI_DC_BVALID => net_gnd0,
      M_AXI_DC_BREADY => open,
      M_AXI_DC_BUSER => net_gnd1(0 downto 0),
      M_AXI_DC_WACK => open,
      M_AXI_DC_ARID => open,
      M_AXI_DC_ARADDR => open,
      M_AXI_DC_ARLEN => open,
      M_AXI_DC_ARSIZE => open,
      M_AXI_DC_ARBURST => open,
      M_AXI_DC_ARLOCK => open,
      M_AXI_DC_ARCACHE => open,
      M_AXI_DC_ARPROT => open,
      M_AXI_DC_ARQOS => open,
      M_AXI_DC_ARVALID => open,
      M_AXI_DC_ARREADY => net_gnd0,
      M_AXI_DC_ARUSER => open,
      M_AXI_DC_ARDOMAIN => open,
      M_AXI_DC_ARSNOOP => open,
      M_AXI_DC_ARBAR => open,
      M_AXI_DC_RID => net_gnd1(0 downto 0),
      M_AXI_DC_RDATA => net_gnd32(0 to 31),
      M_AXI_DC_RRESP => net_gnd2(0 to 1),
      M_AXI_DC_RLAST => net_gnd0,
      M_AXI_DC_RVALID => net_gnd0,
      M_AXI_DC_RREADY => open,
      M_AXI_DC_RUSER => net_gnd1(0 downto 0),
      M_AXI_DC_RACK => open,
      M_AXI_DC_ACVALID => net_gnd0,
      M_AXI_DC_ACADDR => net_gnd32(0 to 31),
      M_AXI_DC_ACSNOOP => net_gnd4(0 to 3),
      M_AXI_DC_ACPROT => net_gnd3,
      M_AXI_DC_ACREADY => open,
      M_AXI_DC_CRREADY => net_gnd0,
      M_AXI_DC_CRVALID => open,
      M_AXI_DC_CRRESP => open,
      M_AXI_DC_CDVALID => open,
      M_AXI_DC_CDREADY => net_gnd0,
      M_AXI_DC_CDDATA => open,
      M_AXI_DC_CDLAST => open,
      DBG_CLK => net_gnd0,
      DBG_TDI => net_gnd0,
      DBG_TDO => open,
      DBG_REG_EN => net_gnd8,
      DBG_SHIFT => net_gnd0,
      DBG_CAPTURE => net_gnd0,
      DBG_UPDATE => net_gnd0,
      DEBUG_RST => net_gnd0,
      Trace_Instruction => open,
      Trace_Valid_Instr => open,
      Trace_PC => open,
      Trace_Reg_Write => open,
      Trace_Reg_Addr => open,
      Trace_MSR_Reg => open,
      Trace_PID_Reg => open,
      Trace_New_Reg_Value => open,
      Trace_Exception_Taken => open,
      Trace_Exception_Kind => open,
      Trace_Jump_Taken => open,
      Trace_Delay_Slot => open,
      Trace_Data_Address => open,
      Trace_Data_Access => open,
      Trace_Data_Read => open,
      Trace_Data_Write => open,
      Trace_Data_Write_Value => open,
      Trace_Data_Byte_Enable => open,
      Trace_DCache_Req => open,
      Trace_DCache_Hit => open,
      Trace_DCache_Rdy => open,
      Trace_DCache_Read => open,
      Trace_ICache_Req => open,
      Trace_ICache_Hit => open,
      Trace_ICache_Rdy => open,
      Trace_OF_PipeRun => open,
      Trace_EX_PipeRun => open,
      Trace_MEM_PipeRun => open,
      Trace_MB_Halted => open,
      Trace_Jump_Hit => open,
      FSL0_S_CLK => open,
      FSL0_S_READ => open,
      FSL0_S_DATA => net_gnd32,
      FSL0_S_CONTROL => net_gnd0,
      FSL0_S_EXISTS => net_gnd0,
      FSL0_M_CLK => open,
      FSL0_M_WRITE => open,
      FSL0_M_DATA => open,
      FSL0_M_CONTROL => open,
      FSL0_M_FULL => net_gnd0,
      FSL1_S_CLK => open,
      FSL1_S_READ => open,
      FSL1_S_DATA => net_gnd32,
      FSL1_S_CONTROL => net_gnd0,
      FSL1_S_EXISTS => net_gnd0,
      FSL1_M_CLK => open,
      FSL1_M_WRITE => open,
      FSL1_M_DATA => open,
      FSL1_M_CONTROL => open,
      FSL1_M_FULL => net_gnd0,
      FSL2_S_CLK => open,
      FSL2_S_READ => open,
      FSL2_S_DATA => net_gnd32,
      FSL2_S_CONTROL => net_gnd0,
      FSL2_S_EXISTS => net_gnd0,
      FSL2_M_CLK => open,
      FSL2_M_WRITE => open,
      FSL2_M_DATA => open,
      FSL2_M_CONTROL => open,
      FSL2_M_FULL => net_gnd0,
      FSL3_S_CLK => open,
      FSL3_S_READ => open,
      FSL3_S_DATA => net_gnd32,
      FSL3_S_CONTROL => net_gnd0,
      FSL3_S_EXISTS => net_gnd0,
      FSL3_M_CLK => open,
      FSL3_M_WRITE => open,
      FSL3_M_DATA => open,
      FSL3_M_CONTROL => open,
      FSL3_M_FULL => net_gnd0,
      FSL4_S_CLK => open,
      FSL4_S_READ => open,
      FSL4_S_DATA => net_gnd32,
      FSL4_S_CONTROL => net_gnd0,
      FSL4_S_EXISTS => net_gnd0,
      FSL4_M_CLK => open,
      FSL4_M_WRITE => open,
      FSL4_M_DATA => open,
      FSL4_M_CONTROL => open,
      FSL4_M_FULL => net_gnd0,
      FSL5_S_CLK => open,
      FSL5_S_READ => open,
      FSL5_S_DATA => net_gnd32,
      FSL5_S_CONTROL => net_gnd0,
      FSL5_S_EXISTS => net_gnd0,
      FSL5_M_CLK => open,
      FSL5_M_WRITE => open,
      FSL5_M_DATA => open,
      FSL5_M_CONTROL => open,
      FSL5_M_FULL => net_gnd0,
      FSL6_S_CLK => open,
      FSL6_S_READ => open,
      FSL6_S_DATA => net_gnd32,
      FSL6_S_CONTROL => net_gnd0,
      FSL6_S_EXISTS => net_gnd0,
      FSL6_M_CLK => open,
      FSL6_M_WRITE => open,
      FSL6_M_DATA => open,
      FSL6_M_CONTROL => open,
      FSL6_M_FULL => net_gnd0,
      FSL7_S_CLK => open,
      FSL7_S_READ => open,
      FSL7_S_DATA => net_gnd32,
      FSL7_S_CONTROL => net_gnd0,
      FSL7_S_EXISTS => net_gnd0,
      FSL7_M_CLK => open,
      FSL7_M_WRITE => open,
      FSL7_M_DATA => open,
      FSL7_M_CONTROL => open,
      FSL7_M_FULL => net_gnd0,
      FSL8_S_CLK => open,
      FSL8_S_READ => open,
      FSL8_S_DATA => net_gnd32,
      FSL8_S_CONTROL => net_gnd0,
      FSL8_S_EXISTS => net_gnd0,
      FSL8_M_CLK => open,
      FSL8_M_WRITE => open,
      FSL8_M_DATA => open,
      FSL8_M_CONTROL => open,
      FSL8_M_FULL => net_gnd0,
      FSL9_S_CLK => open,
      FSL9_S_READ => open,
      FSL9_S_DATA => net_gnd32,
      FSL9_S_CONTROL => net_gnd0,
      FSL9_S_EXISTS => net_gnd0,
      FSL9_M_CLK => open,
      FSL9_M_WRITE => open,
      FSL9_M_DATA => open,
      FSL9_M_CONTROL => open,
      FSL9_M_FULL => net_gnd0,
      FSL10_S_CLK => open,
      FSL10_S_READ => open,
      FSL10_S_DATA => net_gnd32,
      FSL10_S_CONTROL => net_gnd0,
      FSL10_S_EXISTS => net_gnd0,
      FSL10_M_CLK => open,
      FSL10_M_WRITE => open,
      FSL10_M_DATA => open,
      FSL10_M_CONTROL => open,
      FSL10_M_FULL => net_gnd0,
      FSL11_S_CLK => open,
      FSL11_S_READ => open,
      FSL11_S_DATA => net_gnd32,
      FSL11_S_CONTROL => net_gnd0,
      FSL11_S_EXISTS => net_gnd0,
      FSL11_M_CLK => open,
      FSL11_M_WRITE => open,
      FSL11_M_DATA => open,
      FSL11_M_CONTROL => open,
      FSL11_M_FULL => net_gnd0,
      FSL12_S_CLK => open,
      FSL12_S_READ => open,
      FSL12_S_DATA => net_gnd32,
      FSL12_S_CONTROL => net_gnd0,
      FSL12_S_EXISTS => net_gnd0,
      FSL12_M_CLK => open,
      FSL12_M_WRITE => open,
      FSL12_M_DATA => open,
      FSL12_M_CONTROL => open,
      FSL12_M_FULL => net_gnd0,
      FSL13_S_CLK => open,
      FSL13_S_READ => open,
      FSL13_S_DATA => net_gnd32,
      FSL13_S_CONTROL => net_gnd0,
      FSL13_S_EXISTS => net_gnd0,
      FSL13_M_CLK => open,
      FSL13_M_WRITE => open,
      FSL13_M_DATA => open,
      FSL13_M_CONTROL => open,
      FSL13_M_FULL => net_gnd0,
      FSL14_S_CLK => open,
      FSL14_S_READ => open,
      FSL14_S_DATA => net_gnd32,
      FSL14_S_CONTROL => net_gnd0,
      FSL14_S_EXISTS => net_gnd0,
      FSL14_M_CLK => open,
      FSL14_M_WRITE => open,
      FSL14_M_DATA => open,
      FSL14_M_CONTROL => open,
      FSL14_M_FULL => net_gnd0,
      FSL15_S_CLK => open,
      FSL15_S_READ => open,
      FSL15_S_DATA => net_gnd32,
      FSL15_S_CONTROL => net_gnd0,
      FSL15_S_EXISTS => net_gnd0,
      FSL15_M_CLK => open,
      FSL15_M_WRITE => open,
      FSL15_M_DATA => open,
      FSL15_M_CONTROL => open,
      FSL15_M_FULL => net_gnd0,
      M0_AXIS_TLAST => open,
      M0_AXIS_TDATA => open,
      M0_AXIS_TVALID => open,
      M0_AXIS_TREADY => net_gnd0,
      S0_AXIS_TLAST => net_gnd0,
      S0_AXIS_TDATA => net_gnd32(0 to 31),
      S0_AXIS_TVALID => net_gnd0,
      S0_AXIS_TREADY => open,
      M1_AXIS_TLAST => open,
      M1_AXIS_TDATA => open,
      M1_AXIS_TVALID => open,
      M1_AXIS_TREADY => net_gnd0,
      S1_AXIS_TLAST => net_gnd0,
      S1_AXIS_TDATA => net_gnd32(0 to 31),
      S1_AXIS_TVALID => net_gnd0,
      S1_AXIS_TREADY => open,
      M2_AXIS_TLAST => open,
      M2_AXIS_TDATA => open,
      M2_AXIS_TVALID => open,
      M2_AXIS_TREADY => net_gnd0,
      S2_AXIS_TLAST => net_gnd0,
      S2_AXIS_TDATA => net_gnd32(0 to 31),
      S2_AXIS_TVALID => net_gnd0,
      S2_AXIS_TREADY => open,
      M3_AXIS_TLAST => open,
      M3_AXIS_TDATA => open,
      M3_AXIS_TVALID => open,
      M3_AXIS_TREADY => net_gnd0,
      S3_AXIS_TLAST => net_gnd0,
      S3_AXIS_TDATA => net_gnd32(0 to 31),
      S3_AXIS_TVALID => net_gnd0,
      S3_AXIS_TREADY => open,
      M4_AXIS_TLAST => open,
      M4_AXIS_TDATA => open,
      M4_AXIS_TVALID => open,
      M4_AXIS_TREADY => net_gnd0,
      S4_AXIS_TLAST => net_gnd0,
      S4_AXIS_TDATA => net_gnd32(0 to 31),
      S4_AXIS_TVALID => net_gnd0,
      S4_AXIS_TREADY => open,
      M5_AXIS_TLAST => open,
      M5_AXIS_TDATA => open,
      M5_AXIS_TVALID => open,
      M5_AXIS_TREADY => net_gnd0,
      S5_AXIS_TLAST => net_gnd0,
      S5_AXIS_TDATA => net_gnd32(0 to 31),
      S5_AXIS_TVALID => net_gnd0,
      S5_AXIS_TREADY => open,
      M6_AXIS_TLAST => open,
      M6_AXIS_TDATA => open,
      M6_AXIS_TVALID => open,
      M6_AXIS_TREADY => net_gnd0,
      S6_AXIS_TLAST => net_gnd0,
      S6_AXIS_TDATA => net_gnd32(0 to 31),
      S6_AXIS_TVALID => net_gnd0,
      S6_AXIS_TREADY => open,
      M7_AXIS_TLAST => open,
      M7_AXIS_TDATA => open,
      M7_AXIS_TVALID => open,
      M7_AXIS_TREADY => net_gnd0,
      S7_AXIS_TLAST => net_gnd0,
      S7_AXIS_TDATA => net_gnd32(0 to 31),
      S7_AXIS_TVALID => net_gnd0,
      S7_AXIS_TREADY => open,
      M8_AXIS_TLAST => open,
      M8_AXIS_TDATA => open,
      M8_AXIS_TVALID => open,
      M8_AXIS_TREADY => net_gnd0,
      S8_AXIS_TLAST => net_gnd0,
      S8_AXIS_TDATA => net_gnd32(0 to 31),
      S8_AXIS_TVALID => net_gnd0,
      S8_AXIS_TREADY => open,
      M9_AXIS_TLAST => open,
      M9_AXIS_TDATA => open,
      M9_AXIS_TVALID => open,
      M9_AXIS_TREADY => net_gnd0,
      S9_AXIS_TLAST => net_gnd0,
      S9_AXIS_TDATA => net_gnd32(0 to 31),
      S9_AXIS_TVALID => net_gnd0,
      S9_AXIS_TREADY => open,
      M10_AXIS_TLAST => open,
      M10_AXIS_TDATA => open,
      M10_AXIS_TVALID => open,
      M10_AXIS_TREADY => net_gnd0,
      S10_AXIS_TLAST => net_gnd0,
      S10_AXIS_TDATA => net_gnd32(0 to 31),
      S10_AXIS_TVALID => net_gnd0,
      S10_AXIS_TREADY => open,
      M11_AXIS_TLAST => open,
      M11_AXIS_TDATA => open,
      M11_AXIS_TVALID => open,
      M11_AXIS_TREADY => net_gnd0,
      S11_AXIS_TLAST => net_gnd0,
      S11_AXIS_TDATA => net_gnd32(0 to 31),
      S11_AXIS_TVALID => net_gnd0,
      S11_AXIS_TREADY => open,
      M12_AXIS_TLAST => open,
      M12_AXIS_TDATA => open,
      M12_AXIS_TVALID => open,
      M12_AXIS_TREADY => net_gnd0,
      S12_AXIS_TLAST => net_gnd0,
      S12_AXIS_TDATA => net_gnd32(0 to 31),
      S12_AXIS_TVALID => net_gnd0,
      S12_AXIS_TREADY => open,
      M13_AXIS_TLAST => open,
      M13_AXIS_TDATA => open,
      M13_AXIS_TVALID => open,
      M13_AXIS_TREADY => net_gnd0,
      S13_AXIS_TLAST => net_gnd0,
      S13_AXIS_TDATA => net_gnd32(0 to 31),
      S13_AXIS_TVALID => net_gnd0,
      S13_AXIS_TREADY => open,
      M14_AXIS_TLAST => open,
      M14_AXIS_TDATA => open,
      M14_AXIS_TVALID => open,
      M14_AXIS_TREADY => net_gnd0,
      S14_AXIS_TLAST => net_gnd0,
      S14_AXIS_TDATA => net_gnd32(0 to 31),
      S14_AXIS_TVALID => net_gnd0,
      S14_AXIS_TREADY => open,
      M15_AXIS_TLAST => open,
      M15_AXIS_TDATA => open,
      M15_AXIS_TVALID => open,
      M15_AXIS_TREADY => net_gnd0,
      S15_AXIS_TLAST => net_gnd0,
      S15_AXIS_TDATA => net_gnd32(0 to 31),
      S15_AXIS_TVALID => net_gnd0,
      S15_AXIS_TREADY => open,
      ICACHE_FSL_IN_CLK => open,
      ICACHE_FSL_IN_READ => open,
      ICACHE_FSL_IN_DATA => net_gnd32,
      ICACHE_FSL_IN_CONTROL => net_gnd0,
      ICACHE_FSL_IN_EXISTS => net_gnd0,
      ICACHE_FSL_OUT_CLK => open,
      ICACHE_FSL_OUT_WRITE => open,
      ICACHE_FSL_OUT_DATA => open,
      ICACHE_FSL_OUT_CONTROL => open,
      ICACHE_FSL_OUT_FULL => net_gnd0,
      DCACHE_FSL_IN_CLK => open,
      DCACHE_FSL_IN_READ => open,
      DCACHE_FSL_IN_DATA => net_gnd32,
      DCACHE_FSL_IN_CONTROL => net_gnd0,
      DCACHE_FSL_IN_EXISTS => net_gnd0,
      DCACHE_FSL_OUT_CLK => open,
      DCACHE_FSL_OUT_WRITE => open,
      DCACHE_FSL_OUT_DATA => open,
      DCACHE_FSL_OUT_CONTROL => open,
      DCACHE_FSL_OUT_FULL => net_gnd0
    );

  data_lmb : system_data_lmb_wrapper
    port map (
      LMB_Clk => clock_generator_0_CLKOUT0,
      SYS_Rst => reset_0_Bus_Struct_Reset(0),
      LMB_Rst => data_lmb_LMB_Rst,
      M_ABus => data_lmb_M_ABus,
      M_ReadStrobe => data_lmb_M_ReadStrobe,
      M_WriteStrobe => net_gnd0,
      M_AddrStrobe => data_lmb_M_AddrStrobe,
      M_DBus => net_gnd32,
      M_BE => net_gnd4,
      Sl_DBus => data_lmb_Sl_DBus,
      Sl_Ready => data_lmb_Sl_Ready(0 to 0),
      Sl_Wait => data_lmb_Sl_Wait(0 to 0),
      Sl_UE => data_lmb_Sl_UE(0 to 0),
      Sl_CE => data_lmb_Sl_CE(0 to 0),
      LMB_ABus => data_lmb_LMB_ABus,
      LMB_ReadStrobe => data_lmb_LMB_ReadStrobe,
      LMB_WriteStrobe => data_lmb_LMB_WriteStrobe,
      LMB_AddrStrobe => data_lmb_LMB_AddrStrobe,
      LMB_ReadDBus => data_lmb_LMB_ReadDBus,
      LMB_WriteDBus => data_lmb_LMB_WriteDBus,
      LMB_Ready => data_lmb_LMB_Ready,
      LMB_Wait => data_lmb_LMB_Wait,
      LMB_UE => data_lmb_LMB_UE,
      LMB_CE => data_lmb_LMB_CE,
      LMB_BE => data_lmb_LMB_BE
    );

  inst_lmb : system_inst_lmb_wrapper
    port map (
      LMB_Clk => clock_generator_0_CLKOUT0,
      SYS_Rst => reset_0_Bus_Struct_Reset(0),
      LMB_Rst => inst_lmb_LMB_Rst,
      M_ABus => inst_lmb_M_ABus,
      M_ReadStrobe => inst_lmb_M_ReadStrobe,
      M_WriteStrobe => inst_lmb_M_WriteStrobe,
      M_AddrStrobe => inst_lmb_M_AddrStrobe,
      M_DBus => inst_lmb_M_DBus,
      M_BE => inst_lmb_M_BE,
      Sl_DBus => inst_lmb_Sl_DBus,
      Sl_Ready => inst_lmb_Sl_Ready(0 to 0),
      Sl_Wait => inst_lmb_Sl_Wait(0 to 0),
      Sl_UE => inst_lmb_Sl_UE(0 to 0),
      Sl_CE => inst_lmb_Sl_CE(0 to 0),
      LMB_ABus => inst_lmb_LMB_ABus,
      LMB_ReadStrobe => inst_lmb_LMB_ReadStrobe,
      LMB_WriteStrobe => inst_lmb_LMB_WriteStrobe,
      LMB_AddrStrobe => inst_lmb_LMB_AddrStrobe,
      LMB_ReadDBus => inst_lmb_LMB_ReadDBus,
      LMB_WriteDBus => inst_lmb_LMB_WriteDBus,
      LMB_Ready => inst_lmb_LMB_Ready,
      LMB_Wait => inst_lmb_LMB_Wait,
      LMB_UE => inst_lmb_LMB_UE,
      LMB_CE => inst_lmb_LMB_CE,
      LMB_BE => inst_lmb_LMB_BE
    );

  plb_v46_0 : system_plb_v46_0_wrapper
    port map (
      PLB_Clk => clock_generator_0_CLKOUT0,
      SYS_Rst => reset_0_Bus_Struct_Reset(0),
      PLB_Rst => open,
      SPLB_Rst => plb_v46_0_SPLB_Rst,
      MPLB_Rst => open,
      PLB_dcrAck => open,
      PLB_dcrDBus => open,
      DCR_ABus => net_gnd10,
      DCR_DBus => net_gnd32,
      DCR_Read => net_gnd0,
      DCR_Write => net_gnd0,
      M_ABus => plb_v46_0_M_ABus,
      M_UABus => plb_v46_0_M_UABus,
      M_BE => plb_v46_0_M_BE,
      M_RNW => plb_v46_0_M_RNW(0 to 0),
      M_abort => plb_v46_0_M_ABort(0 to 0),
      M_busLock => plb_v46_0_M_busLock(0 to 0),
      M_TAttribute => plb_v46_0_M_TAttribute,
      M_lockErr => plb_v46_0_M_lockErr(0 to 0),
      M_MSize => plb_v46_0_M_MSize,
      M_priority => plb_v46_0_M_priority,
      M_rdBurst => plb_v46_0_M_rdBurst(0 to 0),
      M_request => plb_v46_0_M_request(0 to 0),
      M_size => plb_v46_0_M_size,
      M_type => plb_v46_0_M_type,
      M_wrBurst => plb_v46_0_M_wrBurst(0 to 0),
      M_wrDBus => plb_v46_0_M_wrDBus,
      Sl_addrAck => plb_v46_0_Sl_addrAck,
      Sl_MRdErr => plb_v46_0_Sl_MRdErr,
      Sl_MWrErr => plb_v46_0_Sl_MWrErr,
      Sl_MBusy => plb_v46_0_Sl_MBusy,
      Sl_rdBTerm => plb_v46_0_Sl_rdBTerm,
      Sl_rdComp => plb_v46_0_Sl_rdComp,
      Sl_rdDAck => plb_v46_0_Sl_rdDAck,
      Sl_rdDBus => plb_v46_0_Sl_rdDBus,
      Sl_rdWdAddr => plb_v46_0_Sl_rdWdAddr,
      Sl_rearbitrate => plb_v46_0_Sl_rearbitrate,
      Sl_SSize => plb_v46_0_Sl_SSize,
      Sl_wait => plb_v46_0_Sl_wait,
      Sl_wrBTerm => plb_v46_0_Sl_wrBTerm,
      Sl_wrComp => plb_v46_0_Sl_wrComp,
      Sl_wrDAck => plb_v46_0_Sl_wrDAck,
      Sl_MIRQ => plb_v46_0_Sl_MIRQ,
      PLB_MIRQ => plb_v46_0_PLB_MIRQ(0 to 0),
      PLB_ABus => plb_v46_0_PLB_ABus,
      PLB_UABus => plb_v46_0_PLB_UABus,
      PLB_BE => plb_v46_0_PLB_BE,
      PLB_MAddrAck => plb_v46_0_PLB_MAddrAck(0 to 0),
      PLB_MTimeout => plb_v46_0_PLB_MTimeout(0 to 0),
      PLB_MBusy => plb_v46_0_PLB_MBusy(0 to 0),
      PLB_MRdErr => plb_v46_0_PLB_MRdErr(0 to 0),
      PLB_MWrErr => plb_v46_0_PLB_MWrErr(0 to 0),
      PLB_MRdBTerm => plb_v46_0_PLB_MRdBTerm(0 to 0),
      PLB_MRdDAck => plb_v46_0_PLB_MRdDAck(0 to 0),
      PLB_MRdDBus => plb_v46_0_PLB_MRdDBus,
      PLB_MRdWdAddr => plb_v46_0_PLB_MRdWdAddr,
      PLB_MRearbitrate => plb_v46_0_PLB_MRearbitrate(0 to 0),
      PLB_MWrBTerm => plb_v46_0_PLB_MWrBTerm(0 to 0),
      PLB_MWrDAck => plb_v46_0_PLB_MWrDAck(0 to 0),
      PLB_MSSize => plb_v46_0_PLB_MSSize,
      PLB_PAValid => plb_v46_0_PLB_PAValid,
      PLB_RNW => plb_v46_0_PLB_RNW,
      PLB_SAValid => plb_v46_0_PLB_SAValid,
      PLB_abort => plb_v46_0_PLB_abort,
      PLB_busLock => plb_v46_0_PLB_busLock,
      PLB_TAttribute => plb_v46_0_PLB_TAttribute,
      PLB_lockErr => plb_v46_0_PLB_lockErr,
      PLB_masterID => plb_v46_0_PLB_masterID(0 to 0),
      PLB_MSize => plb_v46_0_PLB_MSize,
      PLB_rdPendPri => plb_v46_0_PLB_rdPendPri,
      PLB_wrPendPri => plb_v46_0_PLB_wrPendPri,
      PLB_rdPendReq => plb_v46_0_PLB_rdPendReq,
      PLB_wrPendReq => plb_v46_0_PLB_wrPendReq,
      PLB_rdBurst => plb_v46_0_PLB_rdBurst,
      PLB_rdPrim => plb_v46_0_PLB_rdPrim,
      PLB_reqPri => plb_v46_0_PLB_reqPri,
      PLB_size => plb_v46_0_PLB_size,
      PLB_type => plb_v46_0_PLB_type,
      PLB_wrBurst => plb_v46_0_PLB_wrBurst,
      PLB_wrDBus => plb_v46_0_PLB_wrDBus,
      PLB_wrPrim => plb_v46_0_PLB_wrPrim,
      PLB_SaddrAck => open,
      PLB_SMRdErr => open,
      PLB_SMWrErr => open,
      PLB_SMBusy => open,
      PLB_SrdBTerm => open,
      PLB_SrdComp => open,
      PLB_SrdDAck => open,
      PLB_SrdDBus => open,
      PLB_SrdWdAddr => open,
      PLB_Srearbitrate => open,
      PLB_Sssize => open,
      PLB_Swait => open,
      PLB_SwrBTerm => open,
      PLB_SwrComp => open,
      PLB_SwrDAck => open,
      Bus_Error_Det => open
    );

  bram_block_0 : system_bram_block_0_wrapper
    port map (
      BRAM_Rst_A => inst_ctrl_BRAM_PORT_BRAM_Rst,
      BRAM_Clk_A => inst_ctrl_BRAM_PORT_BRAM_Clk,
      BRAM_EN_A => inst_ctrl_BRAM_PORT_BRAM_EN,
      BRAM_WEN_A => inst_ctrl_BRAM_PORT_BRAM_WEN,
      BRAM_Addr_A => inst_ctrl_BRAM_PORT_BRAM_Addr,
      BRAM_Din_A => inst_ctrl_BRAM_PORT_BRAM_Din,
      BRAM_Dout_A => inst_ctrl_BRAM_PORT_BRAM_Dout,
      BRAM_Rst_B => data_ctrl_BRAM_PORT_BRAM_Rst,
      BRAM_Clk_B => data_ctrl_BRAM_PORT_BRAM_Clk,
      BRAM_EN_B => data_ctrl_BRAM_PORT_BRAM_EN,
      BRAM_WEN_B => data_ctrl_BRAM_PORT_BRAM_WEN,
      BRAM_Addr_B => data_ctrl_BRAM_PORT_BRAM_Addr,
      BRAM_Din_B => data_ctrl_BRAM_PORT_BRAM_Din,
      BRAM_Dout_B => data_ctrl_BRAM_PORT_BRAM_Dout
    );

  data_ctrl : system_data_ctrl_wrapper
    port map (
      LMB_Clk => clock_generator_0_CLKOUT0,
      LMB_Rst => inst_lmb_LMB_Rst,
      LMB_ABus => inst_lmb_LMB_ABus,
      LMB_WriteDBus => inst_lmb_LMB_WriteDBus,
      LMB_AddrStrobe => inst_lmb_LMB_AddrStrobe,
      LMB_ReadStrobe => inst_lmb_LMB_ReadStrobe,
      LMB_WriteStrobe => inst_lmb_LMB_WriteStrobe,
      LMB_BE => inst_lmb_LMB_BE,
      Sl_DBus => inst_lmb_Sl_DBus,
      Sl_Ready => inst_lmb_Sl_Ready(0),
      Sl_Wait => inst_lmb_Sl_Wait(0),
      Sl_UE => inst_lmb_Sl_UE(0),
      Sl_CE => inst_lmb_Sl_CE(0),
      LMB1_ABus => net_gnd32,
      LMB1_WriteDBus => net_gnd32,
      LMB1_AddrStrobe => net_gnd0,
      LMB1_ReadStrobe => net_gnd0,
      LMB1_WriteStrobe => net_gnd0,
      LMB1_BE => net_gnd4,
      Sl1_DBus => open,
      Sl1_Ready => open,
      Sl1_Wait => open,
      Sl1_UE => open,
      Sl1_CE => open,
      LMB2_ABus => net_gnd32,
      LMB2_WriteDBus => net_gnd32,
      LMB2_AddrStrobe => net_gnd0,
      LMB2_ReadStrobe => net_gnd0,
      LMB2_WriteStrobe => net_gnd0,
      LMB2_BE => net_gnd4,
      Sl2_DBus => open,
      Sl2_Ready => open,
      Sl2_Wait => open,
      Sl2_UE => open,
      Sl2_CE => open,
      LMB3_ABus => net_gnd32,
      LMB3_WriteDBus => net_gnd32,
      LMB3_AddrStrobe => net_gnd0,
      LMB3_ReadStrobe => net_gnd0,
      LMB3_WriteStrobe => net_gnd0,
      LMB3_BE => net_gnd4,
      Sl3_DBus => open,
      Sl3_Ready => open,
      Sl3_Wait => open,
      Sl3_UE => open,
      Sl3_CE => open,
      BRAM_Rst_A => data_ctrl_BRAM_PORT_BRAM_Rst,
      BRAM_Clk_A => data_ctrl_BRAM_PORT_BRAM_Clk,
      BRAM_EN_A => data_ctrl_BRAM_PORT_BRAM_EN,
      BRAM_WEN_A => data_ctrl_BRAM_PORT_BRAM_WEN,
      BRAM_Addr_A => data_ctrl_BRAM_PORT_BRAM_Addr,
      BRAM_Din_A => data_ctrl_BRAM_PORT_BRAM_Din,
      BRAM_Dout_A => data_ctrl_BRAM_PORT_BRAM_Dout,
      Interrupt => open,
      UE => open,
      CE => open,
      SPLB_CTRL_PLB_ABus => net_gnd32,
      SPLB_CTRL_PLB_PAValid => net_gnd0,
      SPLB_CTRL_PLB_masterID => net_gnd1(0 downto 0),
      SPLB_CTRL_PLB_RNW => net_gnd0,
      SPLB_CTRL_PLB_BE => net_gnd4,
      SPLB_CTRL_PLB_size => net_gnd4,
      SPLB_CTRL_PLB_type => net_gnd3(2 downto 0),
      SPLB_CTRL_PLB_wrDBus => net_gnd32,
      SPLB_CTRL_Sl_addrAck => open,
      SPLB_CTRL_Sl_SSize => open,
      SPLB_CTRL_Sl_wait => open,
      SPLB_CTRL_Sl_rearbitrate => open,
      SPLB_CTRL_Sl_wrDAck => open,
      SPLB_CTRL_Sl_wrComp => open,
      SPLB_CTRL_Sl_rdDBus => open,
      SPLB_CTRL_Sl_rdDAck => open,
      SPLB_CTRL_Sl_rdComp => open,
      SPLB_CTRL_Sl_MBusy => open,
      SPLB_CTRL_Sl_MWrErr => open,
      SPLB_CTRL_Sl_MRdErr => open,
      SPLB_CTRL_PLB_UABus => net_gnd32,
      SPLB_CTRL_PLB_SAValid => net_gnd0,
      SPLB_CTRL_PLB_rdPrim => net_gnd0,
      SPLB_CTRL_PLB_wrPrim => net_gnd0,
      SPLB_CTRL_PLB_abort => net_gnd0,
      SPLB_CTRL_PLB_busLock => net_gnd0,
      SPLB_CTRL_PLB_MSize => net_gnd2,
      SPLB_CTRL_PLB_lockErr => net_gnd0,
      SPLB_CTRL_PLB_wrBurst => net_gnd0,
      SPLB_CTRL_PLB_rdBurst => net_gnd0,
      SPLB_CTRL_PLB_wrPendReq => net_gnd0,
      SPLB_CTRL_PLB_rdPendReq => net_gnd0,
      SPLB_CTRL_PLB_wrPendPri => net_gnd2,
      SPLB_CTRL_PLB_rdPendPri => net_gnd2,
      SPLB_CTRL_PLB_reqPri => net_gnd2,
      SPLB_CTRL_PLB_TAttribute => net_gnd16,
      SPLB_CTRL_Sl_wrBTerm => open,
      SPLB_CTRL_Sl_rdWdAddr => open,
      SPLB_CTRL_Sl_rdBTerm => open,
      SPLB_CTRL_Sl_MIRQ => open,
      S_AXI_CTRL_ACLK => net_vcc0,
      S_AXI_CTRL_ARESETN => net_gnd0,
      S_AXI_CTRL_AWADDR => net_gnd32(0 to 31),
      S_AXI_CTRL_AWVALID => net_gnd0,
      S_AXI_CTRL_AWREADY => open,
      S_AXI_CTRL_WDATA => net_gnd32(0 to 31),
      S_AXI_CTRL_WSTRB => net_gnd4(0 to 3),
      S_AXI_CTRL_WVALID => net_gnd0,
      S_AXI_CTRL_WREADY => open,
      S_AXI_CTRL_BRESP => open,
      S_AXI_CTRL_BVALID => open,
      S_AXI_CTRL_BREADY => net_gnd0,
      S_AXI_CTRL_ARADDR => net_gnd32(0 to 31),
      S_AXI_CTRL_ARVALID => net_gnd0,
      S_AXI_CTRL_ARREADY => open,
      S_AXI_CTRL_RDATA => open,
      S_AXI_CTRL_RRESP => open,
      S_AXI_CTRL_RVALID => open,
      S_AXI_CTRL_RREADY => net_gnd0
    );

  inst_ctrl : system_inst_ctrl_wrapper
    port map (
      LMB_Clk => clock_generator_0_CLKOUT0,
      LMB_Rst => data_lmb_LMB_Rst,
      LMB_ABus => data_lmb_LMB_ABus,
      LMB_WriteDBus => data_lmb_LMB_WriteDBus,
      LMB_AddrStrobe => data_lmb_LMB_AddrStrobe,
      LMB_ReadStrobe => data_lmb_LMB_ReadStrobe,
      LMB_WriteStrobe => data_lmb_LMB_WriteStrobe,
      LMB_BE => data_lmb_LMB_BE,
      Sl_DBus => data_lmb_Sl_DBus,
      Sl_Ready => data_lmb_Sl_Ready(0),
      Sl_Wait => data_lmb_Sl_Wait(0),
      Sl_UE => data_lmb_Sl_UE(0),
      Sl_CE => data_lmb_Sl_CE(0),
      LMB1_ABus => net_gnd32,
      LMB1_WriteDBus => net_gnd32,
      LMB1_AddrStrobe => net_gnd0,
      LMB1_ReadStrobe => net_gnd0,
      LMB1_WriteStrobe => net_gnd0,
      LMB1_BE => net_gnd4,
      Sl1_DBus => open,
      Sl1_Ready => open,
      Sl1_Wait => open,
      Sl1_UE => open,
      Sl1_CE => open,
      LMB2_ABus => net_gnd32,
      LMB2_WriteDBus => net_gnd32,
      LMB2_AddrStrobe => net_gnd0,
      LMB2_ReadStrobe => net_gnd0,
      LMB2_WriteStrobe => net_gnd0,
      LMB2_BE => net_gnd4,
      Sl2_DBus => open,
      Sl2_Ready => open,
      Sl2_Wait => open,
      Sl2_UE => open,
      Sl2_CE => open,
      LMB3_ABus => net_gnd32,
      LMB3_WriteDBus => net_gnd32,
      LMB3_AddrStrobe => net_gnd0,
      LMB3_ReadStrobe => net_gnd0,
      LMB3_WriteStrobe => net_gnd0,
      LMB3_BE => net_gnd4,
      Sl3_DBus => open,
      Sl3_Ready => open,
      Sl3_Wait => open,
      Sl3_UE => open,
      Sl3_CE => open,
      BRAM_Rst_A => inst_ctrl_BRAM_PORT_BRAM_Rst,
      BRAM_Clk_A => inst_ctrl_BRAM_PORT_BRAM_Clk,
      BRAM_EN_A => inst_ctrl_BRAM_PORT_BRAM_EN,
      BRAM_WEN_A => inst_ctrl_BRAM_PORT_BRAM_WEN,
      BRAM_Addr_A => inst_ctrl_BRAM_PORT_BRAM_Addr,
      BRAM_Din_A => inst_ctrl_BRAM_PORT_BRAM_Din,
      BRAM_Dout_A => inst_ctrl_BRAM_PORT_BRAM_Dout,
      Interrupt => open,
      UE => open,
      CE => open,
      SPLB_CTRL_PLB_ABus => net_gnd32,
      SPLB_CTRL_PLB_PAValid => net_gnd0,
      SPLB_CTRL_PLB_masterID => net_gnd1(0 downto 0),
      SPLB_CTRL_PLB_RNW => net_gnd0,
      SPLB_CTRL_PLB_BE => net_gnd4,
      SPLB_CTRL_PLB_size => net_gnd4,
      SPLB_CTRL_PLB_type => net_gnd3(2 downto 0),
      SPLB_CTRL_PLB_wrDBus => net_gnd32,
      SPLB_CTRL_Sl_addrAck => open,
      SPLB_CTRL_Sl_SSize => open,
      SPLB_CTRL_Sl_wait => open,
      SPLB_CTRL_Sl_rearbitrate => open,
      SPLB_CTRL_Sl_wrDAck => open,
      SPLB_CTRL_Sl_wrComp => open,
      SPLB_CTRL_Sl_rdDBus => open,
      SPLB_CTRL_Sl_rdDAck => open,
      SPLB_CTRL_Sl_rdComp => open,
      SPLB_CTRL_Sl_MBusy => open,
      SPLB_CTRL_Sl_MWrErr => open,
      SPLB_CTRL_Sl_MRdErr => open,
      SPLB_CTRL_PLB_UABus => net_gnd32,
      SPLB_CTRL_PLB_SAValid => net_gnd0,
      SPLB_CTRL_PLB_rdPrim => net_gnd0,
      SPLB_CTRL_PLB_wrPrim => net_gnd0,
      SPLB_CTRL_PLB_abort => net_gnd0,
      SPLB_CTRL_PLB_busLock => net_gnd0,
      SPLB_CTRL_PLB_MSize => net_gnd2,
      SPLB_CTRL_PLB_lockErr => net_gnd0,
      SPLB_CTRL_PLB_wrBurst => net_gnd0,
      SPLB_CTRL_PLB_rdBurst => net_gnd0,
      SPLB_CTRL_PLB_wrPendReq => net_gnd0,
      SPLB_CTRL_PLB_rdPendReq => net_gnd0,
      SPLB_CTRL_PLB_wrPendPri => net_gnd2,
      SPLB_CTRL_PLB_rdPendPri => net_gnd2,
      SPLB_CTRL_PLB_reqPri => net_gnd2,
      SPLB_CTRL_PLB_TAttribute => net_gnd16,
      SPLB_CTRL_Sl_wrBTerm => open,
      SPLB_CTRL_Sl_rdWdAddr => open,
      SPLB_CTRL_Sl_rdBTerm => open,
      SPLB_CTRL_Sl_MIRQ => open,
      S_AXI_CTRL_ACLK => net_vcc0,
      S_AXI_CTRL_ARESETN => net_gnd0,
      S_AXI_CTRL_AWADDR => net_gnd32(0 to 31),
      S_AXI_CTRL_AWVALID => net_gnd0,
      S_AXI_CTRL_AWREADY => open,
      S_AXI_CTRL_WDATA => net_gnd32(0 to 31),
      S_AXI_CTRL_WSTRB => net_gnd4(0 to 3),
      S_AXI_CTRL_WVALID => net_gnd0,
      S_AXI_CTRL_WREADY => open,
      S_AXI_CTRL_BRESP => open,
      S_AXI_CTRL_BVALID => open,
      S_AXI_CTRL_BREADY => net_gnd0,
      S_AXI_CTRL_ARADDR => net_gnd32(0 to 31),
      S_AXI_CTRL_ARVALID => net_gnd0,
      S_AXI_CTRL_ARREADY => open,
      S_AXI_CTRL_RDATA => open,
      S_AXI_CTRL_RRESP => open,
      S_AXI_CTRL_RVALID => open,
      S_AXI_CTRL_RREADY => net_gnd0
    );

  clock_generator_0 : system_clock_generator_0_wrapper
    port map (
      CLKIN => net_clock_generator_0_CLKIN_pin,
      CLKOUT0 => clock_generator_0_CLKOUT0,
      CLKOUT1 => open,
      CLKOUT2 => open,
      CLKOUT3 => open,
      CLKOUT4 => open,
      CLKOUT5 => open,
      CLKOUT6 => open,
      CLKOUT7 => open,
      CLKOUT8 => open,
      CLKOUT9 => open,
      CLKOUT10 => open,
      CLKOUT11 => open,
      CLKOUT12 => open,
      CLKOUT13 => open,
      CLKOUT14 => open,
      CLKOUT15 => open,
      CLKFBIN => net_gnd0,
      CLKFBOUT => open,
      PSCLK => net_gnd0,
      PSEN => net_gnd0,
      PSINCDEC => net_gnd0,
      PSDONE => open,
      RST => net_clock_generator_0_RST_pin,
      LOCKED => clock_generator_0_LOCKED
    );

  reset_0 : system_reset_0_wrapper
    port map (
      Slowest_sync_clk => clock_generator_0_CLKOUT0,
      Ext_Reset_In => net_gnd0,
      Aux_Reset_In => net_gnd0,
      MB_Debug_Sys_Rst => net_gnd0,
      Core_Reset_Req_0 => net_gnd0,
      Chip_Reset_Req_0 => net_gnd0,
      System_Reset_Req_0 => net_gnd0,
      Core_Reset_Req_1 => net_gnd0,
      Chip_Reset_Req_1 => net_gnd0,
      System_Reset_Req_1 => net_gnd0,
      Dcm_locked => clock_generator_0_LOCKED,
      RstcPPCresetcore_0 => open,
      RstcPPCresetchip_0 => open,
      RstcPPCresetsys_0 => open,
      RstcPPCresetcore_1 => open,
      RstcPPCresetchip_1 => open,
      RstcPPCresetsys_1 => open,
      MB_Reset => reset_0_MB_Reset,
      Bus_Struct_Reset => reset_0_Bus_Struct_Reset(0 to 0),
      Peripheral_Reset => open,
      Interconnect_aresetn => open,
      Peripheral_aresetn => open
    );

  xps_gpio_0 : system_xps_gpio_0_wrapper
    port map (
      SPLB_Clk => clock_generator_0_CLKOUT0,
      SPLB_Rst => plb_v46_0_SPLB_Rst(0),
      PLB_ABus => plb_v46_0_PLB_ABus,
      PLB_UABus => plb_v46_0_PLB_UABus,
      PLB_PAValid => plb_v46_0_PLB_PAValid,
      PLB_SAValid => plb_v46_0_PLB_SAValid,
      PLB_rdPrim => plb_v46_0_PLB_rdPrim(0),
      PLB_wrPrim => plb_v46_0_PLB_wrPrim(0),
      PLB_masterID => plb_v46_0_PLB_masterID(0 to 0),
      PLB_abort => plb_v46_0_PLB_abort,
      PLB_busLock => plb_v46_0_PLB_busLock,
      PLB_RNW => plb_v46_0_PLB_RNW,
      PLB_BE => plb_v46_0_PLB_BE,
      PLB_MSize => plb_v46_0_PLB_MSize,
      PLB_size => plb_v46_0_PLB_size,
      PLB_type => plb_v46_0_PLB_type,
      PLB_lockErr => plb_v46_0_PLB_lockErr,
      PLB_wrDBus => plb_v46_0_PLB_wrDBus,
      PLB_wrBurst => plb_v46_0_PLB_wrBurst,
      PLB_rdBurst => plb_v46_0_PLB_rdBurst,
      PLB_wrPendReq => plb_v46_0_PLB_wrPendReq,
      PLB_rdPendReq => plb_v46_0_PLB_rdPendReq,
      PLB_wrPendPri => plb_v46_0_PLB_wrPendPri,
      PLB_rdPendPri => plb_v46_0_PLB_rdPendPri,
      PLB_reqPri => plb_v46_0_PLB_reqPri,
      PLB_TAttribute => plb_v46_0_PLB_TAttribute,
      Sl_addrAck => plb_v46_0_Sl_addrAck(0),
      Sl_SSize => plb_v46_0_Sl_SSize(0 to 1),
      Sl_wait => plb_v46_0_Sl_wait(0),
      Sl_rearbitrate => plb_v46_0_Sl_rearbitrate(0),
      Sl_wrDAck => plb_v46_0_Sl_wrDAck(0),
      Sl_wrComp => plb_v46_0_Sl_wrComp(0),
      Sl_wrBTerm => plb_v46_0_Sl_wrBTerm(0),
      Sl_rdDBus => plb_v46_0_Sl_rdDBus(0 to 31),
      Sl_rdWdAddr => plb_v46_0_Sl_rdWdAddr(0 to 3),
      Sl_rdDAck => plb_v46_0_Sl_rdDAck(0),
      Sl_rdComp => plb_v46_0_Sl_rdComp(0),
      Sl_rdBTerm => plb_v46_0_Sl_rdBTerm(0),
      Sl_MBusy => plb_v46_0_Sl_MBusy(0 to 0),
      Sl_MWrErr => plb_v46_0_Sl_MWrErr(0 to 0),
      Sl_MRdErr => plb_v46_0_Sl_MRdErr(0 to 0),
      Sl_MIRQ => plb_v46_0_Sl_MIRQ(0 to 0),
      IP2INTC_Irpt => open,
      GPIO_IO_I => net_gnd8,
      GPIO_IO_O => xps_gpio_0_GPIO_IO_O,
      GPIO_IO_T => open,
      GPIO2_IO_I => net_gnd32,
      GPIO2_IO_O => open,
      GPIO2_IO_T => open
    );

  xps_gpio_1 : system_xps_gpio_1_wrapper
    port map (
      SPLB_Clk => clock_generator_0_CLKOUT0,
      SPLB_Rst => plb_v46_0_SPLB_Rst(1),
      PLB_ABus => plb_v46_0_PLB_ABus,
      PLB_UABus => plb_v46_0_PLB_UABus,
      PLB_PAValid => plb_v46_0_PLB_PAValid,
      PLB_SAValid => plb_v46_0_PLB_SAValid,
      PLB_rdPrim => plb_v46_0_PLB_rdPrim(1),
      PLB_wrPrim => plb_v46_0_PLB_wrPrim(1),
      PLB_masterID => plb_v46_0_PLB_masterID(0 to 0),
      PLB_abort => plb_v46_0_PLB_abort,
      PLB_busLock => plb_v46_0_PLB_busLock,
      PLB_RNW => plb_v46_0_PLB_RNW,
      PLB_BE => plb_v46_0_PLB_BE,
      PLB_MSize => plb_v46_0_PLB_MSize,
      PLB_size => plb_v46_0_PLB_size,
      PLB_type => plb_v46_0_PLB_type,
      PLB_lockErr => plb_v46_0_PLB_lockErr,
      PLB_wrDBus => plb_v46_0_PLB_wrDBus,
      PLB_wrBurst => plb_v46_0_PLB_wrBurst,
      PLB_rdBurst => plb_v46_0_PLB_rdBurst,
      PLB_wrPendReq => plb_v46_0_PLB_wrPendReq,
      PLB_rdPendReq => plb_v46_0_PLB_rdPendReq,
      PLB_wrPendPri => plb_v46_0_PLB_wrPendPri,
      PLB_rdPendPri => plb_v46_0_PLB_rdPendPri,
      PLB_reqPri => plb_v46_0_PLB_reqPri,
      PLB_TAttribute => plb_v46_0_PLB_TAttribute,
      Sl_addrAck => plb_v46_0_Sl_addrAck(1),
      Sl_SSize => plb_v46_0_Sl_SSize(2 to 3),
      Sl_wait => plb_v46_0_Sl_wait(1),
      Sl_rearbitrate => plb_v46_0_Sl_rearbitrate(1),
      Sl_wrDAck => plb_v46_0_Sl_wrDAck(1),
      Sl_wrComp => plb_v46_0_Sl_wrComp(1),
      Sl_wrBTerm => plb_v46_0_Sl_wrBTerm(1),
      Sl_rdDBus => plb_v46_0_Sl_rdDBus(32 to 63),
      Sl_rdWdAddr => plb_v46_0_Sl_rdWdAddr(4 to 7),
      Sl_rdDAck => plb_v46_0_Sl_rdDAck(1),
      Sl_rdComp => plb_v46_0_Sl_rdComp(1),
      Sl_rdBTerm => plb_v46_0_Sl_rdBTerm(1),
      Sl_MBusy => plb_v46_0_Sl_MBusy(1 to 1),
      Sl_MWrErr => plb_v46_0_Sl_MWrErr(1 to 1),
      Sl_MRdErr => plb_v46_0_Sl_MRdErr(1 to 1),
      Sl_MIRQ => plb_v46_0_Sl_MIRQ(1 to 1),
      IP2INTC_Irpt => open,
      GPIO_IO_I => xps_gpio_1_GPIO_IO_I,
      GPIO_IO_O => open,
      GPIO_IO_T => open,
      GPIO2_IO_I => net_gnd32,
      GPIO2_IO_O => open,
      GPIO2_IO_T => open
    );

  xps_spi_0 : system_xps_spi_0_wrapper
    port map (
      SCK_I => xps_spi_0_SCK_I,
      SCK_O => xps_spi_0_SCK_O,
      SCK_T => xps_spi_0_SCK_T,
      MISO_I => xps_spi_0_MISO_I,
      MISO_O => xps_spi_0_MISO_O,
      MISO_T => xps_spi_0_MISO_T,
      MOSI_I => xps_spi_0_MOSI_I,
      MOSI_O => xps_spi_0_MOSI_O,
      MOSI_T => xps_spi_0_MOSI_T,
      SPISEL => xps_spi_0_SPISEL,
      SS_I => xps_spi_0_SS_I(0 to 0),
      SS_O => xps_spi_0_SS_O(0 to 0),
      SS_T => xps_spi_0_SS_T,
      SPLB_Clk => clock_generator_0_CLKOUT0,
      SPLB_Rst => plb_v46_0_SPLB_Rst(2),
      PLB_ABus => plb_v46_0_PLB_ABus,
      PLB_PAValid => plb_v46_0_PLB_PAValid,
      PLB_masterID => plb_v46_0_PLB_masterID(0 to 0),
      PLB_RNW => plb_v46_0_PLB_RNW,
      PLB_BE => plb_v46_0_PLB_BE,
      PLB_size => plb_v46_0_PLB_size,
      PLB_type => plb_v46_0_PLB_type,
      PLB_wrDBus => plb_v46_0_PLB_wrDBus,
      Sl_addrAck => plb_v46_0_Sl_addrAck(2),
      Sl_SSize => plb_v46_0_Sl_SSize(4 to 5),
      Sl_wait => plb_v46_0_Sl_wait(2),
      Sl_rearbitrate => plb_v46_0_Sl_rearbitrate(2),
      Sl_wrDAck => plb_v46_0_Sl_wrDAck(2),
      Sl_wrComp => plb_v46_0_Sl_wrComp(2),
      Sl_rdDBus => plb_v46_0_Sl_rdDBus(64 to 95),
      Sl_rdDAck => plb_v46_0_Sl_rdDAck(2),
      Sl_rdComp => plb_v46_0_Sl_rdComp(2),
      Sl_MBusy => plb_v46_0_Sl_MBusy(2 to 2),
      Sl_MWrErr => plb_v46_0_Sl_MWrErr(2 to 2),
      Sl_MRdErr => plb_v46_0_Sl_MRdErr(2 to 2),
      PLB_UABus => plb_v46_0_PLB_UABus,
      PLB_SAValid => plb_v46_0_PLB_SAValid,
      PLB_rdPrim => plb_v46_0_PLB_rdPrim(2),
      PLB_wrPrim => plb_v46_0_PLB_wrPrim(2),
      PLB_abort => plb_v46_0_PLB_abort,
      PLB_busLock => plb_v46_0_PLB_busLock,
      PLB_MSize => plb_v46_0_PLB_MSize,
      PLB_lockErr => plb_v46_0_PLB_lockErr,
      PLB_wrBurst => plb_v46_0_PLB_wrBurst,
      PLB_rdBurst => plb_v46_0_PLB_rdBurst,
      PLB_wrPendReq => plb_v46_0_PLB_wrPendReq,
      PLB_rdPendReq => plb_v46_0_PLB_rdPendReq,
      PLB_wrPendPri => plb_v46_0_PLB_wrPendPri,
      PLB_rdPendPri => plb_v46_0_PLB_rdPendPri,
      PLB_reqPri => plb_v46_0_PLB_reqPri,
      PLB_TAttribute => plb_v46_0_PLB_TAttribute,
      Sl_wrBTerm => plb_v46_0_Sl_wrBTerm(2),
      Sl_rdWdAddr => plb_v46_0_Sl_rdWdAddr(8 to 11),
      Sl_rdBTerm => plb_v46_0_Sl_rdBTerm(2),
      Sl_MIRQ => plb_v46_0_Sl_MIRQ(2 to 2),
      IP2INTC_Irpt => open
    );

  xps_timer_0 : system_xps_timer_0_wrapper
    port map (
      CaptureTrig0 => net_gnd0,
      CaptureTrig1 => net_gnd0,
      GenerateOut0 => xps_timer_0_GenerateOut0,
      GenerateOut1 => xps_timer_0_GenerateOut1,
      PWM0 => xps_timer_0_PWM0,
      Interrupt => open,
      Freeze => net_gnd0,
      SPLB_Clk => clock_generator_0_CLKOUT0,
      SPLB_Rst => plb_v46_0_SPLB_Rst(3),
      PLB_ABus => plb_v46_0_PLB_ABus,
      PLB_PAValid => plb_v46_0_PLB_PAValid,
      PLB_masterID => plb_v46_0_PLB_masterID(0 to 0),
      PLB_RNW => plb_v46_0_PLB_RNW,
      PLB_BE => plb_v46_0_PLB_BE,
      PLB_size => plb_v46_0_PLB_size,
      PLB_type => plb_v46_0_PLB_type,
      PLB_wrDBus => plb_v46_0_PLB_wrDBus,
      Sl_addrAck => plb_v46_0_Sl_addrAck(3),
      Sl_SSize => plb_v46_0_Sl_SSize(6 to 7),
      Sl_wait => plb_v46_0_Sl_wait(3),
      Sl_rearbitrate => plb_v46_0_Sl_rearbitrate(3),
      Sl_wrDAck => plb_v46_0_Sl_wrDAck(3),
      Sl_wrComp => plb_v46_0_Sl_wrComp(3),
      Sl_rdDBus => plb_v46_0_Sl_rdDBus(96 to 127),
      Sl_rdDAck => plb_v46_0_Sl_rdDAck(3),
      Sl_rdComp => plb_v46_0_Sl_rdComp(3),
      Sl_MBusy => plb_v46_0_Sl_MBusy(3 to 3),
      Sl_MWrErr => plb_v46_0_Sl_MWrErr(3 to 3),
      Sl_MRdErr => plb_v46_0_Sl_MRdErr(3 to 3),
      PLB_UABus => plb_v46_0_PLB_UABus,
      PLB_SAValid => plb_v46_0_PLB_SAValid,
      PLB_rdPrim => plb_v46_0_PLB_rdPrim(3),
      PLB_wrPrim => plb_v46_0_PLB_wrPrim(3),
      PLB_abort => plb_v46_0_PLB_abort,
      PLB_busLock => plb_v46_0_PLB_busLock,
      PLB_MSize => plb_v46_0_PLB_MSize,
      PLB_lockErr => plb_v46_0_PLB_lockErr,
      PLB_wrBurst => plb_v46_0_PLB_wrBurst,
      PLB_rdBurst => plb_v46_0_PLB_rdBurst,
      PLB_wrPendReq => plb_v46_0_PLB_wrPendReq,
      PLB_rdPendReq => plb_v46_0_PLB_rdPendReq,
      PLB_wrPendPri => plb_v46_0_PLB_wrPendPri,
      PLB_rdPendPri => plb_v46_0_PLB_rdPendPri,
      PLB_reqPri => plb_v46_0_PLB_reqPri,
      PLB_TAttribute => plb_v46_0_PLB_TAttribute,
      Sl_wrBTerm => plb_v46_0_Sl_wrBTerm(3),
      Sl_rdWdAddr => plb_v46_0_Sl_rdWdAddr(12 to 15),
      Sl_rdBTerm => plb_v46_0_Sl_rdBTerm(3),
      Sl_MIRQ => plb_v46_0_Sl_MIRQ(3 to 3)
    );

  iobuf_0 : IOBUF
    port map (
      I => xps_spi_0_SCK_O,
      IO => xps_spi_0_SCK_pin,
      O => xps_spi_0_SCK_I,
      T => xps_spi_0_SCK_T
    );

  iobuf_1 : IOBUF
    port map (
      I => xps_spi_0_MISO_O,
      IO => xps_spi_0_MISO_pin,
      O => xps_spi_0_MISO_I,
      T => xps_spi_0_MISO_T
    );

  iobuf_2 : IOBUF
    port map (
      I => xps_spi_0_MOSI_O,
      IO => xps_spi_0_MOSI_pin,
      O => xps_spi_0_MOSI_I,
      T => xps_spi_0_MOSI_T
    );

  iobuf_3 : IOBUF
    port map (
      I => xps_spi_0_SS_O(0),
      IO => xps_spi_0_SS_pin,
      O => xps_spi_0_SS_I(0),
      T => xps_spi_0_SS_T
    );

end architecture STRUCTURE;

