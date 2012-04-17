----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:58:25 04/15/2012 
-- Design Name: 
-- Module Name:    xor_2 - behavioral_xor_2 
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

entity xor_2 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           F : out  STD_LOGIC);
end xor_2;

architecture behavioral_xor_2 of xor_2 is

begin

	F <= A xor B;

end behavioral_xor_2;

