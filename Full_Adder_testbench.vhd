--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:15:15 02/09/2014
-- Design Name:   
-- Module Name:   C:/Users/C16Sean.Bapty/Documents/Academics 1.0/Spring 2014/ECE 281/Lab2_Bapty/Full_Adder_testbench.vhd
-- Project Name:  Lab2_Bapty
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Full_Adder
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Full_Adder_testbench IS
END Full_Adder_testbench;
 
ARCHITECTURE behavior OF Full_Adder_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Full_Adder
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         Cin : IN  std_logic;
         Cout : OUT  std_logic;
         S : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal Cin : std_logic := '0';

 	--Outputs
   signal Cout : std_logic;
   signal S : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Full_Adder PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          Cout => Cout,
          S => S
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	   A <= '0';
		B <= '0';
		Cin <= '0';
		wait for 100 ns;
		A <= '0';
		B <= '1';
		Cin <= '0';
		wait for 100 ns;
		A <= '1';
		B <= '0';
		Cin <= '0';
		wait for 100 ns;
		A <= '1';
		B <= '1';
		Cin <= '0';
		wait for 100 ns;
		A <= '0';
		B <= '0';
		Cin <= '1';
		wait for 100 ns;
		A <= '0';
		B <= '1';
		Cin <= '1';
		wait for 100 ns;
		A <= '1';
		B <= '0';
		Cin <= '1';
		wait for 100 ns;
		A <= '1';
		B <= '1';
		Cin <= '1';
		wait for 100 ns;
		wait;
--      -- hold reset state for 100 ns.
--      wait for 100 ns;	
--
--      wait for <clock>_period*10;
--
--      -- insert stimulus here 
--
--      wait;
   end process;

END;
