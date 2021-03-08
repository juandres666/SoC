----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:45:12 04/02/2014 
-- Design Name: 
-- Module Name:    detecteur_front_montant - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity detecteur_front_montant is
    Port ( entree : in  STD_LOGIC;
				clk :in  STD_LOGIC;
           front : out  STD_LOGIC);
end detecteur_front_montant;

architecture Behavioral of detecteur_front_montant is

signal S1 : STD_LOGIC;
signal S2 : STD_LOGIC;
signal s_front : STD_LOGIC;


begin
process(clk,entree)
begin
if(clk='1' and clk'event) then
	S2 <=S1;
	S1 <=entree;
	s_front <= S1 and (not S2);

	end if;
end process;
	front <= s_front;
end Behavioral;

