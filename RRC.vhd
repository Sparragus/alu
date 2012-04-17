----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:30:12 04/15/2012 
-- Design Name: 
-- Module Name:    RRC - struct_rrc 
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

entity RRC is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           E : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
			  Cout : out STD_LOGIC;
           F : out  STD_LOGIC_VECTOR (7 downto 0));
end RRC;

architecture struct_rrc of RRC is
	
	component dflipflop_8bit is
		Port (  A : in  STD_LOGIC_VECTOR (7 downto 0);
				  E : in  STD_LOGIC;
				  Q : out  STD_LOGIC_VECTOR (7 downto 0);
				  Qneg : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	component dflipflop is
		 Port ( D : in  STD_LOGIC;
				  Clk : in  STD_LOGIC;
				  Q : out  STD_LOGIC;
				  Qneg : out STD_LOGIC);
	end component;
	
	component tri_buffer is
    Port ( Data : in  STD_LOGIC;
           Dataout : out  STD_LOGIC;
           Enable : in  STD_LOGIC);
	end component;
	
	signal Qneg_vector : STD_LOGIC_VECTOR (7 downto 0);
	signal Qneg : STD_LOGIC;
	
	signal buffer_f : STD_LOGIC_VECTOR (7 downto 0);
	signal buffer_cout : STD_LOGIC;
	
begin
	
	--Port map from input to output shifted 1 bit
	dff8bit0 : dflipflop_8bit PORT MAP (
			A(7) => Cin,
			A(6) => A(7),
			A(5) => A(6),
			A(4) => A(5),
			A(3) => A(4),
			A(2) => A(3),
			A(1) => A(2),
			A(0) => A(1),
			E => E,
			Q => buffer_f,
			Qneg => Qneg_vector

	);
	
	--Carry out
	dff : dflipflop PORT MAP (
			D => A(0),
			Clk => E,
			Q => buffer_cout,
			Qneg => Qneg
	);
	
	--Add buffers to output
	tribuff0 : tri_buffer PORT MAP (
			Data => buffer_f(0),
			Dataout => F(0),
			Enable => E
	);
	
	tribuff1 : tri_buffer PORT MAP (
			Data => buffer_f(1),
			Dataout => F(1),
			Enable => E
	);
	
	tribuff2 : tri_buffer PORT MAP (
			Data => buffer_f(2),
			Dataout => F(2),
			Enable => E
	);
	
	tribuff3 : tri_buffer PORT MAP (
			Data => buffer_f(3),
			Dataout => F(3),
			Enable => E
	);
	
	tribuff4 : tri_buffer PORT MAP (
			Data => buffer_f(4),
			Dataout => F(4),
			Enable => E
	);
	
	tribuff5 : tri_buffer PORT MAP (
			Data => buffer_f(5),
			Dataout => F(5),
			Enable => E
	);
	
	tribuff6 : tri_buffer PORT MAP (
			Data => buffer_f(6),
			Dataout => F(6),
			Enable => E
	);

	tribuff7 : tri_buffer PORT MAP (
			Data => buffer_f(7),
			Dataout => F(7),
			Enable => E
	);

	tribuffC : tri_buffer PORT MAP (
			Data => buffer_cout,
			Dataout => Cout,
			Enable => E
	);

end struct_rrc;

