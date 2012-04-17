--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:14:34 04/16/2012
-- Design Name:   
-- Module Name:   X:/Desktop/alu/alu_tb.vhd
-- Project Name:  alu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: alu
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY alu_tb IS
END alu_tb;
 
ARCHITECTURE behavior OF alu_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT alu
    PORT(
         IN_A : IN  std_logic_vector(7 downto 0);
         IN_B : IN  std_logic_vector(7 downto 0);
         CTRL_AND : IN  std_logic;
         CTRL_OR : IN  std_logic;
         CTRL_XOR : IN  std_logic;
         CTRL_ADDC : IN  std_logic;
         CTRL_SUB : IN  std_logic;
         CTRL_MAC : IN  std_logic;
         CTRL_NEG : IN  std_logic;
         CTRL_NOT : IN  std_logic;
         CTRL_RLC : IN  std_logic;
         CTRL_RRC : IN  std_logic;
         CTRL_INC2 : IN  std_logic;
         ACARREO : IN  std_logic;
         OUT_X : OUT  std_logic_vector(7 downto 0);
         FLAG_C : OUT  std_logic;
         FLAG_V : OUT  std_logic;
         FLAG_N : OUT  std_logic;
         FLAG_Z : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal IN_A : std_logic_vector(7 downto 0) := (others => '0');
   signal IN_B : std_logic_vector(7 downto 0) := (others => '0');
   signal CTRL_AND : std_logic := '0';
   signal CTRL_OR : std_logic := '0';
   signal CTRL_XOR : std_logic := '0';
   signal CTRL_ADDC : std_logic := '0';
   signal CTRL_SUB : std_logic := '0';
   signal CTRL_MAC : std_logic := '0';
   signal CTRL_NEG : std_logic := '0';
   signal CTRL_NOT : std_logic := '0';
   signal CTRL_RLC : std_logic := '0';
   signal CTRL_RRC : std_logic := '0';
   signal CTRL_INC2 : std_logic := '0';
   signal ACARREO : std_logic := '0';

 	--Outputs
   signal OUT_X : std_logic_vector(7 downto 0);
   signal FLAG_C : std_logic;
   signal FLAG_V : std_logic;
   signal FLAG_N : std_logic;
   signal FLAG_Z : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: alu PORT MAP (
          IN_A => IN_A,
          IN_B => IN_B,
          CTRL_AND => CTRL_AND,
          CTRL_OR => CTRL_OR,
          CTRL_XOR => CTRL_XOR,
          CTRL_ADDC => CTRL_ADDC,
          CTRL_SUB => CTRL_SUB,
          CTRL_MAC => CTRL_MAC,
          CTRL_NEG => CTRL_NEG,
          CTRL_NOT => CTRL_NOT,
          CTRL_RLC => CTRL_RLC,
          CTRL_RRC => CTRL_RRC,
          CTRL_INC2 => CTRL_INC2,
          ACARREO => ACARREO,
          OUT_X => OUT_X,
          FLAG_C => FLAG_C,
          FLAG_V => FLAG_V,
          FLAG_N => FLAG_N,
          FLAG_Z => FLAG_Z
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	
      -- AND.
		wait for 50 ns;	
		IN_A <= "11111111";
		IN_B <= "11110000";
		CTRL_AND <= '1';
		CTRL_OR <= '0';
		CTRL_XOR <= '0';
		CTRL_ADDC <= '0';
		CTRL_SUB <= '0';
		CTRL_MAC <= '0';
		CTRL_NEG <= '0';
		CTRL_NOT <= '0';
		CTRL_RLC <= '0';
		CTRL_RRC <= '0';
		CTRL_INC2 <= '0';
		ACARREO <= '0';
		
      -- OR.
		wait for 50 ns;	
		IN_A <= "11110000";
		IN_B <= "00001111";
		CTRL_AND <= '0';
		CTRL_OR <= '1';
		CTRL_XOR <= '0';
		CTRL_ADDC <= '0';
		CTRL_SUB <= '0';
		CTRL_MAC <= '0';
		CTRL_NEG <= '0';
		CTRL_NOT <= '0';
		CTRL_RLC <= '0';
		CTRL_RRC <= '0';
		CTRL_INC2 <= '0';
		ACARREO <= '0';	
		
      -- XOR.
		wait for 50 ns;	
		IN_A <= "11111111";
		IN_B <= "11110000";
		CTRL_AND <= '0';
		CTRL_OR <= '0';
		CTRL_XOR <= '1';
		CTRL_ADDC <= '0';
		CTRL_SUB <= '0';
		CTRL_MAC <= '0';
		CTRL_NEG <= '0';
		CTRL_NOT <= '0';
		CTRL_RLC <= '0';
		CTRL_RRC <= '0';
		CTRL_INC2 <= '0';
		ACARREO <= '0';	
		
      -- ADDC (causes carry)
		wait for 50 ns;	
		IN_A <= "11111111";
		IN_B <= "00000001";
		CTRL_AND <= '0';
		CTRL_OR <= '0';
		CTRL_XOR <= '0';
		CTRL_ADDC <= '1';
		CTRL_SUB <= '0';
		CTRL_MAC <= '0';
		CTRL_NEG <= '0';
		CTRL_NOT <= '0';
		CTRL_RLC <= '0';
		CTRL_RRC <= '0';
		CTRL_INC2 <= '0';
		ACARREO <= '0';	
		
      -- ADDC (causes overflow)
		wait for 50 ns;	
		IN_A <= "01111111";
		IN_B <= "00000001";
		CTRL_AND <= '0';
		CTRL_OR <= '0';
		CTRL_XOR <= '0';
		CTRL_ADDC <= '1';
		CTRL_SUB <= '0';
		CTRL_MAC <= '0';
		CTRL_NEG <= '0';
		CTRL_NOT <= '0';
		CTRL_RLC <= '0';
		CTRL_RRC <= '0';
		CTRL_INC2 <= '0';
		ACARREO <= '0';	
		
      -- ADDC (nothing special)
		wait for 50 ns;	
		IN_A <= "00000011";
		IN_B <= "00000001";
		CTRL_AND <= '0';
		CTRL_OR <= '0';
		CTRL_XOR <= '0';
		CTRL_ADDC <= '1';
		CTRL_SUB <= '0';
		CTRL_MAC <= '0';
		CTRL_NEG <= '0';
		CTRL_NOT <= '0';
		CTRL_RLC <= '0';
		CTRL_RRC <= '0';
		CTRL_INC2 <= '0';
		ACARREO <= '0';	
		
      -- ADDC (nothing special with acarreo)
		wait for 50 ns;	
		IN_A <= "00000011";
		IN_B <= "00000001";
		CTRL_AND <= '0';
		CTRL_OR <= '0';
		CTRL_XOR <= '0';
		CTRL_ADDC <= '1';
		CTRL_SUB <= '0';
		CTRL_MAC <= '0';
		CTRL_NEG <= '0';
		CTRL_NOT <= '0';
		CTRL_RLC <= '0';
		CTRL_RRC <= '0';
		CTRL_INC2 <= '0';
		ACARREO <= '1';	
		
      -- SUB.
		wait for 50 ns;	
		IN_A <= "01111111";
		IN_B <= "00000111";
		CTRL_AND <= '0';
		CTRL_OR <= '0';
		CTRL_XOR <= '0';
		CTRL_ADDC <= '0';
		CTRL_SUB <= '1';
		CTRL_MAC <= '0';
		CTRL_NEG <= '0';
		CTRL_NOT <= '0';
		CTRL_RLC <= '0';
		CTRL_RRC <= '0';
		CTRL_INC2 <= '0';
		ACARREO <= '0';	
			 
    -- MAC.
--      wait for 50 ns;	
--          IN_A <= "00000000";
--          IN_B <= "10101010";
--          CTRL_AND <= '0';
--          CTRL_OR <= '0';
--          CTRL_XOR <= '0';
--          CTRL_ADDC <= '0';
--          CTRL_SUB <= '0';
--          CTRL_MAC <= '1';
--          CTRL_NEG <= '0';
--          CTRL_NOT <= '0';
--          CTRL_RLC <= '0';
--          CTRL_RRC <= '0';
--          CTRL_INC2 <= '0';
--          ACARREO <= '1';	
			 
    -- NEG.
      wait for 50 ns;	
          IN_A <= "00000000";
          IN_B <= "00000011";
          CTRL_AND <= '0';
          CTRL_OR <= '0';
          CTRL_XOR <= '0';
          CTRL_ADDC <= '0';
          CTRL_SUB <= '0';
          CTRL_MAC <= '0';
          CTRL_NEG <= '1';
          CTRL_NOT <= '0';
          CTRL_RLC <= '0';
          CTRL_RRC <= '0';
          CTRL_INC2 <= '0';
          ACARREO <= '0';	
			 
    -- NOT.
      wait for 50 ns;	
          IN_A <= "00000000";
          IN_B <= "00000011";
          CTRL_AND <= '0';
          CTRL_OR <= '0';
          CTRL_XOR <= '0';
          CTRL_ADDC <= '0';
          CTRL_SUB <= '0';
          CTRL_MAC <= '0';
          CTRL_NEG <= '0';
          CTRL_NOT <= '1';
          CTRL_RLC <= '0';
          CTRL_RRC <= '0';
          CTRL_INC2 <= '0';
          ACARREO <= '0';
			 
    -- RLC.
      wait for 50 ns;	
          IN_A <= "00000000";
          IN_B <= "11111000";
          CTRL_AND <= '0';
          CTRL_OR <= '0';
          CTRL_XOR <= '0';
          CTRL_ADDC <= '0';
          CTRL_SUB <= '0';
          CTRL_MAC <= '0';
          CTRL_NEG <= '0';
          CTRL_NOT <= '0';
          CTRL_RLC <= '1';
          CTRL_RRC <= '0';
          CTRL_INC2 <= '0';
          ACARREO <= '1';
			 
    -- RRC.
      wait for 50 ns;	
          IN_A <= "00000000";
          IN_B <= "00011111";
          CTRL_AND <= '0';
          CTRL_OR <= '0';
          CTRL_XOR <= '0';
          CTRL_ADDC <= '0';
          CTRL_SUB <= '0';
          CTRL_MAC <= '0';
          CTRL_NEG <= '0';
          CTRL_NOT <= '0';
          CTRL_RLC <= '0';
          CTRL_RRC <= '1';
          CTRL_INC2 <= '0';
          ACARREO <= '1';
			 
    -- INC2.
      wait for 50 ns;	
          IN_A <= "00000000";
          IN_B <= "00001101";
          CTRL_AND <= '0';
          CTRL_OR <= '0';
          CTRL_XOR <= '0';
          CTRL_ADDC <= '0';
          CTRL_SUB <= '0';
          CTRL_MAC <= '0';
          CTRL_NEG <= '0';
          CTRL_NOT <= '0';
          CTRL_RLC <= '0';
          CTRL_RRC <= '0';
          CTRL_INC2 <= '1';
          ACARREO <= '0';
			 
			 
			 
--      wait for <clock>_period*10;

--      -- insert stimulus here 

--      wait;
   end process;

END;
