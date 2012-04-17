--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:25:20 04/17/2012
-- Design Name:   
-- Module Name:   X:/s802063848/Desktop/alu/alu_lower_tb.vhd
-- Project Name:  alu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: alu_lower
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
 
ENTITY alu_lower_tb IS
END alu_lower_tb;
 
ARCHITECTURE behavior OF alu_lower_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT alu_lower
    PORT(
         IN_A : IN  std_logic_vector(7 downto 0);
         IN_B : IN  std_logic_vector(7 downto 0);
         IN_CARRY : IN  std_logic;
         CTRL_AND : IN  std_logic;
         CTRL_OR : IN  std_logic;
         CTRL_XOR : IN  std_logic;
         CTRL_RLC : IN  std_logic;
         CTRL_RRC : IN  std_logic;
         OUT_X : OUT  std_logic_vector(7 downto 0);
         OUT_CARRY : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal IN_A : std_logic_vector(7 downto 0) := (others => '0');
   signal IN_B : std_logic_vector(7 downto 0) := (others => '0');
   signal IN_CARRY : std_logic := '0';
   signal CTRL_AND : std_logic := '0';
   signal CTRL_OR : std_logic := '0';
   signal CTRL_XOR : std_logic := '0';
   signal CTRL_RLC : std_logic := '0';
   signal CTRL_RRC : std_logic := '0';

 	--Outputs
   signal OUT_X : std_logic_vector(7 downto 0);
   signal OUT_CARRY : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: alu_lower PORT MAP (
          IN_A => IN_A,
          IN_B => IN_B,
          IN_CARRY => IN_CARRY,
          CTRL_AND => CTRL_AND,
          CTRL_OR => CTRL_OR,
          CTRL_XOR => CTRL_XOR,
          CTRL_RLC => CTRL_RLC,
          CTRL_RRC => CTRL_RRC,
          OUT_X => OUT_X,
          OUT_CARRY => OUT_CARRY
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
		IN_B <= "11111000";
		IN_CARRY <= '1';
		CTRL_AND <= '0';
		CTRL_OR <= '0';
		CTRL_XOR <= '0';
		CTRL_RLC <= '1';
		CTRL_RRC <= '0';

--      wait for <clock>_period*10;

      -- insert stimulus here 

--      wait;
   end process;

END;
