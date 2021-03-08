library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.Std_logic_unsigned.ALL;
use IEEE.Std_logic_arith.ALL;

entity div_horloge_100kHz is
    Port ( clk_50MHz : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           clk_100kHz : out  STD_LOGIC);
end div_horloge_100kHz;

architecture Behavioral of div_horloge_100kHz is

signal compt : integer;
signal clk_temp : STD_LOGIC;

begin
	process(rst,clk_50MHz)
	
	begin
	
		if rst='1' then							-- Définition du reset du système
			clk_temp<='0';
			compt<=0;
			
		elsif(clk_50MHz'event and clk_50MHz='1') then	-- Front montant d'horloge à 50 MHz
			
		if compt=250 then					--	50 fronts montant = 1 MHz // Valeur à modificer pour choisir la fréquence de sortie
				clk_temp<= not clk_temp;		-- Changement de front du signal d'horloge à 1 seconde
				compt<=0;
			
			else										-- Compteur différent 
			compt<=compt+1;
				clk_temp<= clk_temp;	
			end if;
			clk_100kHz<=clk_temp;
		end if;
		
	end process;
	
end Behavioral;