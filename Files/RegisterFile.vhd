library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--Entity
entity RegisterFile is
	port (
		 clk: in std_logic;
		 pc : in integer;
		 i, j: in Integer;
		 x_out : out Integer;
		 w_out : out Integer;
		 instruction: out std_logic_vector(15 downto 0);
		 result : in integer := 0 ;
		 readData, regRead, regWrite: in std_logic
	);	
end RegisterFile;
--Architecture
architecture RegisterFile_Behavioral of RegisterFile is	
	--Result
	signal regResult: integer;
	--Matrixs Data
	type data3x3 is array (1 to 3, 1 to 3) of integer;
	signal x: data3x3 := ((255, 200, 100), (5, 46, 180), (100, 200, 300));
	signal w: data3x3 := ((1, 0 , -1),(1, 0 , -1),(1, 0 , -1));
	--Instructions Data
	type data19x16 is array (1 to 19) of std_logic_vector(15 downto 0);
	signal regInstruction :data19x16 := (
	1 => x"0001",
	2 => x"0002",
	3 => x"0001",
	4 => x"0002",
	5 => x"0001",
	6 => x"0002",
	7 => x"0001",
	8 => x"0002",
	9 => x"0001",
	10 => x"0002",
	11 => x"0001",
	12 => x"0002",
	13 => x"0001",
	14 => x"0002",
	15 => x"0001",
	16 => x"0002",
	17 => x"0001",
	18 => x"0002",
	19 => x"0003"
	);

begin

	-- Fetch Section
	fetch_section: process (clk)
	begin 
		if(rising_edge(clk)) then
			if (regRead = '1') then 
				instruction <= regInstruction(pc);
			end if;
		end if;
	end process;
	
	-- Write Section
	write_section: process(clk)
		begin 
		if (rising_edge(clk)) then 
			if (regWrite = '1') then 
					regResult <= result;
			end if;
		end if;
	end process;
	
	-- Read Section
	read_section : process (clk)
	begin 
		if (rising_edge(clk)) then 
			if (readData = '1') then 
				x_out <= x(i, j);
				w_out <= w(i, j);
			end if;
		end if;
	end process;
	
end RegisterFile_Behavioral;