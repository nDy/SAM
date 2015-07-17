----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:14:57 07/16/2015 
-- Design Name: 
-- Module Name:    FullAdder - Data_Flow 
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

entity FullAdder is
    Port ( clk_in : in  std_logic;
			  x_in : in  std_logic;
           y_in : in  std_logic;
           c_in : in  std_logic;
			  enable_in : in  std_logic;
			  enable_out : out  std_logic;
           s_out : out  std_logic;
           c_out : out  std_logic);
end FullAdder;

architecture Behavioral of FullAdder is

begin

update: process (clk_in,enable_in)
begin

if rising_edge(clk_in) then
	if (enable_in = '1') then
	s_out <= (x_in xor y_in) xor c_in;
	c_out <= ((x_in xor y_in) and c_in) or (x_in and y_in);
	enable_out <= '1';
	else
	enable_out <= '0';
	end if;
end if;

end process;

end Behavioral;

