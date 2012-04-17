----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:35:06 04/14/2012 
-- Design Name: 
-- Module Name:    tri_buffer - behavioral_tri_buffer 
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

entity tri_buffer is
    Port ( Data : in  STD_LOGIC;
           Dataout : out  STD_LOGIC;
           Enable : in  STD_LOGIC);
end tri_buffer;

architecture behavioral_tri_buffer of tri_buffer is

begin

	Dataout <= Data WHEN Enable='1' ELSE 'Z';

end behavioral_tri_buffer;

