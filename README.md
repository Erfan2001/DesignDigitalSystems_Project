 # DesignDigitalSystems Project
 
 Design Assistant CPU

## Project description:

The task at hand involves the design of a circuit capable of performing matrix multiplication on two 3x3 matrices, utilizing a column-by-column and row-by-row approach, followed by the aggregation of results and their storage in a register. This is a complex undertaking, requiring meticulous planning and execution.

![image](https://github.com/Erfan2001/Architecture_Project/assets/69463039/93c8c1b2-2d06-459e-946c-7d3d0410a45b)

The software component for the 3x3 matrix multiplication is a fundamental part of this system. The circuit architecture encompassing this multiplication operation consists of three primary units: the registers unit, housing both data registers (two 3x3 integer arrays) and command registers (a two-dimensional array of vector_logic_std type with 15 registers). Within the data registers section, the two 3x3 arrays store integer values, as illustrated in the provided figure. The command registers section, in contrast, consists of 16-bit arrays of vector_logic_std type, with these arrays representing command sequences. Commands are defined in a table, and their execution can be initiated through hexadecimal codes. To configure the command registers, commands are set manually, following a specific sequence that involves load and add/mul commands. The final step is the store command, where the result from the processing unit is stored in a register within the register unit.

![image](https://github.com/Erfan2001/Architecture_Project/assets/69463039/567ef003-9cdb-4a55-9931-377300a515a0)

The architecture additionally requires a processor unit, responsible for recognizing instructions and executing appropriate modules based on the received commands. A control circuit, integrated with the register unit, is essential for fetching data and executing actions based on decoded commands. The control unit's design involves a state machine, which governs the system's operation. All circuits in this system operate in sync with a clock signal and reset asynchronously using a dedicated reset signal. While the provided figure offers a foundation, it serves as an outline, and the intricate details, including circuit components and control signals, must be meticulously determined during the design process.

![image](https://github.com/Erfan2001/Architecture_Project/assets/69463039/7ea787d0-4c5b-4952-b38e-3b42c043b31f)

 *Implemented By Erfan Nourbakhsh*
 
 *Spring 2022*
