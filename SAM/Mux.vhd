----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:50:14 06/08/2015 
-- Design Name: 
-- Module Name:    Mux - Behavioral 
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

entity Mux is
    Port ( c_in : in  STD_LOGIC_VECTOR (1 downto 0);
           w_in : in  STD_LOGIC_VECTOR (7 downto 0);
           x_in : in  STD_LOGIC_VECTOR (7 downto 0);
           y_in : in  STD_LOGIC_VECTOR (7 downto 0);
           z_in : in  STD_LOGIC_VECTOR (7 downto 0);
           s_out : out  STD_LOGIC_VECTOR (7 downto 0));
end Mux;

architecture Behavioral of Mux is

begin

process(c_in)

begin

if (c_in(1) = '0' and c_in(0) = '0') then

	s_out(0)<= w_in(0);
	s_out(1)<= w_in(1);
	s_out(2)<= w_in(2);
	s_out(3)<= w_in(3);
	s_out(0)<= w_in(4);
	s_out(1)<= w_in(5);
	s_out(2)<= w_in(6);
	s_out(3)<= w_in(7);

elsif (c_in(1) = '0' and c_in(0) = '1') then

	s_out(0)<= x_in(0);
	s_out(1)<= x_in(1);
	s_out(2)<= x_in(2);
	s_out(3)<= x_in(3);
	s_out(0)<= x_in(4);
	s_out(1)<= x_in(5);
	s_out(2)<= x_in(6);
	s_out(3)<= x_in(7);

elsif (c_in(1) = '1' and c_in(0) = '0') then

	s_out(0)<= y_in(0);
	s_out(1)<= y_in(1);
	s_out(2)<= y_in(2);
	s_out(3)<= y_in(3);
	s_out(0)<= y_in(4);
	s_out(1)<= y_in(5);
	s_out(2)<= y_in(6);
	s_out(3)<= y_in(7);

elsif (c_in(1) = '1' and c_in(0) = '1') then

	s_out(0)<= z_in(0);
	s_out(1)<= z_in(1);
	s_out(2)<= z_in(2);
	s_out(3)<= z_in(3);
	s_out(0)<= z_in(4);
	s_out(1)<= z_in(5);
	s_out(2)<= z_in(6);
	s_out(3)<= z_in(7);

end if;

end process;

end Behavioral;

