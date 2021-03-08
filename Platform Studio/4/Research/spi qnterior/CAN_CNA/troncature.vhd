----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:00:27 06/17/2014 
-- Design Name: 
-- Module Name:    troncature - Behavioral 
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

entity troncature is
    Port ( entree : in  STD_LOGIC_VECTOR (13 downto 0);
           sortie : out  STD_LOGIC_VECTOR (11 downto 0));
end troncature;

architecture Behavioral of troncature is

begin
sortie(11 downto 0)<=entree(13 downto 2);

end Behavioral;

