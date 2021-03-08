----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:45:19 06/26/2014 
-- Design Name: 
-- Module Name:    bascule - Behavioral 
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

entity bascule is
    Port ( entree : in  STD_LOGIC_VECTOR (13 downto 0);
           sortie : out  STD_LOGIC_VECTOR (13 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC);
end bascule;

architecture Behavioral of bascule is

begin
process (clk,rst)
begin
if rst='1' then sortie<="00000000000000";
elsif (clk'event and clk='1') then
	sortie<=entree;
end if;
end process;

end Behavioral;

