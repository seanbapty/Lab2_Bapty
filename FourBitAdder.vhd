----------------------------------------------------------------------------------
-- Company: SCIENCE INC
-- Engineer: Sean Bapty
-- 
-- Create Date:    10:54:23 02/10/2014 
-- Design Name: 
-- Module Name:    FourBitAdder - Structural 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FourBitAdder is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
			  Cin : in STD_LOGIC;
			  negIndicator : in STD_LOGIC;
			  OverDetect : out STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (3 downto 0);
			  Cout : out STD_LOGIC);
			  
end FourBitAdder;

architecture Structural of FourBitAdder is

component full_adder is 
	port (A : in STD_LOGIC;
		B : in STD_LOGIC;
		Cin : in STD_LOGIC;
		Cout : out STD_LOGIC;
		S : out STD_LOGIC);
end component full_adder;

Signal C : std_logic_vector (3 downto 0);
Signal NewB : std_logic_vector (3 downto 0);
--Signal OverDetect : STD_LOGIC;

begin
NewB(0) <= NOT B(0) when negIndicator = '1' else B(0);
NewB(1) <= NOT B(1) when negIndicator = '1' else B(1);
NewB(2) <= NOT B(2) when negIndicator = '1' else B(2);
NewB(3) <= NOT B(3) when negIndicator = '1' else B(3);

Bit0: component full_adder
   port map (A => A(0),
	 	 B => NewB(0),
		 Cin => negIndicator,
		 Cout => C(0),
		 S => S(0));

Bit1: component full_adder
   port map (A => A(1),
	 	 B => NewB(1),
		 Cin => C(0),
		 Cout => C(1),
		 S => S(1));

Bit2: component full_adder
   port map (A => A(2),
	 	 B => NewB(2),
		 Cin => C(1),
		 Cout => C(2),
		 S => S(2));
		 
Bit3: component full_adder
   port map (A => A(3),
	 	 B => NewB(3),
		 Cin => C(2),
		 Cout => C(3),
		 S => S(3));
	Cout<=C(3);
OverDetect <= C(3) xor C(2); --when negIndicator ='1' else C(3);
end Structural;