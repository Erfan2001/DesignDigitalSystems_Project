library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--Entity
entity ControlUnit is
	port(
		clk : in std_logic;
		pc : buffer integer := 0;
		x : buffer integer := 1;
		w : buffer integer := 0;
		instruction : in std_logic_vector(15 downto 0);
		readData, regWrite, regRead, aluEnable, writeResult, loadData : out std_logic := '0'
	);
end ControlUnit;
--Architecture
architecture ControlUnit_Behavioral of ControlUnit is

	type stateTypes is ( fetch_section, decode_section, exe_section, write_section );
	signal state: stateTypes := fetch_section ;
	
begin

	clock_process: process (clk) 
	begin 
		if (rising_edge(clk)) then 
			case state is
			when fetch_section => state <= decode_section;
			when decode_section => state <= exe_section;
			when exe_section => if (instruction = x"0003") then 
								state <= write_section;
							else
								state <= fetch_section;
							end if;
			when others => state <= write_section ;
			end case;
		end if ;
	end process;
	
	
	state_process: process (state)
	begin 
		case state is
			----- Fetch Section -----
			when fetch_section =>
								if (pc < 19) then 
									pc <=  pc + 1;
								elsif (pc  = 19) then  
									pc <= 0;
								end if;
								regRead <= '1';					
								aluEnable <= '0';
								loadData <= '0';
			----- Decode Section -----
			when decode_section => regRead <= '0';
								if (instruction = x"0001") then 
									readData <= '1';
									if (w < 4 and x < 4) then 
										if (w = 3) then 
											x <= x + 1;
											w <= 1;
										elsif ( w < 3 ) then 
											w <= w + 1;
									end if;
									else
										w <= 1;
										x <= 1;
									end if ;		
									elsif (instruction = x"0002") then 
										loadData <= '0';
										readData <= '0';
									elsif (instruction = x"0003") then 
										aluEnable <= '0';
										loadData <= '0';
										readData <= '0';
								end if;
			----- Execution Section -----					
			when exe_section => readData <= '0';
							if (instruction = x"0001") then 
								loadData <= '1';
							elsif (instruction = x"0002") then 
								aluEnable <= '1';
							elsif (instruction = x"0003") then
								writeResult <= '1';
								regWrite <= '1';
							end if;
			----- Write Section -----	
			when write_section=> writeResult <= '1';
							regWrite <= '1';
		end case;
	end process;
	
end ControlUnit_Behavioral;
