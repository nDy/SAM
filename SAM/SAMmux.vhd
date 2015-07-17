----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:38:17 07/17/2015 
-- Design Name: 
-- Module Name:    SAMmux - Behavioral 
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

entity SAMmux is
    Port ( s_in : in  STD_LOGIC_VECTOR (2 downto 0);
			  enable_in : in  STD_LOGIC;
			  enable_out : out  STD_LOGIC;
           s_out : out  STD_LOGIC_VECTOR (7 downto 0));
end SAMmux;

architecture Behavioral of SAMmux is

begin

mux_process: process(s_in,enable_in)
begin
if (enable_in='1') then
if (s_in="000") then
s_out<="00000001";
elsif (s_in="001") then
s_out<="00000010";
elsif (s_in="010") then
s_out<="00000100";
elsif (s_in="011") then
s_out<="00001000";
elsif (s_in="100") then
s_out<="00010000";
elsif (s_in="101") then
s_out<="00100000";
elsif (s_in="110") then
s_out<="01000000";
elsif (s_in="111") then
s_out<="10000000";
end if;
enable_out<= '1';
else
enable_out<= '0';
end if;
end process;


end Behavioral;

