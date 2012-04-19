----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:10:17 04/15/2012 
-- Design Name: 
-- Module Name:    eightbit_fulladder - stuct_eightbit_fulladder 
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

entity eightbit_fulladder is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           Cin : in  STD_LOGIC;
			  Enable : in STD_LOGIC;
           Sum : out  STD_LOGIC_VECTOR (7 downto 0);
           Cout : out  STD_LOGIC;
			  V: out STD_LOGIC);
end eightbit_fulladder;

architecture struct_eightbit_fulladder of eightbit_fulladder is

	COMPONENT fulladder
		Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           S : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
	END COMPONENT;
	
	COMPONENT tri_buffer
	 Port ( Data : in  STD_LOGIC;
           Dataout : out  STD_LOGIC;
           Enable : in  STD_LOGIC);
	END COMPONENT;

signal c1, c2, c3, c4, c5, c6, c7: STD_LOGIC;
signal s0, s1, s2, s3, s4, s5, s6, s7: STD_LOGIC; 
signal carry_out, bufsignal: STD_LOGIC;
begin

f1: fulladder PORT MAP (
	A(0),
	B(0),
	Cin,
	s0,
	c1
);
f2: fulladder PORT MAP (
	A(1),
	B(1),
	c1,
	s1,
	c2
);
f3: fulladder PORT MAP (
	A(2),
	B(2),
	c2,
	s2,
	c3
);
f4: fulladder PORT MAP (
	A(3),
	B(3),
	c3,
	s3,
	c4
);
f5: fulladder PORT MAP (
	A(4),
	B(4),
	c4,
	s4,
	c5
);
f6: fulladder PORT MAP (
	A(5),
	B(5),
	c5,
	s5,
	c6
);
f7: fulladder PORT MAP (
	A(6),
	B(6),
	c6,
	s6,
	c7
);
f8: fulladder PORT MAP (
	A(7),
	B(7),
	c7,
	s7,
	carry_out
);
bufsignal <= (A(7) xor s7) and not(A(7) xor B(7));
b0: tri_buffer PORT MAP (
s0,
Sum(0),
Enable
);

b1: tri_buffer PORT MAP (
s1,
Sum(1),
Enable
);

b2: tri_buffer PORT MAP (
s2,
Sum(2),
Enable
);

b3: tri_buffer PORT MAP (
s3,
Sum(3),
Enable
);

b4: tri_buffer PORT MAP (
s4,
Sum(4),
Enable
);

b5: tri_buffer PORT MAP (
s5,
Sum(5),
Enable
);

b6: tri_buffer PORT MAP (
s6,
Sum(6),
Enable
);

b7: tri_buffer PORT MAP (
s7,
Sum(7),
Enable
);

buffer_carry: tri_buffer PORT MAP (
carry_out,
Cout,
Enable
);

buffer_v: tri_buffer PORT MAP (
bufsignal,
V,
Enable
);
end struct_eightbit_fulladder;

