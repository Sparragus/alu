--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:54:03 04/16/2012
-- Design Name:   
-- Module Name:   X:/Desktop/alu/alu_upper_tb.vhd
-- Project Name:  alu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: alu_upper
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
 
ENTITY alu_upper_tb IS
END alu_upper_tb;
 
ARCHITECTURE behavior OF alu_upper_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT alu_upper
    PORT(
         IN_A : IN  std_logic_vector(7 downto 0);
         IN_B : IN  std_logic_vector(7 downto 0);
         CARRY_IN : IN  std_logic;
         CTRL_ADD : IN  std_logic;
         CTRL_SUB : IN  std_logic;
         CTRL_INC2 : IN  std_logic;
         CTRL_NOT : IN  std_logic;
         CTRL_NEG : IN  std_logic;
         SUM : OUT  std_logic_vector(7 downto 0);
         CARRY_OUT : OUT  std_logic;
         OVERFLOW : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal IN_A : std_logic_vector(7 downto 0) := (others => '0');
   signal IN_B : std_logic_vector(7 downto 0) := (others => '0');
   signal CARRY_IN : std_logic := '0';
   signal CTRL_ADD : std_logic := '0';
   signal CTRL_SUB : std_logic := '0';
   signal CTRL_INC2 : std_logic := '0';
   signal CTRL_NOT : std_logic := '0';
   signal CTRL_NEG : std_logic := '0';

 	--Outputs
   signal SUM : std_logic_vector(7 downto 0);
   signal CARRY_OUT : std_logic;
   signal OVERFLOW : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: alu_upper PORT MAP (
          IN_A => IN_A,
          IN_B => IN_B,
          CARRY_IN => CARRY_IN,
          CTRL_ADD => CTRL_ADD,
          CTRL_SUB => CTRL_SUB,
          CTRL_INC2 => CTRL_INC2,
          CTRL_NOT => CTRL_NOT,
          CTRL_NEG => CTRL_NEG,
          SUM => SUM,
          CARRY_OUT => CARRY_OUT,
          OVERFLOW => OVERFLOW
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
   IN_A <= "00000000";
   IN_B <= "00000011";
   CARRY_IN <= '1';
   CTRL_ADD <= '0';
   CTRL_SUB <= '1';
   CTRL_INC2 <= '0';
   CTRL_NOT <= '0';
   CTRL_NEG <= '0';
--      wait for <clock>_period*10;

      -- insert stimulus here 

--      wait;
   end process;

END;
