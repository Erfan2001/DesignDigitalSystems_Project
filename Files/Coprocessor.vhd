library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--Entity
entity Coprocessor is
	port (
		clk: in std_logic;
		coprocessorResult: out integer
		);
end Coprocessor;
--Architecture
architecture Coprocessor_Behavioral of Coprocessor is

	signal instruction :  std_logic_vector(15 downto 0);
	signal pc :  integer := -1;
	signal x :  integer := 0;
	signal w :  integer := -1;
	signal x_out,w_out :  integer;
	signal readData, regWrite, aluEnable, writeResult, loadData, regRead :  std_logic := '0';
	signal result :  integer := 0;
	
	-- ControlUnit Component --
	component ControlUnit is port(
		clk : in std_logic;
		pc : buffer integer := 0;
		x : buffer integer := 1;
		w : buffer integer := 0;
		instruction : in std_logic_vector(15 downto 0);
		readData, regWrite, regRead, aluEnable, writeResult, loadData : out std_logic := '0'
	);	end component;
	
	-- RegisterFile Component --	
	component RegisterFile is port (
		 clk: in std_logic;
		 pc : in integer;
		 i, j: in Integer;
		 x_out : out Integer;
		 w_out : out Integer;
		 instruction: out std_logic_vector(15 downto 0);
		 result : in integer;
		 readData, regRead, regWrite: in std_logic
		 );
	 end component;
	 
	 -- ProcessingUnit Component --	
	 component ProcessingUnit is port (
		clk : in std_logic;
		x,w : in integer;
		accOut : out integer ;
		writeResult, loadData, aluEnable : in std_logic
	);
	 end component;
	 
begin

	ControlUnit1: ControlUnit port map (clk , pc, x, w, instruction ,
										readData, regWrite, regRead, aluEnable, writeResult, loadData);
	RegisterFile1: RegisterFile port map (clk , pc , x, w, x_out , w_out , instruction , result, readData, regRead, regWrite);
	ProcessingUnit1: ProcessingUnit port map ( clk , x_out , w_out , coprocessorResult , writeResult, loadData, aluEnable);
	
end Coprocessor_Behavioral; 