----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:30:03 07/17/2015 
-- Design Name: 
-- Module Name:    UDOchip - Behavioral 
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

entity UDOchip is
    Port ( s_in : in  STD_LOGIC_VECTOR (7 downto 0);
			  enable_in : in  STD_LOGIC;
			  enable_out : out  STD_LOGIC;
           s_out : out  STD_LOGIC_VECTOR (2 downto 0));
end UDOchip;

architecture Behavioral of UDOchip is

signal op1: STD_LOGIC_VECTOR (2 downto 0):= "001";
signal op2: STD_LOGIC_VECTOR (2 downto 0):= "001";
signal op3: STD_LOGIC_VECTOR (2 downto 0):= "001";
signal op4: STD_LOGIC_VECTOR (2 downto 0):= "100";
signal op5: STD_LOGIC_VECTOR (2 downto 0):= "001";
signal op6: STD_LOGIC_VECTOR (2 downto 0):= "001";
signal op7: STD_LOGIC_VECTOR (2 downto 0):= "100";
signal op8: STD_LOGIC_VECTOR (2 downto 0):= "001";

begin

translate: process(s_in,enable_in)
begin
if(enable_in='1') then
if (s_in="00000001") then
s_out <= op1;
elsif (s_in="00000010") then
s_out <= op2;
elsif (s_in="00000100") then
s_out <= op3;
elsif (s_in="00001000") then
s_out <= op4;
elsif (s_in="00010000") then
s_out <= op5;
elsif (s_in="00100000") then
s_out <= op6;
elsif (s_in="01000000") then
s_out <= op7;
elsif (s_in="10000000") then
s_out <= op8;
end if;
enable_out<= '1';
else
enable_out<= '0';
end if;
end process;

end Behavioral;

