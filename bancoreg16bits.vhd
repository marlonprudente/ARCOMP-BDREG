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
				op			:	in unsigned(1 downto 0);
				data_in		:	in unsigned(15 downto 0);
				data_out	:	out unsigned (15 downto 0)
	);
	end component;

	component mux16bits is
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
	end component;

signal clk,rst : std_logic;

begin 
	reg0: reg16bits	port map(clock=>clk,reset=>rst,wr_enable=>wr_en,data_in=> "0",data_out=>"0000000000000000");
	reg1: reg16bits port map(clock=>clk,reset=>rst,wr_enable=>wr_en,data_in=> data_in,data_out=> entr1);
	reg2: reg16bits port map(clock=>clk,reset=>rst,wr_enable=>wr_en,data_in=> data_in,data_out=> entr2);
	reg3: reg16bits port map(clock=>clk,reset=>rst,wr_enable=>wr_en,data_in=> data_in,data_out=> entr3);
	reg4: reg16bits port map(clock=>clk,reset=>rst,wr_enable=>wr_en,data_in=> data_in,data_out=> entr4);
	reg5: reg16bits port map(clock=>clk,reset=>rst,wr_enable=>wr_en,data_in=> data_in,data_out=> entr5);
	reg6: reg16bits port map(clock=>clk,reset=>rst,wr_enable=>wr_en,data_in=> data_in,data_out=> entr6);
	reg7: reg16bits port map(clock=>clk,reset=>rst,wr_enable=>wr_en,data_in=> data_in,data_out=> entr7);
end architecture;