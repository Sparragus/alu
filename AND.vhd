----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:08:25 04/15/2012 
-- Design Name: 
-- Module Name:    AND - Behavioral 
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

entity AND is
    Port ( AND_IN_A : in  STD_LOGIC_VECTOR (7 downto 0);
           AND_IN_B : in  STD_LOGIC_VECTOR (7 downto 0);
           AND_OUT : out  STD_LOGIC_VECTOR (7 downto 0);
           AND_ENABLE : in  STD_LOGIC);
end AND;

architecture Behavioral of AND is

begin


end Behavioral;

