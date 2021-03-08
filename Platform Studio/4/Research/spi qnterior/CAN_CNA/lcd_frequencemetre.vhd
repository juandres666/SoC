
-----------------------------------------------------------------------------------------------
---------------  AFFICHAGE DE LA VALEUR DE 6 DIGIT (FREQUENCEMETRE) SUR LE LCD  ---------------
-----------------------------------------------------------------------------------------------
-- DAVELOOSE Thomas
-- ENSEEIHT / LAAS - OSE

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity lcd_frequencemetre is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           donnee_cm : in  STD_LOGIC_VECTOR (7 downto 0);
			  donnee_dm : in  STD_LOGIC_VECTOR (7 downto 0);
			  donnee_m : in  STD_LOGIC_VECTOR (7 downto 0);
			  donnee_c : in  STD_LOGIC_VECTOR (7 downto 0);
			  donnee_d : in  STD_LOGIC_VECTOR (7 downto 0);
			  donnee_u : in  STD_LOGIC_VECTOR (7 downto 0);
			  depasse : in  STD_LOGIC;
			  signal_faible : in  STD_LOGIC;
			  basse_frequence : in  STD_LOGIC;
           sf_d : out  STD_LOGIC_VECTOR (3 downto 0);
           lcd_e : out  STD_LOGIC;
           lcd_rs : out  STD_LOGIC;
           lcd_rw : out  STD_LOGIC);
end lcd_frequencemetre;

architecture Behavioral of lcd_frequencemetre is

Type mae is (E0, E1, E2, E3, E4, E5, E6, E7, E8, E9, E10, E11, E12, E13, E14, E15, E16, E17, E18, E19, function_set, entry_mode_set, display_on_off, clear, pause, set_dd_ram_address, write_cm, write_dm, write_m, write_c, write_d, write_u, write_esp, write_H, write_z, write_sf_1, write_sf_2, write_sf_3, write_sf_4, write_sf_5, write_sf_6, write_sf_7, write_sf_8, write_sf_9, write_sf_10, write_sf_11, write_sf_12, write_sf_13, write_dep_1, write_dep_2, write_dep_3, write_dep_4, write_dep_5, write_dep_6, write_dep_7, set_dd_ram_address_signal_faible, set_dd_ram_address_depasse, set_dd_ram_address_efface, write_eff_1, write_eff_2, write_eff_3, write_eff_4, write_eff_5, write_eff_6, write_eff_7, write_eff_8, write_eff_9, write_eff_10, write_eff_11, write_eff_12, write_eff_13, write_eff_14, write_eff_15, set_dd_ram_address_basse_frequence, write_bf_1, write_bf_2, write_bf_3, write_bf_4, write_bf_5, write_bf_6, write_bf_7, write_bf_8, write_bf_9, write_bf_10, write_bf_11, write_bf_12, write_bf_13, write_bf_14, write_bf_15);
Signal ypresent, y : mae := E0;
Signal cpt : STD_LOGIC_VECTOR (20 downto 0):="000000000000000000000";

Type mae2 is (attendre, E20, E21, E22, E23, E24, E25, E26, E27, E28, E29, E30, E31);
Signal ypresent2, y2 : mae2 := attendre;
Signal cpt2 : STD_LOGIC_VECTOR (11 downto 0):=X"000";

Signal d : STD_LOGIC_VECTOR (7 downto 0):=X"00";
Signal operation : STD_LOGIC:='0';
Signal fin_op : STD_LOGIC:='0';

Signal s_donnee_dm : STD_LOGIC_VECTOR (7 downto 0):="00110000";
Signal s_donnee_cm : STD_LOGIC_VECTOR (7 downto 0):="00110000";
Signal s_donnee_m : STD_LOGIC_VECTOR (7 downto 0):="00110000";
Signal s_donnee_c : STD_LOGIC_VECTOR (7 downto 0):="00110000";
Signal s_donnee_d : STD_LOGIC_VECTOR (7 downto 0):="00110000";
Signal s_donnee_u : STD_LOGIC_VECTOR (7 downto 0):="00110000";

Constant s_donnee_esp : STD_LOGIC_VECTOR (7 downto 0):="10100000";
Constant s_donnee_H : STD_LOGIC_VECTOR (7 downto 0):="01001000";
Constant s_donnee_z : STD_LOGIC_VECTOR (7 downto 0):="01011010";
Constant s_donnee_s : STD_LOGIC_VECTOR (7 downto 0):="01010011";
Constant s_donnee_i : STD_LOGIC_VECTOR (7 downto 0):="01001001";
Constant s_donnee_g : STD_LOGIC_VECTOR (7 downto 0):="01000111";
Constant s_donnee_n : STD_LOGIC_VECTOR (7 downto 0):="01001110";
Constant s_donnee_a : STD_LOGIC_VECTOR (7 downto 0):="01000001";
Constant s_donnee_l : STD_LOGIC_VECTOR (7 downto 0):="01001100";
Constant s_donnee_f : STD_LOGIC_VECTOR (7 downto 0):="01000110";
Constant s_donnee_b : STD_LOGIC_VECTOR (7 downto 0):="01000010";
Constant s_donnee_e : STD_LOGIC_VECTOR (7 downto 0):="01000101";
Constant s_donnee_d_lettre : STD_LOGIC_VECTOR (7 downto 0):="01000100";
Constant s_donnee_p : STD_LOGIC_VECTOR (7 downto 0):="01010000";
Constant s_donnee_r : STD_LOGIC_VECTOR (7 downto 0):="01010010";
Constant s_donnee_q : STD_LOGIC_VECTOR (7 downto 0):="01010001";
Constant s_donnee_u_lettre : STD_LOGIC_VECTOR (7 downto 0):="01010101";
Constant s_donnee_c_lettre : STD_LOGIC_VECTOR (7 downto 0):="01000011";

begin

	-- *****************   mae   *****************
	
	mae_evolution : Process (ypresent, cpt, fin_op, signal_faible, depasse, basse_frequence)
	Begin
			case ypresent is
				when E0 => y <= E1;
				when E1 => if (cpt = "101101110001101100000") then y <= E2; -- 1500000 cc
							  else y <= E1;
							  end if;
				when E2 => y <= E3;
				when E3 => if (cpt = "000000000000000011000") then y <= E4; -- 24 cc
							  else y <= E3;
							  end if;
				when E4 => y <= E5;
				when E5 => if (cpt = "001100100000110010000") then y <= E6; -- 410000 cc
							  else y <= E5;
							  end if;
				when E6 => y <= E7;
				when E7 => if (cpt = "000000000000000011000") then y <= E8; -- 24 cc
							  else y <= E7;
							  end if;
				when E8 => y <= E9;
				when E9 => if (cpt = "000000010011100010000") then y <= E10; -- 10000 cc
							  else y <= E9;
							  end if;
				when E10 => y <= E11;
				when E11 => if (cpt = "000000000000000011000") then y <= E12; -- 24 cc
							   else y <= E11;
							   end if;
				when E12 => y <= E13;
				when E13 => if (cpt = "000000000111110100000") then y <= E14; -- 4000 cc
							   else y <= E13;
							   end if;
				when E14 => y <= E15;
				when E15 => if (cpt = "000000000000000011000") then y <= E16; -- 24 cc
							   else y <= E15;
							   end if;
				when E16 => y <= E17;
				when E17 => if (cpt = "000000000111110100000") then y <= function_set; -- 4000 cc
							   else y <= E17;
							   end if;
				when function_set => if (fin_op = '1') then y <= entry_mode_set;
											else y <= function_set;
											end if;
				when entry_mode_set => if (fin_op = '1') then y <= display_on_off;
											  else y <= entry_mode_set;
											  end if;	
				when display_on_off => if (fin_op = '1') then y <= clear;
											  else y <= display_on_off;
											  end if;	
				when clear => if (fin_op = '1') then y <= E18;
								  else y <= clear;
								  end if;
				when E18 => y <= pause;
				when pause => if (cpt = "000101000000010100000") then y <= E19; -- 164000 cc
								  else y <= pause;
								  end if;
				when E19 => y <= set_dd_ram_address;
				when set_dd_ram_address => if (fin_op = '1') then y <= write_cm;
													else y <= set_dd_ram_address;
													end if;
				when write_cm => if (fin_op = '1') then y <= write_dm;
									  else y <= write_cm;
								     end if;
				when write_dm => if (fin_op = '1') then y <= write_m;
									  else y <= write_dm;
								     end if;
				when write_m => if (fin_op = '1') then y <= write_c;
									 else y <= write_m;
								    end if;
				when write_c => if (fin_op = '1') then y <= write_d;
									 else y <= write_c;
								    end if;
				when write_d => if (fin_op = '1') then y <= write_u;
									 else y <= write_d;
								    end if;
				when write_u => if (fin_op = '1') then y <= write_esp;
									 else y <= write_u;
								    end if;
				when write_esp => if (fin_op = '1') then y <= write_H;
									   else y <= write_esp;
								      end if;
				when write_H => if (fin_op = '1') then y <= write_z;
									 else y <= write_H;
								    end if;
				when write_z => if (fin_op = '1') then
										 if ((signal_faible = '0') and (depasse = '0') and (basse_frequence = '0')) then y <= set_dd_ram_address_efface;
										 elsif (signal_faible = '1') then y <= set_dd_ram_address_signal_faible;
										 elsif (basse_frequence = '1') then y <= set_dd_ram_address_basse_frequence;
										 else y <= set_dd_ram_address_depasse;
										 end if;
									 else y <= write_z;
									 end if;
				when set_dd_ram_address_signal_faible => if (fin_op = '1') then y <= write_sf_1;
																	  else y <= set_dd_ram_address_signal_faible;
																	  end if;
				when write_sf_1 => if (fin_op = '1') then y <= write_sf_2;
									    else y <= write_sf_1;
								       end if;
				when write_sf_2 => if (fin_op = '1') then y <= write_sf_3;
									    else y <= write_sf_2;
								       end if;
				when write_sf_3 => if (fin_op = '1') then y <= write_sf_4;
									    else y <= write_sf_3;
								       end if;
				when write_sf_4 => if (fin_op = '1') then y <= write_sf_5;
									    else y <= write_sf_4;
								       end if;
				when write_sf_5 => if (fin_op = '1') then y <= write_sf_6;
									    else y <= write_sf_5;
								       end if;
				when write_sf_6 => if (fin_op = '1') then y <= write_sf_7;
									    else y <= write_sf_6;
								       end if;
				when write_sf_7 => if (fin_op = '1') then y <= write_sf_8;
									    else y <= write_sf_7;
								       end if;
				when write_sf_8 => if (fin_op = '1') then y <= write_sf_9;
									    else y <= write_sf_8;
								       end if;
				when write_sf_9 => if (fin_op = '1') then y <= write_sf_10;
									    else y <= write_sf_9;
								       end if;
				when write_sf_10 => if (fin_op = '1') then y <= write_sf_11;
									     else y <= write_sf_10;
								        end if;
				when write_sf_11 => if (fin_op = '1') then y <= write_sf_12;
									     else y <= write_sf_11;
								        end if;
				when write_sf_12 => if (fin_op = '1') then y <= write_sf_13;
									     else y <= write_sf_12;
								        end if;
				when write_sf_13 => if (fin_op = '1') then y <= E19;
									     else y <= write_sf_13;
								        end if;
				when set_dd_ram_address_depasse => if (fin_op = '1') then y <= write_dep_1;
															  else y <= set_dd_ram_address_depasse;
															  end if;
				when write_dep_1 => if (fin_op = '1') then y <= write_dep_2;
									     else y <= write_dep_1;
								        end if;
				when write_dep_2 => if (fin_op = '1') then y <= write_dep_3;
									     else y <= write_dep_2;
								        end if;
				when write_dep_3 => if (fin_op = '1') then y <= write_dep_4;
									     else y <= write_dep_3;
								        end if;
				when write_dep_4 => if (fin_op = '1') then y <= write_dep_5;
									     else y <= write_dep_4;
								        end if;
				when write_dep_5 => if (fin_op = '1') then y <= write_dep_6;
									     else y <= write_dep_5;
								        end if;
				when write_dep_6 => if (fin_op = '1') then y <= write_dep_7;
									     else y <= write_dep_6;
								        end if;
				when write_dep_7 => if (fin_op = '1') then y <= E19;
									     else y <= write_dep_7;
								        end if;
				when set_dd_ram_address_efface => if (fin_op = '1') then y <= write_eff_1;
															 else y <= set_dd_ram_address_efface;
															 end if;
				when write_eff_1 => if (fin_op = '1') then y <= write_eff_2;
									    else y <= write_eff_1;
								       end if;
				when write_eff_2 => if (fin_op = '1') then y <= write_eff_3;
									    else y <= write_eff_2;
								       end if;
				when write_eff_3 => if (fin_op = '1') then y <= write_eff_4;
									    else y <= write_eff_3;
								       end if;
				when write_eff_4 => if (fin_op = '1') then y <= write_eff_5;
									    else y <= write_eff_4;
								       end if;
				when write_eff_5 => if (fin_op = '1') then y <= write_eff_6;
									    else y <= write_eff_5;
								       end if;
				when write_eff_6 => if (fin_op = '1') then y <= write_eff_7;
									    else y <= write_eff_6;
								       end if;
				when write_eff_7 => if (fin_op = '1') then y <= write_eff_8;
									    else y <= write_eff_7;
								       end if;
				when write_eff_8 => if (fin_op = '1') then y <= write_eff_9;
									    else y <= write_eff_8;
								       end if;
				when write_eff_9 => if (fin_op = '1') then y <= write_eff_10;
									    else y <= write_eff_9;
								       end if;
				when write_eff_10 => if (fin_op = '1') then y <= write_eff_11;
									     else y <= write_eff_10;
								        end if;
				when write_eff_11 => if (fin_op = '1') then y <= write_eff_12;
									     else y <= write_eff_11;
								        end if;
				when write_eff_12 => if (fin_op = '1') then y <= write_eff_13;
									     else y <= write_eff_12;
								        end if;
				when write_eff_13 => if (fin_op = '1') then y <= write_eff_14;
									     else y <= write_eff_13;
								        end if;
				when write_eff_14 => if (fin_op = '1') then y <= write_eff_15;
									     else y <= write_eff_14;
								        end if;
				when write_eff_15 => if (fin_op = '1') then y <= E19;
									     else y <= write_eff_15;
								        end if;
				when set_dd_ram_address_basse_frequence => if (fin_op = '1') then y <= write_bf_1;
																	    else y <= set_dd_ram_address_basse_frequence;
																	    end if;
				when write_bf_1 => if (fin_op = '1') then y <= write_bf_2;
									    else y <= write_bf_1;
								       end if;
				when write_bf_2 => if (fin_op = '1') then y <= write_bf_3;
									    else y <= write_bf_2;
								       end if;
				when write_bf_3 => if (fin_op = '1') then y <= write_bf_4;
									    else y <= write_bf_3;
								       end if;
				when write_bf_4 => if (fin_op = '1') then y <= write_bf_5;
									    else y <= write_bf_4;
								       end if;
				when write_bf_5 => if (fin_op = '1') then y <= write_bf_6;
									    else y <= write_bf_5;
								       end if;
				when write_bf_6 => if (fin_op = '1') then y <= write_bf_7;
									    else y <= write_bf_6;
								       end if;
				when write_bf_7 => if (fin_op = '1') then y <= write_bf_8;
									    else y <= write_bf_7;
								       end if;
				when write_bf_8 => if (fin_op = '1') then y <= write_bf_9;
									    else y <= write_bf_8;
								       end if;
				when write_bf_9 => if (fin_op = '1') then y <= write_bf_10;
									    else y <= write_bf_9;
								       end if;
				when write_bf_10 => if (fin_op = '1') then y <= write_bf_11;
									     else y <= write_bf_10;
								        end if;
				when write_bf_11 => if (fin_op = '1') then y <= write_bf_12;
									     else y <= write_bf_11;
								        end if;
				when write_bf_12 => if (fin_op = '1') then y <= write_bf_13;
									     else y <= write_bf_12;
								        end if;
				when write_bf_13 => if (fin_op = '1') then y <= write_bf_14;
									     else y <= write_bf_13;
								        end if;
				when write_bf_14 => if (fin_op = '1') then y <= write_bf_15;
									     else y <= write_bf_14;
								        end if;
				when write_bf_15 => if (fin_op = '1') then y <= E19;
									     else y <= write_bf_15;
								        end if;
				when others => y <= E0;
			end case;
	end process;

	mae_mise_a_jour : process (clk, ypresent, rst)
	begin
		if (rst = '1') then ypresent <= E0;
		elsif (clk'event and clk = '1') then ypresent <= y;
		else ypresent <= ypresent;
		end if;
	end process;
	
	-- *****************   mae2   *****************
	
	mae2_evolution : Process (ypresent2, cpt2, operation)
	Begin
			case ypresent2 is
				when attendre => if (operation = '1') then y2 <= E20;
									  else y2 <= attendre;
									  end if;
				when E20 => if (cpt2 = X"004") then y2 <= E21; -- 4 cc
							   else y2 <= E20;
							   end if;
				when E21 => y2 <= E22;
				when E22 => if (cpt2 = X"019") then y2 <= E23; -- 25 cc
							   else y2 <= E22;
							   end if;
				when E23 => y2 <= E24;
				when E24 => if (cpt2 = X"064") then y2 <= E25; -- 100 cc
							   else y2 <= E24;
							   end if;
				when E25 => y2 <= E26;
				when E26 => if (cpt2 = X"004") then y2 <= E27; -- 4 cc
							   else y2 <= E26;
							   end if;
				when E27 => y2 <= E28;
				when E28 => if (cpt2 = X"019") then y2 <= E29; -- 25 cc
							   else y2 <= E28;
							   end if;
				when E29 => y2 <= E30;
				when E30 => if (cpt2 = X"FA0") then y2 <= E31; -- 4000 cc
							   else y2 <= E30;
							   end if;
				when E31 => y2 <= attendre;
				when others => y2 <= attendre;
			end case;
	end process;
	
	mae2_mise_a_jour : process (clk, rst)
	begin
		if (rst = '1') then ypresent2 <= attendre;
		elsif (clk'event and clk = '1') then ypresent2 <= y2;
		end if;
	end process;
	
	-- *****************   sorties   *****************
	
	mae_sorties : process (clk, rst)
	begin
		if (rst = '1') then cpt <= "000000000000000000000";
		elsif (clk'event and clk = '1') then
			case ypresent is
				when E1  => cpt <= (cpt + "000000000000000000001");
				when E3  => cpt <= (cpt + "000000000000000000001");
				when E5  => cpt <= (cpt + "000000000000000000001");
				when E7  => cpt <= (cpt + "000000000000000000001");
				when E9  => cpt <= (cpt + "000000000000000000001");
				when E11 => cpt <= (cpt + "000000000000000000001");
				when E13 => cpt <= (cpt + "000000000000000000001");
				when E15 => cpt <= (cpt + "000000000000000000001");
				when E17 => cpt <= (cpt + "000000000000000000001");
				when pause => cpt <= (cpt + "000000000000000000001");
				when others => cpt <= "000000000000000000000";
			end case;
		end if;
	end process;
	
	mae2_sorties : process (clk, rst)
	begin
		if (rst = '1') then cpt2 <= X"000";
		elsif (clk'event and clk = '1') then
			case ypresent2 is
				when attendre => cpt2 <= X"000";
				when E21 => cpt2 <= X"000";
				when E23 => cpt2 <= X"000";
				when E25 => cpt2 <= X"000";
				when E27 => cpt2 <= X"000";
				when E29 => cpt2 <= X"000";
				when E31 => cpt2 <= X"000";
				when others => cpt2 <= (cpt2 + X"001");
			end case;
		end if;
	end process;
			 
	sf_d <= X"3" when ypresent = E3 else
			  X"3" when ypresent = E7 else
			  X"3" when ypresent = E11 else
			  X"2" when ypresent = E15 else
			  d(7 downto 4) when ypresent2 = E20 else
			  d(7 downto 4) when ypresent2 = E21 else
			  d(7 downto 4) when ypresent2 = E22 else
			  d(7 downto 4) when ypresent2 = E23 else
			  d(3 downto 0) when ypresent2 = E26 else
			  d(3 downto 0) when ypresent2 = E27 else
			  d(3 downto 0) when ypresent2 = E28 else
			  d(3 downto 0) when ypresent2 = E29 else
			  X"0";
			  
	lcd_e <= '1' when ypresent = E3 else
			   '1' when ypresent = E7 else
			   '1' when ypresent = E11 else
			   '1' when ypresent = E15 else
			   '1' when ypresent2 = E22 else
			   '1' when ypresent2 = E23 else
				'1' when ypresent2 = E28 else
			   '1' when ypresent2 = E29 else
			   '0';
				
	With ypresent select
	d <= "00101000" when function_set,
		  "00000110" when entry_mode_set,
		  "00001100" when display_on_off,
		  "00000001" when clear,
		  "10000000" when set_dd_ram_address,
		  "11000000" when set_dd_ram_address_signal_faible,
		  "11000000" when set_dd_ram_address_depasse,
		  "11000000" when set_dd_ram_address_efface,
		  "11000000" when set_dd_ram_address_basse_frequence,
		  s_donnee_cm when write_cm,
		  s_donnee_dm when write_dm,
		  s_donnee_m when write_m,
		  s_donnee_c when write_c,
		  s_donnee_d when write_d,
		  s_donnee_u when write_u,
		  s_donnee_esp when write_esp,
		  s_donnee_H when write_H,
		  s_donnee_z when write_z,
		  s_donnee_s when write_sf_1,
		  s_donnee_i when write_sf_2,
		  s_donnee_g when write_sf_3,
		  s_donnee_n when write_sf_4,
		  s_donnee_a when write_sf_5,
		  s_donnee_l when write_sf_6,
		  s_donnee_esp when write_sf_7,
		  s_donnee_f when write_sf_8,
		  s_donnee_a when write_sf_9,
		  s_donnee_i when write_sf_10,
		  s_donnee_b when write_sf_11,
		  s_donnee_l when write_sf_12,
		  s_donnee_e when write_sf_13,
		  s_donnee_d_lettre when write_dep_1,
		  s_donnee_e when write_dep_2,
		  s_donnee_p when write_dep_3,
		  s_donnee_a when write_dep_4,
		  s_donnee_s when write_dep_5,
		  s_donnee_s when write_dep_6,
		  s_donnee_e when write_dep_7,
		  s_donnee_esp when write_eff_1,
		  s_donnee_esp when write_eff_2,
		  s_donnee_esp when write_eff_3,
		  s_donnee_esp when write_eff_4,
		  s_donnee_esp when write_eff_5,
		  s_donnee_esp when write_eff_6,
		  s_donnee_esp when write_eff_7,
		  s_donnee_esp when write_eff_8,
		  s_donnee_esp when write_eff_9,
		  s_donnee_esp when write_eff_10,
		  s_donnee_esp when write_eff_11,
		  s_donnee_esp when write_eff_12,
		  s_donnee_esp when write_eff_13,
		  s_donnee_esp when write_eff_14,
		  s_donnee_esp when write_eff_15,
		  s_donnee_b when write_bf_1,
		  s_donnee_a when write_bf_2,
		  s_donnee_s when write_bf_3,
		  s_donnee_s when write_bf_4,
		  s_donnee_e when write_bf_5,
		  s_donnee_esp when write_bf_6,
		  s_donnee_f when write_bf_7,
		  s_donnee_r when write_bf_8,
		  s_donnee_e when write_bf_9,
		  s_donnee_q when write_bf_10,
		  s_donnee_u_lettre when write_bf_11,
		  s_donnee_e when write_bf_12,
		  s_donnee_n when write_bf_13,
		  s_donnee_c_lettre when write_bf_14,
		  s_donnee_e when write_bf_15,
		  "00000000" when others;
	
	With ypresent select
	operation <= '1' when function_set,
		          '1' when entry_mode_set,
		          '1' when display_on_off,
		          '1' when clear,
		          '1' when set_dd_ram_address,
					 '1' when write_cm,
					 '1' when write_dm,
					 '1' when write_m,
					 '1' when write_c,
					 '1' when write_d,
					 '1' when write_u,
					 '1' when write_esp,
					 '1' when write_H,
					 '1' when write_z,
					 '1' when write_sf_1,
					 '1' when write_sf_2,
					 '1' when write_sf_3,
					 '1' when write_sf_4,
					 '1' when write_sf_5,
					 '1' when write_sf_6,
					 '1' when write_sf_7,
					 '1' when write_sf_8,
					 '1' when write_sf_9,
					 '1' when write_sf_10,
					 '1' when write_sf_11,
					 '1' when write_sf_12,
					 '1' when write_sf_13,
					 '1' when write_dep_1,
					 '1' when write_dep_2,
					 '1' when write_dep_3,
					 '1' when write_dep_4,
					 '1' when write_dep_5,
					 '1' when write_dep_6,
					 '1' when write_dep_7,
					 '1' when set_dd_ram_address_signal_faible,
					 '1' when set_dd_ram_address_depasse,
					 '1' when set_dd_ram_address_efface,
					 '1' when set_dd_ram_address_basse_frequence,
					 '1' when write_eff_1,
					 '1' when write_eff_2,
					 '1' when write_eff_3,
					 '1' when write_eff_4,
					 '1' when write_eff_5,
					 '1' when write_eff_6,
					 '1' when write_eff_7,
					 '1' when write_eff_8,
					 '1' when write_eff_9,
					 '1' when write_eff_10,
					 '1' when write_eff_11,
					 '1' when write_eff_12,
					 '1' when write_eff_13,
					 '1' when write_eff_14,
					 '1' when write_eff_15,
					 '1' when write_bf_1,
					 '1' when write_bf_2,
					 '1' when write_bf_3,
					 '1' when write_bf_4,
					 '1' when write_bf_5,
					 '1' when write_bf_6,
					 '1' when write_bf_7,
					 '1' when write_bf_8,
					 '1' when write_bf_9,
					 '1' when write_bf_10,
					 '1' when write_bf_11,
					 '1' when write_bf_12,
					 '1' when write_bf_13,
					 '1' when write_bf_14,
					 '1' when write_bf_15,
		          '0' when others;
					 
	With ypresent select
	lcd_rs <= '1' when write_cm,
				 '1' when write_dm,
				 '1' when write_m,
				 '1' when write_c,
				 '1' when write_d,
				 '1' when write_u,
				 '1' when write_esp,
				 '1' when write_H,
				 '1' when write_z,
				 '1' when write_sf_1,
				 '1' when write_sf_2,
				 '1' when write_sf_3,
				 '1' when write_sf_4,
				 '1' when write_sf_5,
				 '1' when write_sf_6,
				 '1' when write_sf_7,
				 '1' when write_sf_8,
				 '1' when write_sf_9,
				 '1' when write_sf_10,
				 '1' when write_sf_11,
				 '1' when write_sf_12,
				 '1' when write_sf_13,
				 '1' when write_dep_1,
				 '1' when write_dep_2,
				 '1' when write_dep_3,
				 '1' when write_dep_4,
				 '1' when write_dep_5,
				 '1' when write_dep_6,
				 '1' when write_dep_7,
				 '1' when write_eff_1,
				 '1' when write_eff_2,
				 '1' when write_eff_3,
				 '1' when write_eff_4,
				 '1' when write_eff_5,
				 '1' when write_eff_6,
				 '1' when write_eff_7,
				 '1' when write_eff_8,
				 '1' when write_eff_9,
				 '1' when write_eff_10,
				 '1' when write_eff_11,
				 '1' when write_eff_12,
				 '1' when write_eff_13,
				 '1' when write_eff_14,
				 '1' when write_eff_15,
				 '1' when write_bf_1,
				 '1' when write_bf_2,
				 '1' when write_bf_3,
				 '1' when write_bf_4,
				 '1' when write_bf_5,
				 '1' when write_bf_6,
				 '1' when write_bf_7,
				 '1' when write_bf_8,
				 '1' when write_bf_9,
				 '1' when write_bf_10,
				 '1' when write_bf_11,
				 '1' when write_bf_12,
				 '1' when write_bf_13,
				 '1' when write_bf_14,
				 '1' when write_bf_15,
		       '0' when others;
				 
	fin_op <= '1' when ypresent2 = E31 else
				 '0';
					
	mise_a_jour_donnees : process (clk, rst)
	begin
		if (rst = '1') then s_donnee_cm <= "00110000";
								  s_donnee_dm <= "00110000";
								  s_donnee_m <= "00110000";
								  s_donnee_c <= "00110000";
								  s_donnee_d <= "00110000";
								  s_donnee_u <= "00110000";
		elsif (clk'event and clk = '1') then   s_donnee_cm <= donnee_cm;
															s_donnee_dm <= donnee_dm;
															s_donnee_m <= donnee_m;
															s_donnee_c <= donnee_c;
															s_donnee_d <= donnee_d;
															s_donnee_u <= donnee_u;
		end if;
	end process;

	lcd_rw <= '0';

end Behavioral;

