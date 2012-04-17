----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:28:07 04/16/2012 
-- Design Name: 
-- Module Name:    alu_lower - struct_alu_lower 
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

entity alu_lower is
    Port ( IN_A : in  STD_LOGIC_VECTOR (7 downto 0);
           IN_B : in  STD_LOGIC_VECTOR (7 downto 0);
			  IN_CARRY : in STD_LOGIC;
           CTRL_AND : in  STD_LOGIC;
           CTRL_OR : in  STD_LOGIC;
           CTRL_XOR : in  STD_LOGIC;
           CTRL_RLC : in  STD_LOGIC;
           CTRL_RRC : in  STD_LOGIC;
           OUT_X : out  STD_LOGIC_VECTOR (7 downto 0);
           OUT_CARRY : out  STD_LOGIC);
end alu_lower;

architecture struct_alu_lower of alu_lower is

component and_8_bitwise is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           ENABLE : in  STD_LOGIC;
           F : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component or_8_bitwise is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           ENABLE : in  STD_LOGIC;
           F : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component xor_8_bitwise is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           ENABLE : in  STD_LOGIC;
           F : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component RLC is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           E : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           F : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component RRC is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           E : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           F : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

begin

-- AND
U0: and_8_bitwise PORT MAP (IN_A, IN_B, CTRL_AND, OUT_X);
-- OR
U1: or_8_bitwise PORT MAP (IN_A, IN_B, CTRL_OR, OUT_X);
-- XOR
U2: xor_8_bitwise PORT MAP (IN_A, IN_B, CTRL_XOR, OUT_X);
--RLC
U3: RLC PORT MAP (IN_B, CTRL_RLC, IN_CARRY, OUT_CARRY, OUT_X);
--RRC
U4: RRC PORT MAP (IN_B, CTRL_RRC, IN_CARRY, OUT_CARRY, OUT_X);



end struct_alu_lower;
