----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:34:00 07/17/2015 
-- Design Name: 
-- Module Name:    Selector - Behavioral 
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

entity Selector is
    Port ( 
	 clk_in : in STD_LOGIC;
	 s_in : in  STD_LOGIC_VECTOR (2 downto 0);
	 a_in : in  STD_LOGIC_VECTOR (7 downto 0);
	 b_in : in  STD_LOGIC_VECTOR (7 downto 0);
	 c_in : in  STD_LOGIC_VECTOR (7 downto 0);
	 enable_in : in STD_LOGIC;
	 enable_out : out STD_LOGIC;
	 s_out : out  STD_LOGIC_VECTOR (7 downto 0));
end Selector;

architecture Behavioral of Selector is

begin

selection: process(a_in,b_in,c_in,clk_in)
begin

if rising_edge(clk_in) then
	if(enable_in='1') then
		if(s_in="001") then
			--suma
			s_out<=a_in;
		elsif(s_in="010") then
			--resta
			s_out<=b_in;
		elsif(s_in="100") then
			--mult
			s_out<=c_in;
		end if;
		enable_out<= '1';
	else
		enable_out<= '0';
	end if;
end if;
end process;

end Behavioral;

