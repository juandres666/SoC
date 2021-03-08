
----------------------------------------------------
---------------  COMMANDE CAN / CNA  ---------------
----------------------------------------------------
-- DAVELOOSE Thomas
-- ENSEEIHT / LAAS - OSE

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity can_cna_commande is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           ispi_ss_b : in  STD_LOGIC;
           isf_ce0 : in  STD_LOGIC;
           ifpga_init_b : in  STD_LOGIC;
			  fin_amp : in  STD_LOGIC;
			  fin_can : in  STD_LOGIC;
			  fin_cna : in  STD_LOGIC;
			  iamp_spi_sck : in  STD_LOGIC;
			  ican_spi_sck : in  STD_LOGIC;
			  icna_spi_sck : in  STD_LOGIC;
			  iamp_spi_mosi : in  STD_LOGIC;
			  icna_spi_mosi : in  STD_LOGIC;
			  can_on : in  STD_LOGIC;
			  cna_on : in  STD_LOGIC;
			  spi_mosi : out  STD_LOGIC;
			  spi_sck : out  STD_LOGIC;
			  spi_ss_b : out  STD_LOGIC;
           sf_ce0 : out  STD_LOGIC;
			  en_can : out  STD_LOGIC;
			  en_cna : out  STD_LOGIC;
			  en_amp : out  STD_LOGIC;
           fpga_init_b : out  STD_LOGIC);
end can_cna_commande;

architecture Behavioral of can_cna_commande is

Type mae is (Init, amp, can, cna);
Signal ypresent, y : mae := Init;

-- Commande
		-- Cette mae permet l'utilisation continue du can / du cna / des deux.
		-- Les deux composants devant utiliser le même bus de communication SPI, les conversions sont plus lentes.
		-- Cette possibilité a son importance si l'on veut accélérer le can (sans utiliser le cna).
		-- X_on <= '1' : ON
		-- X_on <= '0' : OFF
-- Attention
		-- clk max pour les CAN ou CNA seul : 100 MHz
		-- clk max pour les deux ensemble   : 50  MHz

begin

	-- *****************   mae   *****************

	evolution : Process (ypresent, fin_amp, fin_can, fin_cna, can_on, cna_on)
	Begin
			case ypresent is
				when Init => y <= amp;
				when amp => if (fin_amp = '1' and can_on = '1') then y <= can;
								elsif (fin_amp = '1' and cna_on = '1' and can_on = '0') then y <= cna;
							   else y <= amp;
							   end if;
				when can => if (fin_can = '1' and cna_on = '1') then y <= cna;
							   else y <= can;
							   end if;
				when cna => if (fin_cna = '1' and can_on = '1') then y <= can;
							   else y <= cna;
							   end if;
				when others => y <= Init;
			end case;
	end process;

	mise_a_jour : process (clk, rst)
	begin
		if (rst = '1') then ypresent <= init;
		elsif (clk'event and clk = '1') then ypresent <= y;
		end if;
	end process;

	-- *****************   sorties   *****************
	
	spi_ss_b_actions : process (clk, rst)
	begin
		if (rst = '1') then spi_ss_b <= '1';
		elsif (clk'event and clk = '1') then spi_ss_b <= ispi_ss_b;
		end if;
	end process;
	
	sf_ce0_actions : process (clk, rst)
	begin
		if (rst = '1') then sf_ce0 <= '1';
		elsif (clk'event and clk = '1') then sf_ce0 <= isf_ce0;
		end if;
	end process;
	
	fpga_init_b_actions : process (clk, rst)
	begin
		if (rst = '1') then fpga_init_b <= '0';
		elsif (clk'event and clk = '1') then fpga_init_b <= ifpga_init_b;
		end if;
	end process;
	
	en_amp_actions : process (clk, rst)
	begin
		if (rst = '1') then en_amp <= '0';
		elsif (clk'event and clk = '1') then
			if (ypresent = amp) then en_amp <= '1';
			else en_amp <= '0';
			end if;
		end if;
	end process;
	
	en_can_actions : process (clk, rst)
	begin
		if (rst = '1') then en_can <= '0';
		elsif (clk'event and clk = '1') then
			if (ypresent = can) then en_can <= '1';
			else en_can <= '0';
			end if;
		end if;
	end process;
	
	en_cna_actions : process (clk, rst)
	begin
		if (rst = '1') then en_cna <= '0';
		elsif (clk'event and clk = '1') then
			if (ypresent = cna) then en_cna <= '1';
			else en_cna <= '0';
			end if;
		end if;
	end process;
	
	spi_sck_actions : process (clk, rst)
	begin
		if (rst = '1') then spi_sck <= '0';
		elsif (clk'event and clk = '1') then
			if (ypresent = amp) then spi_sck <= iamp_spi_sck;
				elsif (ypresent = can) then spi_sck <= ican_spi_sck;
				elsif (ypresent = cna) then spi_sck <= icna_spi_sck;
				else  spi_sck <= '0';
			end if;
		end if;
	end process;
	
	spi_mosi_actions : process (clk, rst)
	begin
		if (rst = '1') then spi_mosi <= '0';
		elsif (clk'event and clk = '1') then
			if    (ypresent = amp) then spi_mosi <= iamp_spi_mosi;
			elsif (ypresent = cna) then spi_mosi <= icna_spi_mosi;
			else  spi_mosi <= '0';
			end if;
		end if;
	end process;
	
end Behavioral;
