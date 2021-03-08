
--------------------------------------------
---------------  DRIVER CNA  ---------------
--------------------------------------------
-- DAVELOOSE Thomas
-- ENSEEIHT / LAAS - OSE

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity cna is
    Port ( clk : in  STD_LOGIC; -- <= 100 MHz
           rst : in  STD_LOGIC;
			  en_cna : in STD_LOGIC;
			  data : in STD_LOGIC_VECTOR (11 downto 0);
           spi_mosi : out  STD_LOGIC;
           dac_cs : out  STD_LOGIC;
           spi_sck : out  STD_LOGIC;
           dac_clr : out  STD_LOGIC;
			  fin_cna : out STD_LOGIC);
end cna;

architecture Behavioral of cna is

Type mae is (Init, Start, E0, E1, E2, E3, E4);
Signal ypresent, y : mae := Init;

Signal i : integer range 0 to 23 :=23;
-- Adresse du DAC
		-- "A3 A2 A1 A0"
		-- "0000" = DAC A
		-- "0001" = DAC B
		-- "0010" = DAC C
		-- "0011" = DAC D
		-- "1111" = DAC ABCD
Constant dac_address : STD_LOGIC_VECTOR (3 downto 0):="1111";
Constant command : STD_LOGIC_VECTOR (3 downto 0):="0011";
Constant do_not_care : STD_LOGIC_VECTOR (3 downto 0):="0000";
Signal donnee : STD_LOGIC_VECTOR (23 downto 0):=X"3F0000";
Signal sspi_sck : STD_LOGIC:='0';
Signal sspi_mosi : STD_LOGIC:='0';
signal cpt : integer;

begin

	donnee_echantillonnage : process (clk, rst)
	begin
		if (rst = '1') then donnee <= X"3F0000";
		elsif (clk'event and clk = '1') then
			if (ypresent = E0) then donnee <= command & dac_address & data & do_not_care;
			end if;
		end if;
	end process;

	-- *****************   mae   *****************
	
	evolution : Process (ypresent, i, en_cna)
	Begin
			case ypresent is
				when Init => y <= Start;
				when Start => if (en_cna = '1') then y <= E0;
							     else y <= Start;
							     end if;
				when E0 => y <= E1;
				when E1 => if (i = 0) then y <= E3;
							  else y <= E2;
							  end if;
				when E2 => y <= E1;
				when E3 => y <= E4;
				
				when E4 => y <= Start;
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
		if (rst = '1') then i <= 23;
		elsif (clk'event and clk = '1') then
			if    (ypresent = E1) then i <= i - 1;
			elsif (ypresent = E2) then i <= i;
			else i <= 23;
			end if;
		end if;
	end process;
			
	dac_clr_actions : process (clk, rst)
	begin
		if (rst = '1') then dac_clr <= '0';
		elsif (clk'event and clk = '1') then
			if (ypresent = Init) then dac_clr <= '0';
			else dac_clr <= '1';
			end if;
		end if;
	end process;
	
	dac_cs_actions : process (clk, rst)
	begin
		if (rst = '1') then dac_cs <= '1';
		elsif (clk'event and clk = '1') then
			if    (ypresent = E0) then dac_cs <= '0';
			elsif (ypresent = E1) then dac_cs <= '0';
			elsif (ypresent = E2) then dac_cs <= '0';
			elsif (ypresent = E3) then dac_cs <= '0';
			elsif (ypresent = Init) then dac_cs <='1';
			elsif (ypresent = E4) then dac_cs<='1';
			else dac_cs <= '1';
			end if;
		end if;
	end process;
	
	sspi_sck_actions : process (clk, rst)
	begin
		if (rst = '1') then sspi_sck <= '0';
		elsif (clk'event and clk = '1') then
			if    (ypresent = E1) then sspi_sck <= (not sspi_sck);
			elsif (ypresent = E2) then sspi_sck <= (not sspi_sck);
			else   sspi_sck <= '0';
			end if;
		end if;
	end process;
	
	spi_sck <= sspi_sck;

	sspi_mosi_actions : process (clk, rst)
	begin
		if (rst = '1') then sspi_mosi <= '0';
		elsif (clk'event and clk = '1') then
			if    (ypresent = E0) then sspi_mosi <= donnee(i);
			elsif (ypresent = E1) then sspi_mosi <= sspi_mosi;
			elsif (ypresent = E2) then sspi_mosi <= donnee(i);
			else   sspi_mosi <= '0';
			end if;
		end if;
	end process;
	
	spi_mosi <= sspi_mosi;
	
	fin_cna_actions : process (clk, rst)
	begin
		if (rst = '1') then fin_cna <= '0';
		elsif (clk'event and clk = '0') then
			if    (ypresent = E4) then fin_cna <= '1';
			else   fin_cna <= '0';
			end if;
		end if;
	end process;
end Behavioral;
