library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bancoreg16bits is
	port(	readreg1	:	in std_logic;
			readreg2	:	in std_logic;
			wr_en 		:	in std_logic;
			clock		:	in std_logic;
			reset		:	in std_logic;
			wr_data		:	in unsigned(15 downto 0);
			readdata1	:	out unsigned(15 downto 0);
			readdata2	:	out unsigned(15 downto 0)


	);
end entity;

architecture a_bancoreg16bits of bancoreg16bits is
	component reg16bits is
		port(	clock		:	in std_logic;
				reset		:	in std_logic;
				wr_enable	:	in std_logic;
				data_in		:	in unsigned(15 downto 0);
				data_out	:	out unsigned (15 downto 0)
	);
	end component;

signal clk,rst : std_logic;

begin 
	reg0: reg16bits	port map(clock=>clk,reset=>rst,wr_enable=>wr_en,data_in=> ,data_out=>"0000000000000000");
	reg1: reg16bits port map(clock=>clk,reset=>rst,wr_enable=>wr_en,data_in=> ,data_out=> );
	reg2: reg16bits port map(clock=>clk,reset=>rst,wr_enable=>wr_en,data_in=> ,data_out=> );
	reg3: reg16bits port map(clock=>clk,reset=>rst,wr_enable=>wr_en,data_in=> ,data_out=> );
	reg4: reg16bits port map(clock=>clk,reset=>rst,wr_enable=>wr_en,data_in=> ,data_out=> );
	reg5: reg16bits port map(clock=>clk,reset=>rst,wr_enable=>wr_en,data_in=> ,data_out=> );
	reg6: reg16bits port map(clock=>clk,reset=>rst,wr_enable=>wr_en,data_in=> ,data_out=> );
	reg7: reg16bits port map(clock=>clk,reset=>rst,wr_enable=>wr_en,data_in=> ,data_out=> );
end architecture;