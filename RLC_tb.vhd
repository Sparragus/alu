--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:17:46 04/17/2012
-- Design Name:   
-- Module Name:   X:/s802063848/Desktop/alu/RLC_tb.vhd
-- Project Name:  alu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RLC
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
 
ENTITY RLC_tb IS
END RLC_tb;
 
ARCHITECTURE behavior OF RLC_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RLC
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         E : IN  std_logic;
         Cin : IN  std_logic;
         Cout : OUT  std_logic;
         F : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal E : std_logic := '0';
   signal Cin : std_logic := '0';

 	--Outputs
   signal Cout : std_logic;
   signal F : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RLC PORT MAP (
          A => A,
          E => E,
          Cin => Cin,
          Cout => Cout,
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
		A <= "11111000";
		E <= '1';
		Cin <= '1';
		

--      wait for <clock>_period*10;

      -- insert stimulus here 

--      wait;
   end process;

END;
