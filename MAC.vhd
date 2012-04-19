----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:30:28 04/17/2012 
-- Design Name: 
-- Module Name:    MAC - Behavioral 
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

entity MAC is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Enable : in  STD_LOGIC;
           Sum : out  STD_LOGIC_VECTOR (7 downto 0);
           Carry : out  STD_LOGIC;
           V : out  STD_LOGIC);
end MAC;

architecture struct_MAC of MAC is

COMPONENT fourbit_fulladder is
     Port ( A0 : in  STD_LOGIC;
			  A1 : in  STD_LOGIC;
			  A2 : in  STD_LOGIC;
			  A3 : in  STD_LOGIC;
			  B0 : in  STD_LOGIC;
			  B1 : in  STD_LOGIC;
			  B2 : in  STD_LOGIC;
			  B3 : in  STD_LOGIC;
           S0 : out  STD_LOGIC;
			  S1 : out  STD_LOGIC;
			  S2 : out  STD_LOGIC;
			  S3 : out  STD_LOGIC;
           C : out  STD_LOGIC);
END COMPONENT;

COMPONENT tri_buffer is
    Port ( Data : in  STD_LOGIC;
           Enable : in  STD_LOGIC;
           DataOut : out  STD_LOGIC);
END COMPONENT;

COMPONENT eightbit_fulladder is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           Cin : in  STD_LOGIC;
			  Enable : in STD_LOGIC;
           Sum : out  STD_LOGIC_VECTOR (7 downto 0);
           Cout : out  STD_LOGIC;
			  V: out STD_LOGIC);
END COMPONENT eightbit_fulladder;

signal row11, row12, row13, row14: STD_LOGIC;
signal row21, row22, row23, row24: STD_LOGIC;
signal row31, row32, row33, row34: STD_LOGIC;
signal row41, row42, row43, row44: STD_LOGIC;

signal srow1, srow2, srow3, srow4, srow5: STD_LOGIC;
signal s2row1, s2row2, s2row3, s2row4, s2row5: STD_LOGIC;
signal s3row1, s3row2, s3row3, s3row4, s3row5: STD_LOGIC;

signal vec1: STD_LOGIC_VECTOR (7 downto 0);
signal vec2: STD_LOGIC_VECTOR (7 downto 0);

begin
row11 <= A(0) and B(0);
row12 <= A(0) and B(1);
row13 <= A(0) and B(2);
row14 <= A(0) and B(3);

row21 <= A(1) and B(0);
row22 <= A(1) and B(1);
row23 <= A(1) and B(2);
row24 <= A(1) and B(3);

row31 <= A(2) and B(0);
row32 <= A(2) and B(1);
row33 <= A(2) and B(2);
row34 <= A(2) and B(3);

row41 <= A(3) and B(0);
row42 <= A(3) and B(1);
row43 <= A(3) and B(2);
row44 <= A(3) and B(3);

f1: fourbit_fulladder PORT MAP(row12, row13, row14, '0', row21, row22, row23, row24, srow1, srow2, srow3, srow4, srow5);
f2: fourbit_fulladder PORT MAP(row31, row32, row33, row34, srow2, srow3, srow4, srow5, s2row1, s2row2, s2row3, s2row4, s2row5);
f3: fourbit_fulladder PORT MAP(row41, row42, row43, row44, s2row2, s2row3, s2row4, s2row5, s3row1, s3row2, s3row3, s3row4, s3row5);

vec1(0) <= row11;
vec1(1) <= srow1;
vec1(2) <= s2row1;
vec1(3) <= s3row1;
vec1(4) <= s3row2;
vec1(5) <= s3row3;
vec1(6) <= s3row4;
vec1(7) <= s3row5;

vec2(0) <= B(0);
vec2(1) <= B(1);
vec2(2) <= B(2);
vec2(3) <= B(3);
vec2(4) <= '0';
vec2(5) <= '0';
vec2(6) <= '0';
vec2(7) <= '0';

e1: eightbit_fulladder PORT MAP(vec1,vec2,'0',Enable,Sum,Carry,V);
end struct_MAC;

