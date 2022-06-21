library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--Entity
entity ProcessingUnit is
	port (
		clk : in std_logic;
		x,w : in integer;
		accOut : out integer ;
		writeResult, loadData, aluEnable : in std_logic
	);
end ProcessingUnit;
--Architecture
architecture ProcessingUnit_Behavioral of ProcessingUnit is
	signal xReg, wReg,acc : integer;

begin 
	Processing_unit: process (clk)
		begin 	
		if (rising_edge(clk)) then 
			-- Write Result is Active
			if (writeResult = '1') then
					accOut<= acc;
			-- Load Data is Active
			elsif (loadData= '1') then
					xReg<= x;
					wReg<= w;
			-- ALU is Enable
			elsif (aluEnable = '1') then
					acc<= acc +  wReg * xReg;
			end if;
		end if;
	end process;
end  ProcessingUnit_Behavioral;

