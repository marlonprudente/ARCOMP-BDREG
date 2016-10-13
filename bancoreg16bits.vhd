library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bancoreg16bits is
	port(	readreg1	:	in unsigned(2 downto 0);
			readreg2	:	in unsigned(2 downto 0);
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
signal reg0tomux1,reg1tomux1,reg2tomux1,reg3tomux1,reg4tomux1,reg5tomux1,reg6tomux1,reg7tomux1,	:	std_logic;
signal reg0tomux2,reg1tomux2,reg2tomux2,reg3tomux2,reg4tomux2,reg5tomux2,reg6tomux2,reg7tomux2,	:	std_logic;

begin 
	reg0: reg16bits	port map(clock=>clk,reset=>rst,wr_enable=>wr_en,data_in=> "0",data_out=>"0000000000000000");
	reg1: reg16bits port map(clock=>clk,reset=>rst,wr_enable=>wr_en,data_in=> data_in,data_out=> reg1tomux);
	reg2: reg16bits port map(clock=>clk,reset=>rst,wr_enable=>wr_en,data_in=> data_in,data_out=> reg2tomux);
	reg3: reg16bits port map(clock=>clk,reset=>rst,wr_enable=>wr_en,data_in=> data_in,data_out=> reg3tomux);
	reg4: reg16bits port map(clock=>clk,reset=>rst,wr_enable=>wr_en,data_in=> data_in,data_out=> reg4tomux);
	reg5: reg16bits port map(clock=>clk,reset=>rst,wr_enable=>wr_en,data_in=> data_in,data_out=> reg5tomux);
	reg6: reg16bits port map(clock=>clk,reset=>rst,wr_enable=>wr_en,data_in=> data_in,data_out=> reg6tomux);
	reg7: reg16bits port map(clock=>clk,reset=>rst,wr_enable=>wr_en,data_in=> data_in,data_out=> reg7tomux);

	mux1:	mux16bits port map(entr0=>"0000000000000000",
		entr1=>reg1tomux1,
		entr2=>reg2tomux1,
		entr3=>reg3tomux1,
		entr4=>reg4tomux1,
		entr5=>reg5tomux1,
		entr6=>reg6tomux1,
		entr7=>reg7tomux1,
		op=>readreg1,
		saida=>readdata1);

		mux2:	mux16bits port map(entr0=>"0000000000000000",
		entr1=>reg1tomux2,
		entr2=>reg2tomux2,
		entr3=>reg3tomux2,
		entr4=>reg4tomux2,
		entr5=>reg5tomux2,
		entr6=>reg6tomux2,
		entr7=>reg7tomux2,
		op=>readreg2,
		saida=>readdata2);
	
end architecture;