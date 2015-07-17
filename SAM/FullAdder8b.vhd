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

entity FullAdder8b is
    Port ( x_in : in  std_logic_vector (7 downto 0);
           y_in : in  std_logic_vector (7 downto 0);
           s_out : out  std_logic_vector (7 downto 0);
           c_in : in  std_logic;
			  clk_in : in  std_logic;
			  enable_in : in  std_logic;
			  enable_out : out  std_logic;
           c_out : out  std_logic);
end FullAdder8b;

architecture Behavioral of FullAdder8b is

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
signal two_to_three: std_logic_vector (1 downto 0);
signal three_to_four: std_logic_vector (1 downto 0);
signal four_to_five: std_logic_vector (1 downto 0);
signal five_to_six: std_logic_vector (1 downto 0);
signal six_to_seven: std_logic_vector (1 downto 0);

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
c_out => two_to_three(0),
enable_in => one_to_two(1),
enable_out => two_to_three(1)
);

FA3: FullAdder port map(

clk_in => clk_in,
x_in => x_in(3),
y_in => y_in(3),
c_in => two_to_three(0),
s_out => s_out(3),
c_out => three_to_four(0),
enable_in => two_to_three(1),
enable_out => three_to_four(1)

);

FA4: FullAdder port map(

clk_in => clk_in,
x_in => x_in(4),
y_in => y_in(4),
c_in => three_to_four(0),
s_out => s_out(4),
c_out => four_to_five(0),
enable_in => three_to_four(1),
enable_out => four_to_five(1)

);

FA5: FullAdder port map(

clk_in => clk_in,
x_in => x_in(5),
y_in => y_in(5),
c_in => four_to_five(0),
s_out => s_out(5),
c_out => five_to_six(0),
enable_in => four_to_five(1),
enable_out => five_to_six(1)

);

FA6: FullAdder port map(

clk_in => clk_in,
x_in => x_in(6),
y_in => y_in(6),
c_in => five_to_six(0),
s_out => s_out(6),
c_out => six_to_seven(0),
enable_in => five_to_six(1),
enable_out => six_to_seven(1)

);

FA7: FullAdder port map(

clk_in => clk_in,
x_in => x_in(7),
y_in => y_in(7),
c_in => six_to_seven(0),
s_out => s_out(7),
c_out => c_out,
enable_in => six_to_seven(1),
enable_out => enable_out
);

end Behavioral;

