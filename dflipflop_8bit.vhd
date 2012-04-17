----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:04:05 04/15/2012 
-- Design Name: 
-- Module Name:    dflipflop_8bit - Behavioral 
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

entity dflipflop_8bit is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           E : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (7 downto 0);
           Qneg : out  STD_LOGIC_VECTOR (7 downto 0));
end dflipflop_8bit;

architecture Behavioral of dflipflop_8bit is

	component dflipflop is
		 Port ( D : in  STD_LOGIC;
				  Clk : in  STD_LOGIC;
				  Q : out  STD_LOGIC;
				  Qneg : out STD_LOGIC);
	end component;

begin
	
	fp0 : dflipflop PORT MAP (
			D => A(0),
			Clk => E,
			Q => Q(0),
			Qneg => Qneg(0)
	);
	
	fp1 : dflipflop PORT MAP (
			D => A(1),
			Clk => E,
			Q => Q(1),
			Qneg => Qneg(1)
	);
	
	fp2 : dflipflop PORT MAP (
			D => A(2),
			Clk => E,
			Q => Q(2),
			Qneg => Qneg(2)
	);
	
	fp3 : dflipflop PORT MAP (
			D => A(3),
			Clk => E,
			Q => Q(3),
			Qneg => Qneg(3)
	);
	
	fp4 : dflipflop PORT MAP (
			D => A(4),
			Clk => E,
			Q => Q(4),
			Qneg => Qneg(4)
	);
	
	fp5 : dflipflop PORT MAP (
			D => A(5),
			Clk => E,
			Q => Q(5),
			Qneg => Qneg(5)
	);
	
	fp6 : dflipflop PORT MAP (
			D => A(6),
			Clk => E,
			Q => Q(6),
			Qneg => Qneg(6)
	);
	
	fp7 : dflipflop PORT MAP (
			D => A(7),
			Clk => E,
			Q => Q(7),
			Qneg => Qneg(7)
	);

end Behavioral;

