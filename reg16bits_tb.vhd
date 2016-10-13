library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg16bits_tb is
end entity;

architecture a_reg16bits_tb of reg16bits_tb is
	component reg16bits is
		port(	clock	: inout unsigned (1 downto 0);
				reset	: inout unsigned (1 downto 0);
				wr_enable	: inout unsigned (1 downto 0);
				data_in		: in unsigned (15 downto 0);
				data_out	: out unsigned (15 downto 0);
		);
	end component;
	
	signal clk,rst,wr_en:	unsigned(1 downto 0);
	signal datain,dataout: unsigned(15 downto 0);

	begin
		uut: reg16bits port map(
		clock=>clk,
		reset=>rst,
		wr_enable=>wr_en,
		data_in=>datain,
		data_out=>dataout
		);

	process
	begin
		clk <='0';
		wait for 50 ns;
		clk <= '1';
		wait for 50 ns;
	end process;

	process
	begin
		rst <= '1';
		wait for 100 ns;
		rst <= '0';
		wait;
	end process;

	process
	begin
		wait for 100 ns;
		wr_en <='0';
		data_in <= "1111111111111111";
		wait for 100 ns;
		data_in <= "1000000000000000";
	end process;

end architecture;