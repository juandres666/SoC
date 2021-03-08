--------------------------------------------
---------------  DRIVER AMP  ---------------
--------------------------------------------
-- DAVELOOSE Thomas
-- ENSEEIHT / LAAS - OSE

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity amplificateurs is
    Port ( clk : in  STD_LOGIC; -- <= 100 MHz
           rst : in  STD_LOGIC;
			  en_amp : in std_logic;
           spi_mosi : out  STD_LOGIC;
           amp_cs : out  STD_LOGIC;
           spi_sck : out  STD_LOGIC;
           amp_shdn : out  STD_LOGIC;
			  fin_amp : out std_logic);
end amplificateurs;


architecture Behavioral of amplificateurs is

Type mae is (Init, Attendre, E0, E1, E2, E3, E4, E5, E6);
Signal ypresent, y : mae := Init;

Signal i : integer range 0 to 7 :=7;
Signal cpt : std_logic_vector (3 downto 0):="0000";

-- Pre-amplifiers A and B : Gain
		-- "B3 B2 B1 B0 A3 A2 A1 A0"
		-- "0001" = -1
		-- "0010" = -2
		-- "0011" = -5
		-- "0100" = -10
		-- "0101" = -20
		-- "0110" = -50
		-- "0111" = -100
Constant gain : std_logic_vector (7 downto 0):="00010001";

begin
		
	-- *****************   mae   *****************
	
	evolution : Process (ypresent, cpt, i, en_amp)
	Begin
			case ypresent is
				when Init => y <= Attendre;
				when Attendre => if (en_amp = '1') then y <= E0;
									  else y <= Attendre;
									  end if;
				when E0 => if (cpt = "1000") then y <= E1; -- 4 cc
							  else y <= E0;
							  end if;
				when E1 => if (cpt = "1011") then y <= E2; -- 4 cc + 7 cc
							  else y <= E1;
							  end if;
				when E2 => if (i > 0) then y <= E3;
							  elsif (i = 0) then y <= E4;
							  else y <= E2;
							  end if;
				when E3 => y <= E0;
				when E4 => y <= E5;
				when E5 => y <= E6;
				when E6 => y <= Attendre;
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
	
	cpt_actions : process (clk, rst)
	begin
		if (rst = '1') then cpt <= "0000";
		elsif (clk'event and clk = '1') then
			case ypresent is
				when E0  => cpt <= (cpt + "0001");
				when E1  => cpt <= (cpt + "0001");
				when others => cpt <= "0000";
			end case;
		end if;
	end process;
	
	i_actions : process (clk, rst)
	begin
		if (rst = '1') then i <= 7;
		elsif (clk'event and clk = '1') then
			case ypresent is
				when Init => i <= 7;
				when E3 => i <= i - 1;
				when others => i <= i;
			end case;
		end if;
	end process;
	
	amp_cs_actions : process (clk, rst)
	begin
		if (rst = '1') then amp_cs <= '1';
		elsif (clk'event and clk = '1') then
			if    (ypresent = E0) then amp_cs <= '0';
			elsif (ypresent = E1) then amp_cs <= '0';
			elsif (ypresent = E2) then amp_cs <= '0';
			elsif (ypresent = E3) then amp_cs <= '0';
			else amp_cs <= '1';
			end if;
		end if;
	end process;
	
	amp_shdn <= '0';
	
	spi_mosi_actions : process (clk, rst)
	begin
		if (rst = '1') then spi_mosi <= '0';
		elsif (clk'event and clk = '1') then
			if    (ypresent = E0) then spi_mosi <= gain(i);
			elsif (ypresent = E1) then spi_mosi <= gain(i);
			elsif (ypresent = E2) then spi_mosi <= gain(i);
			elsif (ypresent = E3) then spi_mosi <= gain(i);
			else spi_mosi <= '0';
			end if;
		end if;
	end process;
	
	spi_sck_actions : process (clk, rst)
	begin
		if (rst = '1') then spi_sck <= '0';
		elsif (clk'event and clk = '1') then
			if    (ypresent = E1) then spi_sck <= '1';
			else spi_sck <= '0';
			end if;
		end if;
	end process;
	
	fin_amp_actions : process (clk, rst)
	begin
		if (rst = '1') then fin_amp <= '0';
		elsif (clk'event and clk = '1') then
			if    (ypresent = E4) then fin_amp <= '1';
			else fin_amp <= '0';
			end if;
		end if;
	end process;

end Behavioral;
