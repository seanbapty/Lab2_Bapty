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
			OverDetect : out STD_LOGIC;
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
	signal OverDetect : std_logic;
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
			 OverDetect => OverDetect,
          S => S,
          Cout => Cout
        );


   -- Stimulus process
   stim_proc: process
   begin		
	
	   A <= ( 3 downto 0 =>'0' );
		B <= ( 3 downto 0 =>'0' );
		Cin <= '0';
		NegIndicator <= '0';
		--wait for 100 ns;
		
		for I in 0 to 15 loop
			for J in 0 to 15 loop
				wait for 10 ns;
				assert (S = A + B) report "A = " & 
				std_logic'image(A(3)) &
				std_logic'image(A(2)) &
				std_logic'image(A(1)) &
				std_logic'image(A(0)) &
				"B = " &
				std_logic'image(B(3)) &
				std_logic'image(B(2)) &
				std_logic'image(B(1)) &
				std_logic'image(B(0))
				severity ERROR;
				assert (S /= A + B) report "test success" severity NOTE;
				B <= B + "0001";
			end loop;
			A <= A + "0001";
		end loop;
		wait for 10 ns;
		Negindicator <= '1';
		for I in 0 to 15 loop
			for J in 0 to 15 loop
				wait for 10 ns;
				assert (S = A - B) report "A = " &
				std_logic'image(A(3)) &
				std_logic'image(A(2)) &
				std_logic'image(A(1)) &
				std_logic'image(A(0)) &
				"B = " &
				std_logic'image(B(3)) &
				std_logic'image(B(2)) &
				std_logic'image(B(1)) &
				std_logic'image(B(0))
				severity ERROR;
				assert (S /= A - B) report "test success" severity NOTE;
				B <= B + "0001";
			end loop;
			A <= A + "0001";
		end loop;      
		wait;
   end process;

END;
