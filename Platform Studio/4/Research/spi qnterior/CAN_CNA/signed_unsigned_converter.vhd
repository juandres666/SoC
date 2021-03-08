
-----------------------------------------------------
---------------  SIGNED -> UNSIGNED  ----------------
-----------------------------------------------------
-- DAVELOOSE Thomas
-- ENSEEIHT / LAAS - OSE

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity signed_unsigned_converter is
    Port ( input_signed : in  STD_LOGIC_VECTOR (13 downto 0);
           output_unsigned : out  STD_LOGIC_VECTOR (13 downto 0));
end signed_unsigned_converter;

architecture Behavioral of signed_unsigned_converter is
begin

	output_unsigned (13) <= input_signed (13);
	output_unsigned (12) <= not input_signed (12);
	output_unsigned (11) <= not input_signed (11);
	output_unsigned (10) <= not input_signed (10);
	output_unsigned (9) <= not input_signed (9);
	output_unsigned (8) <= not input_signed (8);
	output_unsigned (7) <= not input_signed (7);
	output_unsigned (6) <= not input_signed (6);
	output_unsigned (5) <= not input_signed (5);
	output_unsigned (4) <= not input_signed (4);
	output_unsigned (3) <= not input_signed (3);
	output_unsigned (2) <= not input_signed (2);
	output_unsigned (1) <= not input_signed (1);
	output_unsigned (0) <= not input_signed (0);
	
end Behavioral;

