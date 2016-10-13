library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux16bits is
	port(	entr0	:	in unsigned(15 downto 0);
			entr1	:	in unsigned(15 downto 0);
			entr2	:	in unsigned(15 downto 0);
			entr3	:	in unsigned(15 downto 0);
			entr4	:	in unsigned(15 downto 0);
			entr5	:	in unsigned(15 downto 0);
			entr6	:	in unsigned(15 downto 0);
			entr7	:	in unsigned(15 downto 0);
			op		: 	in unsigned(2 downto 0);
			saida	:	out unsigned(15 downto 0)

	);
end entity;

architecture a_mux16bits of mux16bits is
	saida <=	entr0 when op="000" else
				entr1 when op="001" else
				entr2 when op="010" else
				entr3 when op="011" else
				entr4 when op="100" else
				entr5 when op="101" else
				entr6 when op="110" else
				entr7 when op="111" else
				"0000000000000000";

end architecture;
