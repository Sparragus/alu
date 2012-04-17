--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:36:20 04/15/2012
-- Design Name:   
-- Module Name:   X:/Desktop/alu/and_8_bitwise_tb.vhd
-- Project Name:  alu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: and_8_bitwise
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
 
ENTITY and_8_bitwise_tb IS
END and_8_bitwise_tb;
 
ARCHITECTURE behavior OF and_8_bitwise_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT and_8_bitwise
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         ENABLE : IN  std_logic;
         F : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal ENABLE : std_logic := '0';

 	--Outputs
   signal F : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: and_8_bitwise PORT MAP (
          A => A,
          B => B,
          ENABLE => ENABLE,
          F => F
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

		ENABLE <= '1';		
		A <= "11111111";
		B <= "10101010";
		
		wait for 100 ns;	

		ENABLE <= '1';		
		A <= "11111111";
		B <= "00000000";
		
		wait for 100 ns;	

		ENABLE <= '1';		
		A <= "11110000";
		B <= "10101010";
		 

--      wait for <clock>_period*10;

      -- insert stimulus here 

--      wait;
   end process;

END;
