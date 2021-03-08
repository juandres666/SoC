
-------------------------------------------------------
---------------  DIVISEUR DE FREQUENCE  ---------------
-------------------------------------------------------
-- DAVELOOSE Thomas
-- ENSEEIHT / LAAS - OSE

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_UNSIGNED.ALL;

entity div_freq is
    Port ( clk : in  STD_LOGIC;
			  rst : in  STD_LOGIC;
           Tm : out  STD_LOGIC);
end div_freq;

architecture Behavioral of div_freq is

-- 2,3 ms / 230000 cc à 100 MHz : 0111000001001101111
-- 3,9 ms / 390000 cc à 100 MHz : 1011111001101101111
-- 3,5 ms / 350000 cc à 100 MHz : 1010101011100101111
-- 4 ms   / 400000 cc à 100 MHz : 1100001101001111111
-- 5 ms   / 500000 cc à 100 MHz : 1111010000100011111

signal Q : std_logic_vector (18 downto 0):="1010101011100101111"; -- 3,5 ms
signal sTm : std_logic:='1';

begin

	process (clk, rst)
	begin
		if (rst = '1') then Q <= "1010101011100101111"; -- 3,5 ms
								  sTm <='1';
		elsif (clk'event and clk = '1') then 
			if Q = "0000000000000000000" then Q <= "0000000000000000000";
														 sTm <= '0';
			else Q <= Q - "0000000000000000001" ;
				  sTm <= sTm;
			end if;
		end if;
	end process;
	
	Tm <= sTm;

end Behavioral;

