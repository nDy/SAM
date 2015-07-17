----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:46:47 07/16/2015 
-- Design Name: 
-- Module Name:    Comp1 - Behavioral 
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

entity Comp1 is
    Port ( s_in : in  STD_LOGIC_VECTOR (7 downto 0);
           s_out : out  STD_LOGIC_VECTOR (7 downto 0));
end Comp1;

architecture Behavioral of Comp1 is

begin

s_out(0) <= not(s_in(0));
s_out(1) <= not(s_in(1));
s_out(2) <= not(s_in(2));
s_out(3) <= not(s_in(3));
s_out(4) <= not(s_in(4));
s_out(5) <= not(s_in(5));
s_out(6) <= not(s_in(6));
s_out(7) <= not(s_in(7));


end Behavioral;

