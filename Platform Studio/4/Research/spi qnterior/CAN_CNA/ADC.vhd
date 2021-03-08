----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:37:34 04/09/2014 
-- Design Name: 
-- Module Name:    ADC - Behavioral 
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


entity ADC is
    Port ( clk : in  STD_LOGIC;
			  rst : in  STD_LOGIC;
			  clks : in  STD_LOGIC; -- SPI clk entrée ou sortie??
			  start_ADC : in  STD_LOGIC;
			  SPI_MOSI : out  STD_LOGIC;
			  SPI_MISO : out  STD_LOGIC;
           AD_CONV : out  STD_LOGIC;
           AMP_CS : out  STD_LOGIC;
           fin_ADC : out  STD_LOGIC);
end ADC;

architecture Behavioral of ADC is

Component detecteur_front_montant is 
Port ( entree : in  STD_LOGIC;
		clk :in  STD_LOGIC;
      front : out  STD_LOGIC);
end component;


type etat is (RESET,E00,E0,E11,E12,E2,E3,E4,E5,E6);
signal etat_actuel : etat;
signal etat_futur : etat;
signal s_front : std_logic;
signal count_1 : integer:=0;
signal count_2 : integer:=0;
signal count_3 : integer:=0;
signal count_4 : integer:=0;
signal snd_pulse : std_logic:='0';
signal Count_attente : integer:=0;
signal s_gain : std_logic_vector (7 downto 0):= "10001000"; 

begin



detecteur_front_montant2 : detecteur_front_montant port map (
entree => clks,
clk => clk,
front => s_front
);

			  
			  --snd_pulse <= '0';
			 -- AD_CONV <= '0';
			  
			  --count_1 <= 0;
			  --count_2 <= 0;
			  --count_3 <= 0;
			--  SPISS_B <='1';
			  --AMP_CS <='1';
--			  SF_CE0 <='1';
--			  DAC_CS <='1';
--			  FPGA_INIT_B <='1';

------------------------------------------------------------------------------
------------------------------------------------------------------------------


bloc_0 : process (etat_actuel,clk,count_1,count_2,count_3,snd_pulse)
begin
if (clk'event and clk='1') then
	
	case etat_actuel is 
		when E11 => if s_front = '1' then count_1 <= count_1 + 1;
					  end if;
					  
					 
		when E3 => if s_front = '1' then count_2 <= count_2 + 1;
					end if;	
		
		when E5 => if s_front = '1' then count_3 <= count_3 + 1;
					end if;			 
					
		when others => count_1 <= 0;
							count_2 <= 0;
							count_3 <= 0;
end case;							
end if;
end process;


					
------------------------------------------------------------------------------
------------------------------------------------------------------------------
					

bloc_1 : process (s_front,etat_actuel,count_1,count_2,count_3,count_4,snd_pulse,Count_attente)
begin

	case etat_actuel is
					
					when RESET => etat_futur <= E00;			
					
					when E00 =>  -- etat d'attente de start
							if Count_attente < 10 then etat_futur <= E00;		
							else etat_futur <= E0;			
							end if;
					
--					when INIT =>  etat_futur <= E0;					
							
					when E0 => --AMP_CS <='0';
									etat_futur <= E11;			
															
							
					when E11 => 
							if count_1 >= 2 then	etat_futur <= E12;
							else etat_futur <= E11;
							end if;
							
					when E12 =>  
							if count_4 >= 7 then	etat_futur <= E2;
							else etat_futur <= E11;
							end if;
				
					when E2 => --AMP_CS <='1';
								etat_futur <= E3;						

					when E3 => -- AD_CONV <= '1';
							if count_2 = 2 then etat_futur <= E4;	 
							else etat_futur <= E3;
							end if; 
						
					when E4 => -- AD_CONV <= '0';
							if snd_pulse = '1' then etat_futur <= E6;
							else etat_futur <= E5;
							end if; 	
							
					when E5 =>  -- ATTENTE; snd_pulse <= '1';
							if count_3 = 34 then etat_futur <= E3;
							else etat_futur <= E5;
							end if;	
						
					when others => etat_futur <= E00;
								
													
	end case;
end process;

------------------------------------------------------------------------------
------------------------------------------------------------------------------

		
bloc_2 : process (clk)
begin	 
	if (clk'event and clk='1') then
		if rst = '1' then etat_actuel <= RESET;
		else if start_ADC = '1' then etat_actuel <= etat_futur;
			  else etat_actuel <= E00;
			  end if;
		end if;
	end if;	
end process;

------------------------------------------------------------------------------
------------------------------------------------------------------------------

bloc_3 : process (etat_actuel, clk)
begin	
if (clk'event and clk='1') then
	case etat_actuel is
	
					when RESET => Count_attente <= 10;
									  fin_ADC<='0';
									  snd_pulse <= '0';
									  AMP_CS <='1';
									  AD_CONV <= '0';
									  
					when E00 => Count_attente <= Count_attente + 1;
									fin_ADC<='0';
									snd_pulse <= '0';
									count_4 <= 0 ;
									AMP_CS <= '1';
									  
					when E0 => AMP_CS <= '0';
								  Count_attente <= 0;
								  
					When E11 => SPI_MOSI <=s_gain(count_4); -- 8 premiers bits pour regler le gain a "-1"
					when E12 => count_4 <= count_4 + 1;
								  
					when E2 => AMP_CS <='1';
								  SPI_MISO<='Z';
								  
					when E3 => AD_CONV <= '1';
					when E4 => AD_CONV <= '0';
					when E5 => snd_pulse <= '1';
					when E6 => fin_ADC<='1'; 
	end case;
end if ;	
end process;


end Behavioral;
