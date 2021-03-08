
--------------------------------------------
---------------  DRIVER CAN  ---------------
--------------------------------------------
-- DAVELOOSE Thomas
-- ENSEEIHT / LAAS - OSE

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity can is
    Port ( clk : in  STD_LOGIC; -- <= 100 MHz
           rst : in  STD_LOGIC;
			  spi_miso : in  STD_LOGIC;
			  en_can : in std_logic;
			  spi_miso_signal : out  STD_LOGIC;
           spi_sck : out  STD_LOGIC;
			  ad_conv : out  STD_LOGIC;
			  can0 : out STD_LOGIC_VECTOR (13 downto 0);
			  can1 : out STD_LOGIC_VECTOR (13 downto 0);
			  fin_can : out std_logic);
end can;

architecture Behavioral of can is

Type mae is (Init, Start, E00, E0, E1, E2, E3, E4, E5, E6, E7, E8, E9, E10, E11, E12, E13, E14, E15, E16);
Signal ypresent, y : mae := Init;

Signal i : integer range 0 to 18 :=18;
Signal rcan1 : std_logic_vector (13 downto 0):="00000000000000";
Signal rcan0 : std_logic_vector (13 downto 0):="00000000000000";
Signal scan1 : std_logic_vector (13 downto 0):="00000000000000";
Signal scan0 : std_logic_vector (13 downto 0):="00000000000000";
signal s_spi_miso : std_logic;
Signal sspi_sck : std_logic:='0';

begin

	spi_miso_signal_actions : process (clk, rst)
	begin
		if (rst = '1') then s_spi_miso <= '0';
		elsif (clk'event and clk = '1') then s_spi_miso <= spi_miso;
		end if;
	end process;
	
spi_miso_signal<=s_spi_miso;
--	 *****************   mae   *****************
	
	evolution : Process (ypresent, i, en_can)
	Begin
			case ypresent is
				when Init => if (en_can = '1') then y <= Start;
							    else y <= Init;
							    end if;
				when Start => y <= E00;
				when E00 => y <= E0;
				when E0 => y <= E1;
				when E1 => y <= E2;
				when E2 => y <= E3;
				when E3 => y <= E4;
				when E4 => y <= E5;
				when E5 => y <= E7;
				when E6 => if (i = 0) then y <= E8;
							  else y <= E7;
							  end if;
				when E7 => y <= E6;
				when E8 => y <= E9;
				when E9 => y <= E10;
				when E10 => y <= E11;
				when E11 => y <= E12;
				when E12 => if (i = 0) then y <= E14;
							   else y <= E13;
							   end if;
				when E13 => y <= E12;
				when E14 => y <= E15;
				when E15 => y <= E16;
				when E16 => y <= Init;
				when others => y <= Init;
			end case;
	end process;

	mise_a_jour : process (clk, rst)
	begin
		if (rst = '1') then ypresent <= Init;
		elsif (clk'event and clk = '1') then ypresent <= y;
		end if;
	end process;

	-- *****************   sorties   *****************

	i_actions : process (clk, rst)
	begin
		if (rst = '1') then i <= 18;
		elsif (clk'event and clk = '1') then
			case y is
				when E2 => i <= 14;
				when E7 => i <= i - 1;
				when E10 => i <= 14;
				when E12 => i <= i - 1;
				when others => i <= i;
			end case;
		end if;
	end process;

	sspi_sck_actions : process (clk, rst)
	begin
		if (rst = '1') then sspi_sck <= '0';
		elsif (clk'event and clk = '1') then
			if    (ypresent = Init) then sspi_sck <= '0';
			elsif (ypresent = E16) then sspi_sck <= '0';
			else 
					sspi_sck <= (not sspi_sck);
			end if;
		end if;
	end process;
				  
	spi_sck <= sspi_sck;
	
	ad_conv_actions : process (clk, rst)
	begin
		if (rst = '1') then ad_conv <= '0';
		elsif (clk'event and clk = '1') then
			if (y = E00) then ad_conv <= '1';
			else ad_conv <= '0';
			end if;
		end if;
	end process;

	rcan0_actions : process (clk, rst)
	begin
		if (rst = '1') then rcan0 <= "00000000000000";
		elsif (clk'event and clk = '0') then
		if (ypresent = E6) then rcan0 <= rcan0(12 downto 0) & s_spi_miso;
		else rcan0<=rcan0;
		end if;
		end if;
	end process;
	
	rcan1_actions : process (clk, rst)
	begin
		if (rst = '1') then rcan1 <= "00000000000000";
		elsif (clk'event and clk = '0') then
			if    (ypresent = E13) then rcan1(i) <= spi_miso;
			elsif (ypresent = E14) then rcan1(i) <= spi_miso;
			else rcan1 <= rcan1;
			end if;
		end if;
	end process;
				  
	scan0_actions : process (clk, rst)
	begin
		if (rst = '1') then scan0 <= "00000000000000";
		elsif (clk'event and clk = '1') then
			if (ypresent = E14) then scan0 <= rcan0;
			else scan0 <= scan0;
			end if;
		end if;
	end process;
	
	can0 <= scan0;
	
	scan1_actions : process (clk, rst)
	begin
		if (rst = '1') then scan1 <= "00000000000000";
		elsif (clk'event and clk = '1') then
			if (ypresent = E15) then scan1 <= rcan1;
			else scan1 <= scan1;
			end if;
		end if;
	end process;
	
	can1 <= scan1;
	
	fin_can_actions : process (clk, rst)
	begin
		if (rst = '1') then fin_can <= '0';
		elsif (clk'event and clk = '1') then
			if (ypresent = E14) then fin_can <= '1';
			else fin_can <= '0';
			end if;
		end if;
	end process;
				  
end Behavioral;
