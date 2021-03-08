-- Vhdl test bench created from schematic C:\Users\Thomas\Documents\Thomas\Frequencemetre_autocorrelation\freq_auto.sch - Thu Aug 22 09:28:43 2013
--
-- Notes: 
-- 1) This testbench template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the unit under test.
-- Xilinx recommends that these types always be used for the top-level
-- I/O of a design in order to guarantee that the testbench will bind
-- correctly to the timing (post-route) simulation model.
-- 2) To use this template as your testbench, change the filename to any
-- name of your choice with the extension .vhd, and use the "Source->Add"
-- menu in Project Navigator to import the testbench. Then
-- edit the user defined section below, adding code to generate the 
-- stimulus for your design.
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
ENTITY freq_auto_freq_auto_sch_tb IS
END freq_auto_freq_auto_sch_tb;
ARCHITECTURE behavioral OF freq_auto_freq_auto_sch_tb IS 

   COMPONENT Test
   PORT( rst	:	IN	STD_LOGIC; 
          clk	:	IN	STD_LOGIC; 
          spi_miso	:	IN	STD_LOGIC; 
          spi_miso_signal	:	OUT	STD_LOGIC; 
          ad_conv	:	OUT	STD_LOGIC; 
          amp_shdn	:	OUT	STD_LOGIC; 
          amp_cs	:	OUT	STD_LOGIC; 
          spi_mosi	:	OUT	STD_LOGIC; 
          dac_cs	:	OUT	STD_LOGIC; 
          dac_clr	:	OUT	STD_LOGIC; 
          fpga_init_b	:	OUT	STD_LOGIC; 
          sf_ce0	:	OUT	STD_LOGIC; 
          spi_ss_b	:	OUT	STD_LOGIC; 
          spi_sck	:	OUT	STD_LOGIC);
   END COMPONENT;

   SIGNAL rst	:	STD_LOGIC:='1';
   SIGNAL clk	:	STD_LOGIC:='0';
   SIGNAL spi_miso	:	STD_LOGIC:='1';
   SIGNAL spi_miso_signal	:	STD_LOGIC;
   SIGNAL ad_conv	:	STD_LOGIC;
   SIGNAL amp_shdn	:	STD_LOGIC;
   SIGNAL amp_cs	:	STD_LOGIC;
   SIGNAL spi_mosi	:	STD_LOGIC;
   SIGNAL dac_cs	:	STD_LOGIC;
   SIGNAL dac_clr	:	STD_LOGIC;
   SIGNAL fpga_init_b	:	STD_LOGIC;
   SIGNAL sf_ce0	:	STD_LOGIC;
   SIGNAL spi_ss_b	:	STD_LOGIC;
   SIGNAL spi_sck	:	STD_LOGIC;

BEGIN

   UUT: Test PORT MAP(
		rst => rst, 
		clk => clk,  
		spi_miso => spi_miso, 
		spi_miso_signal => spi_miso_signal, 
		ad_conv => ad_conv, 
		amp_shdn => amp_shdn, 
		amp_cs => amp_cs, 
		spi_mosi => spi_mosi, 
		dac_cs => dac_cs, 
		dac_clr => dac_clr, 
		fpga_init_b => fpga_init_b, 
		sf_ce0 => sf_ce0, 
		spi_ss_b => spi_ss_b, 
		spi_sck => spi_sck
   );

clk <= not clk after 5 ns;
rst <= '0' after 51 ns;


END;
