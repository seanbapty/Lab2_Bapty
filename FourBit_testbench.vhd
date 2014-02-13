--------------------------------------------------------------------------------
-- Company: SCIENCE INC
-- Engineer: Sean Bapty
--
-- Create Date:   20:27:03 02/10/2014
-- Design Name:   
-- Module Name:   C:/Users/C16Sean.Bapty/Documents/Academics 1.0/Spring 2014/ECE 281/Lab2_Bapty/FourBit_testbench.vhd
-- Project Name:  Lab2_Bapty
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FourBitAdder
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
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY FourBit_testbench IS
END FourBit_testbench;
 
ARCHITECTURE behavior OF FourBit_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FourBitAdder
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
			Cin : IN std_logic;
			NegIndicator : IN std_logic;
         S : OUT  std_logic_vector(3 downto 0);
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
	signal Cin : std_logic;
	signal NegIndicator : std_logic;

 	--Outputs
	signal count : std_logic_vector(3 downto 0) := "0000";
   signal S : std_logic_vector(3 downto 0);
   signal Cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FourBitAdder PORT MAP (
          A => A,
          B => B,
			 Cin => Cin,
			 NegIndicator => NegIndicator,
          S => S,
          Cout => Cout
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
-- 

   -- Stimulus process
   stim_proc: process
   begin		
	
	   A <= ( 3 downto 0 =>'0' );
		B <= ( 3 downto 0 =>'0' );
		Cin <= '0';
		NegIndicator <= '1';
		--wait for 100 ns;
		
		for I in 0 to 15 loop
			for J in 0 to 15 loop
				wait for 10 ns;
--				assert (S = A + B) report "Expected sum of " &
--					integer'image(to_integer(unsigned((A+B)))) & " for A = " &
--					integer'image(to_integer(unsigned((A)))) & " and B = " &
--					integer'image(to_integer(unsigned((B)))) & ", but was " &
--					integer'image(to_integer(unsigned((S)))) severity ERROR;
				B <= B + "0001";
			end loop;
			A <= A + "0001";
		end loop;
		wait for 10 ns;
--      -- hold reset state for 100 ns.
--      wait for 100 ns;	

--			for I in 0 to 15 loop
--				wait for 100 ns;
--					REPORT "For A = "  
--						& count
--						& " B = "
--						& std_logic'image(count(2))
--						--& " Cin = "
--						--& std_logic'image(count(1))
--						--& " S = "
--						--& std_logic'image(count(0))
--				SEVERITY NOTE;
--				count <= count + 1;
--		end loop;
      wait;
   end process;

END;
