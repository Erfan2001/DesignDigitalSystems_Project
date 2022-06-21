LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Coprocessor_TestBench IS
END Coprocessor_TestBench;
 
ARCHITECTURE Coprocessor_Behavior of Coprocessor_TestBench IS 
 
    COMPONENT Coprocessor
    PORT(
         clk : IN  std_logic;
			coprocessorResult: out integer
        );
    END COMPONENT;
    
   signal clk : std_logic := '0' ;
	signal coprocessorResult: integer;

BEGIN

   uut: Coprocessor PORT MAP (clk => clk, coprocessorResult => coprocessorResult);
	clk <= not clk after 5 ns;
	
END;
