--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:05:29 06/17/2014
-- Design Name:   
-- Module Name:   D:/stage/test_ADC/tb_clk_management.vhd
-- Project Name:  test_ADC
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: clk_management
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_clk_management IS
END tb_clk_management;
 
ARCHITECTURE behavior OF tb_clk_management IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT clk_management
    PORT(
         CLKIN_IN : IN  std_logic;
         RST_IN : IN  std_logic;
         CLKFX_OUT : OUT  std_logic;
         CLKIN_IBUFG_OUT : OUT  std_logic;
         CLK0_OUT : OUT  std_logic;
         CLK2X_OUT : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLKIN_IN : std_logic := '0';
   signal RST_IN : std_logic := '0';

 	--Outputs
   signal CLKFX_OUT : std_logic;
   signal CLKIN_IBUFG_OUT : std_logic;
   signal CLK0_OUT : std_logic;
   signal CLK2X_OUT : std_logic;

   -- Clock period definitions
   constant CLKIN_IN_period : time := 10 ns;
   constant CLKFX_OUT_period : time := 10 ns;
   constant CLKIN_IBUFG_OUT_period : time := 10 ns;
   constant CLK0_OUT_period : time := 10 ns;
   constant CLK2X_OUT_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: clk_management PORT MAP (
          CLKIN_IN => CLKIN_IN,
          RST_IN => RST_IN,
          CLKFX_OUT => CLKFX_OUT,
          CLKIN_IBUFG_OUT => CLKIN_IBUFG_OUT,
          CLK0_OUT => CLK0_OUT,
          CLK2X_OUT => CLK2X_OUT
        );

   -- Clock process definitions
   CLKIN_IN_process :process
   begin
		CLKIN_IN <= '0';
		wait for CLKIN_IN_period/2;
		CLKIN_IN <= '1';
		wait for CLKIN_IN_period/2;
   end process;
 
   CLKFX_OUT_process :process
   begin
		CLKFX_OUT <= '0';
		wait for CLKFX_OUT_period/2;
		CLKFX_OUT <= '1';
		wait for CLKFX_OUT_period/2;
   end process;
 
   CLKIN_IBUFG_OUT_process :process
   begin
		CLKIN_IBUFG_OUT <= '0';
		wait for CLKIN_IBUFG_OUT_period/2;
		CLKIN_IBUFG_OUT <= '1';
		wait for CLKIN_IBUFG_OUT_period/2;
   end process;
 
   CLK0_OUT_process :process
   begin
		CLK0_OUT <= '0';
		wait for CLK0_OUT_period/2;
		CLK0_OUT <= '1';
		wait for CLK0_OUT_period/2;
   end process;
 
   CLK2X_OUT_process :process
   begin
		CLK2X_OUT <= '0';
		wait for CLK2X_OUT_period/2;
		CLK2X_OUT <= '1';
		wait for CLK2X_OUT_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLKIN_IN_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
