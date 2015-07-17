----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:26:21 05/11/2015 
-- Design Name: 
-- Module Name:    Latch4b - Behavioral 
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

entity Latch is
    Port ( d_in : in  STD_LOGIC_VECTOR (7 downto 0);
           d_out : out  STD_LOGIC_VECTOR (7 downto 0);
           set_in : in  STD_LOGIC;
           reset_in : in  STD_LOGIC;
           clk_in : in  STD_LOGIC;
           enable_in : in  STD_LOGIC);
end Latch;

architecture Behavioral of Latch is

begin

	process(reset_in,set_in,d_in,clk_in)
	
	begin
	
	if (reset_in='1' and rising_edge(clk_in) )then 
		d_out(0)<= '0';
		d_out(1)<= '0';
		d_out(2)<= '0';
		d_out(3)<= '0';
		d_out(4)<= '0';
		d_out(5)<= '0';
		d_out(6)<= '0';
		d_out(7)<= '0';
	end if;
		
	if (enable_in='1' and set_in='1' and rising_edge(clk_in)) then
		d_out(0)<= d_in(0);
		d_out(1)<= d_in(1);
		d_out(2)<= d_in(2);
		d_out(3)<= d_in(3);	
		d_out(4)<= d_in(4);
		d_out(5)<= d_in(5);
		d_out(6)<= d_in(6);
		d_out(7)<= d_in(7);	
	end if;
	
	end process;

end Behavioral;

