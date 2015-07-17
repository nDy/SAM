----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:03:13 07/17/2015 
-- Design Name: 
-- Module Name:    Counter - Behavioral 
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

entity Counter is
    Port ( clk_in : in  STD_LOGIC;
           enable_in : in  STD_LOGIC;
			  enable_out : out  STD_LOGIC;
           s_out : out  STD_LOGIC_VECTOR (2 downto 0));
end Counter;

architecture Behavioral of Counter is

component FullAdder3b is
    Port ( x_in : in  std_logic_vector (2 downto 0);
           y_in : in  std_logic_vector (2 downto 0);
           s_out : out  std_logic_vector (2 downto 0);
           c_in : in  std_logic;
			  clk_in : in  std_logic;
			  enable_in : in  std_logic;
			  enable_out : out  std_logic;
           c_out : out  std_logic);
end component;

signal databus: std_logic_vector(2 downto 0):= "111";

begin

FA: FullAdder3b port map(

clk_in => clk_in,
enable_in => enable_in,
x_in => databus,
y_in => "001",
c_in => '0',
c_out => open,
s_out => databus,
enable_out => enable_out

);

s_out <= databus;

end Behavioral;

