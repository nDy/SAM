----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:39:42 06/08/2015 
-- Design Name: 
-- Module Name:    Shifter - Behavioral 
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

entity Shifter is
    Port ( clk_in : in  STD_LOGIC;
           enable_in : in  STD_LOGIC;
           x_in : in  STD_LOGIC;
           x_out : inout  STD_LOGIC_VECTOR (7 downto 0);
           shift_in : in  STD_LOGIC);
end Shifter;

architecture Behavioral of Shifter is
		
begin

process(enable_in,clk_in,x_in)

begin

	if(enable_in = '1' and rising_edge(clk_in)) then
		x_out(7)<= x_out(6);
		x_out(6)<= x_out(5);
		x_out(5)<= x_out(4);
		x_out(4)<= x_out(3);
		x_out(3)<= x_out(2);
		x_out(2)<= x_out(1);
		x_out(1)<= x_in;
	end if;

end process;

end Behavioral;

