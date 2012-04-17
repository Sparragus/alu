----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:25:03 04/15/2012 
-- Design Name: 
-- Module Name:    and_8_bitwise - struct_and_8_bitwise 
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

entity and_8_bitwise is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           ENABLE : in  STD_LOGIC;
           F : out STD_LOGIC_VECTOR (7 downto 0));
end and_8_bitwise;

architecture struct_and_8_bitwise of and_8_bitwise is

component and_2 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           F : out  STD_LOGIC);
end component;

component tri_buffer is
    Port ( Data : in  STD_LOGIC;
           Dataout : out  STD_LOGIC;
           Enable : in  STD_LOGIC);
end component;

signal C: STD_LOGIC_VECTOR (7 downto 0);

begin
	U0: and_2 port map (A(0), B(0), C(0));
	U1: and_2 port map (A(1), B(1), C(1));
	U2: and_2 port map (A(2), B(2), C(2));
	U3: and_2 port map (A(3), B(3), C(3));
	U4: and_2 port map (A(4), B(4), C(4));
	U5: and_2 port map (A(5), B(5), C(5));
	U6: and_2 port map (A(6), B(6), C(6));
	U7: and_2 port map (A(7), B(7), C(7));
	
	U8: 	tri_buffer port map (C(0), F(0), ENABLE);
	U9: 	tri_buffer port map (C(1), F(1), ENABLE);
	U10: 	tri_buffer port map (C(2), F(2), ENABLE);
	U11: 	tri_buffer port map (C(3), F(3), ENABLE);
	U12: 	tri_buffer port map (C(4), F(4), ENABLE);
	U13: 	tri_buffer port map (C(5), F(5), ENABLE);
	U14: 	tri_buffer port map (C(6), F(6), ENABLE);
	U15: 	tri_buffer port map (C(7), F(7), ENABLE);

end struct_and_8_bitwise;

