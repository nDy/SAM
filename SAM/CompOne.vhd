----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:09:39 06/08/2015 
-- Design Name: 
-- Module Name:    CompOne - Behavioral 
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

entity CompOne is
    Port ( X_in : in  STD_LOGIC_VECTOR (7 downto 0);
           X_out : out  STD_LOGIC_VECTOR (7 downto 0));
end CompOne;

architecture Behavioral of CompOne is

begin

process (x_in)

begin

x_out(0)<= not (x_in(0));
x_out(1)<= not (x_in(1));
x_out(2)<= not (x_in(2));
x_out(3)<= not (x_in(3));
x_out(4)<= not (x_in(4));
x_out(5)<= not (x_in(5));
x_out(6)<= not (x_in(6));
x_out(7)<= not (x_in(7));


end process;

end Behavioral;

