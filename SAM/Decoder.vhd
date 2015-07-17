----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:05:34 06/08/2015 
-- Design Name: 
-- Module Name:    Decoder - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Decoder is
    Port ( x_in : in  STD_LOGIC_VECTOR (1 downto 0);
           x_out : out  STD_LOGIC_VECTOR (1 downto 0));
end Decoder;

architecture Behavioral of Decoder is

begin

process(x_in)

begin

	if ((x_in(1) = '0' and x_in(0) = '0') or (x_in(1) = '1' and x_in(0) = '1') ) then

	x_out(1)<= '0';
	x_out(0)<= '0';

	else

	x_out(1)<= x_in(1);
	x_out(0)<= x_in(0);

	end if;

end process;

end Behavioral;

