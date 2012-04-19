----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:16:26 04/15/2012 
-- Design Name: 
-- Module Name:    alu_upper - struct_alu_upper 
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

entity alu_upper is
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
end alu_upper;

architecture struct_alu_upper of alu_upper is

	component or_2 is
		 Port ( A : in  STD_LOGIC;
				  B : in  STD_LOGIC;
				  F : out  STD_LOGIC);
	end component;
	
	component or_8_bitwise is
		 Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
				  B : in  STD_LOGIC_VECTOR (7 downto 0);
				  ENABLE : in  STD_LOGIC;
				  F : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	component and_2 is
		 Port ( A : in  STD_LOGIC;
				  B : in  STD_LOGIC;
				  F : out  STD_LOGIC);
	end component;
	
	component and_8_bitwise is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           ENABLE : in  STD_LOGIC;
           F : out STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	component xor_2 is
		 Port ( A : in  STD_LOGIC;
				  B : in  STD_LOGIC;
				  F : out  STD_LOGIC);
	end component;
	
	component xor_8_bitwise is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           ENABLE : in  STD_LOGIC;
           F : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	component eightbit_fulladder is
		 Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
				  B : in  STD_LOGIC_VECTOR (7 downto 0);
				  Cin : in  STD_LOGIC;
				  Enable : in STD_LOGIC;
				  Sum : out  STD_LOGIC_VECTOR (7 downto 0);
				  Cout : out  STD_LOGIC;
				  V: out STD_LOGIC);
	end component;
	
	COMPONENT MAC is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Enable : in  STD_LOGIC;
           Sum : out  STD_LOGIC_VECTOR (7 downto 0);
           Carry : out  STD_LOGIC;
           V : out  STD_LOGIC);
	END COMPONENT;
	
	signal 	ADD_OR_SUB,
				INC2_OR_A1,
				NOT_OR_SUB,
				NOT_OR_SUB_OR_NEG,
				CARRY_SN,
				CIN_OR_CSN,
				NOT_OR_INC2,
				NOT_NOI,
				CARRY,
				ENABLE_ADD: STD_LOGIC;
	signal 	A_AND_AOS,
				OUT_A,
				OUT_B: STD_LOGIC_VECTOR (7 downto 0);
	
	signal fourA, fourB: STD_LOGIC_VECTOR (3 downto 0);

begin
	
	-- Deal with A
	---- ADD_OR_SUB = ADD or SUB
	U0: or_2 PORT MAP (CTRL_ADD, CTRL_SUB, ADD_OR_SUB);
	---- A_AND_AOS = A AND ADD_OR_SUB
	U1: and_8_bitwise PORT MAP (	A => IN_A,
											B(0) => ADD_OR_SUB,
											B(1) => ADD_OR_SUB,
											B(2) => ADD_OR_SUB,
											B(3) => ADD_OR_SUB,
											B(4) => ADD_OR_SUB,
											B(5) => ADD_OR_SUB,
											B(6) => ADD_OR_SUB,
											B(7) => ADD_OR_SUB,
											ENABLE => '1',
											F => A_AND_AOS);
	---- INC2_OR_A1 = INC2 OR A_AND_AOS(1)
	U2: or_2 PORT MAP (CTRL_INC2, A_AND_AOS(1), INC2_OR_A1);
	---- Join INC2_OR_A1 with rest of A_AND_AOS
	U3: OUT_A(7 downto 2) <= A_AND_AOS(7 downto 2);
	U4: OUT_A(1) <= INC2_OR_A1;
	U5: OUT_A(0) <= A_AND_AOS(0);
	
	--Deal with B
	---- NOT_OR_SUB_OR_NEG = NOT or SUB or NEG
	U6: or_2 PORT MAP (CTRL_NOT, CTRL_SUB, NOT_OR_SUB);
	U7: or_2 PORT MAP (NOT_OR_SUB, CTRL_NEG, NOT_OR_SUB_OR_NEG);
	---- OUT_B = B XOR NOT_OR_SUB_OR_NEG
	U8: xor_8_bitwise PORT MAP (	A => IN_B,
											B(0) => NOT_OR_SUB_OR_NEG,
											B(1) => NOT_OR_SUB_OR_NEG,
											B(2) => NOT_OR_SUB_OR_NEG,
											B(3) => NOT_OR_SUB_OR_NEG,
											B(4) => NOT_OR_SUB_OR_NEG,
											B(5) => NOT_OR_SUB_OR_NEG,
											B(6) => NOT_OR_SUB_OR_NEG,
											B(7) => NOT_OR_SUB_OR_NEG,
											ENABLE => '1',
											F => OUT_B);
	---- CARRY = (C_SN OR CARRY_IN) AND (CTRL_NOT OR CTRL_INC2)
	U9: or_2 PORT MAP (CTRL_SUB, CTRL_NEG, CARRY_SN);
	U10: or_2 PORT MAP (CARRY_SN, CARRY_IN, CIN_OR_CSN);
	U11: or_2 PORT MAP (CTRL_INC2, CTRL_NOT, NOT_OR_INC2);
	NOT_NOI <= not NOT_OR_INC2;
	U12: and_2 PORT MAP (NOT_NOI, CIN_OR_CSN, CARRY);
	
	-- Full Adder
	ENABLE_ADD <= CTRL_ADD or CTRL_INC2 or CTRL_NOT or CTRL_SUB or CTRL_NEG;
	U13: eightbit_fulladder PORT MAP (OUT_A, OUT_B, CARRY, ENABLE_ADD, SUM, CARRY_OUT, OVERFLOW);
	
	-- Mac
	fourA(0) <= IN_A(0);
	fourA(1) <= IN_A(1);
	fourA(2) <= IN_A(2);
	fourA(3) <= IN_A(3);
	fourB(0) <= IN_B(0);
	fourB(1) <= IN_B(1);
	fourB(2) <= IN_B(2);
	fourB(3) <= IN_B(3);
	macmac: MAC PORT MAP (fourA, fourB, CTRL_MAC, SUM, CARRY_OUT, OVERFLOW);
											
end struct_alu_upper;
