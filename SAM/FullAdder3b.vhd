----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:20:21 07/16/2015 
-- Design Name: 
-- Module Name:    FullAdder8b - Behavioral 
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

entity FullAdder3b is
    Port ( x_in : in  std_logic_vector (2 downto 0);
           y_in : in  std_logic_vector (2 downto 0);
           s_out : out  std_logic_vector (2 downto 0);
           c_in : in  std_logic;
			  clk_in : in  std_logic;
			  enable_in : in  std_logic;
			  enable_out : out  std_logic;
           c_out : out  std_logic);
end FullAdder3b;

architecture Behavioral of FullAdder3b is

component FullAdder is
    Port ( clk_in : in  std_logic;
			  x_in : in  std_logic;
           y_in : in  std_logic;
           c_in : in  std_logic;
			  enable_in : in  std_logic;
			  enable_out : out  std_logic;
           s_out : out  std_logic;
           c_out : out  std_logic);
end component;

signal zero_to_one: std_logic_vector (1 downto 0);
signal one_to_two: std_logic_vector (1 downto 0);

begin

FA0: FullAdder port map(

clk_in => clk_in,
x_in => x_in(0),
y_in => y_in(0),
c_in => c_in,
s_out => s_out(0),
c_out => zero_to_one(0),
enable_in => enable_in,
enable_out => zero_to_one(1)
);

FA1: FullAdder port map(

clk_in => clk_in,
x_in => x_in(1),
y_in => y_in(1),
c_in => zero_to_one(0),
s_out => s_out(1),
c_out => one_to_two(0),
enable_in => zero_to_one(1),
enable_out => one_to_two(1)
);

FA2: FullAdder port map(

clk_in => clk_in,
x_in => x_in(2),
y_in => y_in(2),
c_in => one_to_two(0),
s_out => s_out(2),
c_out => c_out,
enable_in => one_to_two(1),
enable_out => enable_out
);

end Behavioral;

