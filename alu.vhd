----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:47:11 04/16/2012 
-- Design Name: 
-- Module Name:    alu - struct_alu 
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

entity alu is
    Port ( IN_A : in  STD_LOGIC_VECTOR (7 downto 0);
           IN_B : in  STD_LOGIC_VECTOR (7 downto 0);
           CTRL_AND : in  STD_LOGIC;
           CTRL_OR : in  STD_LOGIC;
           CTRL_XOR : in  STD_LOGIC;
           CTRL_ADDC : in  STD_LOGIC;
           CTRL_SUB : in  STD_LOGIC;
           CTRL_MAC : in  STD_LOGIC;
           CTRL_NEG : in  STD_LOGIC;
           CTRL_NOT : in  STD_LOGIC;
           CTRL_RLC : in  STD_LOGIC;
           CTRL_RRC : in  STD_LOGIC;
           CTRL_INC2 : in  STD_LOGIC;
           ACARREO : in  STD_LOGIC;
           OUT_X : out  STD_LOGIC_VECTOR (7 downto 0);
           FLAG_C : out  STD_LOGIC;
           FLAG_V : out  STD_LOGIC;
           FLAG_N : out  STD_LOGIC;
           FLAG_Z : out  STD_LOGIC);
end alu;

architecture struct_alu of alu is

	component alu_upper is
		  Port ( IN_A : in  STD_LOGIC_VECTOR (7 downto 0);
           IN_B : in  STD_LOGIC_VECTOR (7 downto 0);
			  CARRY_IN : in STD_LOGIC;
           CTRL_ADD : in  STD_LOGIC;
           CTRL_SUB : in  STD_LOGIC;
           CTRL_INC2 : in  STD_LOGIC;
           CTRL_NOT : in  STD_LOGIC;
           CTRL_NEG : in  STD_LOGIC;
			  CTRL_MAC : in STD_LOGIC;
			  SUM: out STD_LOGIC_VECTOR (7 downto 0);
			  CARRY_OUT: out STD_LOGIC;
			  OVERFLOW: out STD_LOGIC);
	end component;
	
	component alu_lower is
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
	end component;
	
	component FlagGenerator is
    Port ( ALU_OUTPUT : in  STD_LOGIC_VECTOR (7 downto 0);
           Cin : in  STD_LOGIC;
           Vin : in  STD_LOGIC;
           C : out STD_LOGIC;
			  V : out STD_LOGIC;
			  Z : out STD_LOGIC;
			  N : out STD_LOGIC);
	end component;
	
	component tri_buffer is
    Port ( Data : in  STD_LOGIC;
           Dataout : out  STD_LOGIC;
           Enable : in  STD_LOGIC);
	end component;
	
	signal 	SIGNAL_X: STD_LOGIC_VECTOR (7 downto 0);
	
	signal	UPPER_OVERFLOW,
				CARRY,
				ENABLE_CARRY,
				RESET_OVERFLOW: STD_LOGIC;

begin
	-- ALU Upper
	upper: alu_upper PORT MAP (IN_A, IN_B, ACARREO, 
										CTRL_ADDC, CTRL_SUB, CTRL_INC2, CTRL_NOT, CTRL_NEG, CTRL_MAC,
										SIGNAL_X, CARRY, UPPER_OVERFLOW);
	-- ALU Lower
	lower: alu_lower PORT MAP (IN_A, IN_B, ACARREO, 
										CTRL_AND, CTRL_OR, CTRL_XOR, CTRL_RLC, CTRL_RRC, SIGNAL_X, CARRY);
					
	RESET_OVERFLOW <= NOT (CTRL_ADDC or CTRL_MAC);
	v_tag: tri_buffer PORT MAP ('0', UPPER_OVERFLOW, RESET_OVERFLOW); 	
	-- Calc Acarreo
	ENABLE_CARRY <= NOT (CTRL_ADDC or CTRL_MAC or CTRL_SUB or CTRL_RLC or CTRL_RRC);
	carry_tag: tri_buffer PORT MAP (ACARREO, CARRY, ENABLE_CARRY); 
	-- Calc X
	OUT_X <= SIGNAL_X;
	-- Set flags
	---- Set FLAG_GEN_CARRY
	flags: FlagGenerator PORT MAP (SIGNAL_X, CARRY, UPPER_OVERFLOW, FLAG_C, FLAG_V, FLAG_Z, FLAG_N);

end struct_alu;

