----------------------------------------------------------------------------------
-- Company: SCIENCE INC
-- Engineer: Sean Bapty
-- 
-- Create Date:    15:50:25 02/09/2014 
-- Design Name: 
-- Module Name:    Full_Adder - Behavioral 
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

entity Full_Adder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           S : out  STD_LOGIC);
end Full_Adder;

architecture Behavioral of Full_Adder is

begin

S <= A XOR B XOR Cin;
Cout <= (A AND B AND NOT Cin) OR (NOT A AND B AND Cin) OR (A AND Cin);

end Behavioral;

