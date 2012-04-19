----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:58:29 04/17/2012 
-- Design Name: 
-- Module Name:    fourbit_fulladder - Behavioral 
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

entity fourbit_fulladder is
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
end fourbit_fulladder;

architecture struct_fourbit_fulladder of fourbit_fulladder is
COMPONENT fulladder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           S : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
END COMPONENT;

COMPONENT tri_buffer is
    Port ( Data : in  STD_LOGIC;
           Enable : in  STD_LOGIC;
           DataOut : out  STD_LOGIC);
END COMPONENT;
signal c0, c1, c2, cin: STD_LOGIC;
begin
cin <= '0';
f1: fulladder PORT MAP(A0,B0,cin,S0,c0);
f2: fulladder PORT MAP(A1,B1,c0,S1,c1);
f3: fulladder PORT MAP(A2,B2,c1,S2,c2);
f4: fulladder PORT MAP(A3,B3,c2,S3,C);

end struct_fourbit_fulladder;

