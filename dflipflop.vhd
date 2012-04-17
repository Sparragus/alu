----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:16:44 04/15/2012 
-- Design Name: 
-- Module Name:    dflipflop - struct_d_flipflop 
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

entity dflipflop is
    Port ( D : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Q : out  STD_LOGIC;
			  Qneg : out STD_LOGIC);
end dflipflop;

architecture struct_dflipflop of dflipflop is

	signal nand1_out : STD_LOGIC;
	signal nand2_out : STD_LOGIC;
	signal feedback_q : STD_LOGIC;
	signal feedback_not_q : STD_LOGIC;
	
begin
	
	nand1_out <= D nand Clk;
	nand2_out <= Clk nand nand1_out;
	feedback_q <= nand1_out nand feedback_not_q;
	feedback_not_q <= feedback_q nand nand2_out;
	Q <= feedback_q;
	Qneg <= feedback_not_q;
	
end struct_dflipflop;

