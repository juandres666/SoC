----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:23:27 06/05/2014 
-- Design Name: 
-- Module Name:    compteur - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity compteur is
    Port ( clk : in STD_LOGIC;
           rst : in  STD_LOGIC;
           data : out  STD_LOGIC_VECTOR (11 downto 0));
end compteur;

architecture Behavioral of compteur is
--signal fm2 : std_logic;
--signal Q3 : std_logic;
signal temp : std_logic_vector(11 downto 0);

begin

process(clk,rst)
begin
	if rst='1' then
		data<="000000000000";
	elsif clk'event and clk='1' then
--		if fm2='1' then
			temp<=temp+1;
			data<=temp;
		else
			temp<=temp;
--		end if;
	end if;
end process;

--process(clk)
--begin
--	IF clk'event and clk='1' then 
--				Q3<= clk_100kHz;
--				fm2 <= clk_100kHz and not Q3;
--	end if;
--end process;

end Behavioral;

