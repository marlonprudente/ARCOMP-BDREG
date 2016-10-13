library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux16bits_tb is
end entity;

architecture a_mux16bits_tb of mux16bits_tb is
	component mux16bits is
		port(
			entr0	:	in unsigned(15 downto 0);
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
	end component;
	signal entr0,entr1,entr2,entr3,entr4,entr5,entr6,entr7,saida:	unsigned(15 downto 0);
	signal op:	unsigned(2 downto 0);

	begin
		utt: mux16bits port map(
			entr0=>entr0,
			entr1=>entr1,
			entr2=>entr2,
			entr3=>entr3,
			entr4=>entr4,
			entr5=>entr5,
			entr6=>entr6,
			entr7=>entr7,
			op=>op,
			saida=>saida
			);

	process
		begin
			op<="000";
			wait for 90 ns;
			entr1<="0000000000000001";
			op<="001";
			wait for 90 ns;
			entr2<="0000000000000011";
			op<="010";
			wait for 90 ns;
			entr3<="0000000000000001";
			op<="011";
			wait for 90 ns;
			entr4<="0000000000000001";
			op<="100";
			wait for 90 ns;
			entr5<="0000000000000001";
			op<="101";
			wait for 90 ns;
			entr6<="0000000000000001";
			op<="110";
			wait for 90 ns;
			entr7<="0000000000000001";
			op<="111";
			wait for 90 ns;

		wait;

	end process;

end architecture;

