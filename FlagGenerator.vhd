----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:43:25 04/16/2012 
-- Design Name: 
-- Module Name:    FlagGenerator - Behavioral 
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

entity FlagGenerator is
    Port ( ALU_OUTPUT : in  STD_LOGIC_VECTOR (7 downto 0);
           Cin : in  STD_LOGIC;
           Vin : in  STD_LOGIC;
           C : out STD_LOGIC;
			  V : out STD_LOGIC;
			  Z : out STD_LOGIC;
			  N : out STD_LOGIC);
end FlagGenerator;

architecture struct_FlagGenerator of FlagGenerator is

begin

	C <= Cin;
	V <= Vin;
	Z <= not (ALU_OUTPUT(0) or ALU_OUTPUT(1) or ALU_OUTPUT(2) or ALU_OUTPUT(3) or ALU_OUTPUT(4) or ALU_OUTPUT(5) or ALU_OUTPUT(6) or ALU_OUTPUT(7));
	N <= ALU_OUTPUT(7);
-- No se si es mejor 

end struct_FlagGenerator;

