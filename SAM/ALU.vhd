----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:45:39 07/16/2015 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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

entity ALU is
    Port ( clk_in : in  STD_LOGIC;
			  enable_in : in  STD_LOGIC;
           selector_in : in  STD_LOGIC_VECTOR (2 downto 0);
           x_in : in  STD_LOGIC_VECTOR (7 downto 0);
           y_in : in  STD_LOGIC_VECTOR (7 downto 0);
           s_out : out  STD_LOGIC_VECTOR (7 downto 0);
			  enable_out : out  STD_LOGIC;
			  overflow_out : out  STD_LOGIC);
			  
end ALU;

architecture Behavioral of ALU is

component ALUmux is
    Port ( s_in : in  STD_LOGIC;
           x_in : in  STD_LOGIC_VECTOR (7 downto 0);
           y_in : in  STD_LOGIC_VECTOR (7 downto 0);
           s_out : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component Comp1 is
    Port ( s_in : in  STD_LOGIC_VECTOR (7 downto 0);
           s_out : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component FullAdder8b is
    Port ( x_in : in  std_logic_vector (7 downto 0);
           y_in : in  std_logic_vector (7 downto 0);
           s_out : out  std_logic_vector (7 downto 0);
           c_in : in  std_logic;
			  clk_in : in  std_logic;
			  enable_in : in  std_logic;
			  enable_out : out  std_logic;
           c_out : out  std_logic);
end component;

component Selector is
Port ( 
	 clk_in : in STD_LOGIC;
	 s_in : in  STD_LOGIC_VECTOR (2 downto 0);
	 a_in : in  STD_LOGIC_VECTOR (7 downto 0);
	 b_in : in  STD_LOGIC_VECTOR (7 downto 0);
	 c_in : in  STD_LOGIC_VECTOR (7 downto 0);
	 enable_in : in STD_LOGIC;
	 enable_out : out STD_LOGIC;
	 s_out : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

signal comp_to_mux: STD_LOGIC_VECTOR (7 downto 0);
signal mux_to_fa: STD_LOGIC_VECTOR (7 downto 0);
signal add_to_sel: STD_LOGIC;
signal sub_to_sel: STD_LOGIC;
signal mult_to_sel: STD_LOGIC:='0';
signal add_data_to_sel: STD_LOGIC_VECTOR (7 downto 0);
signal sub_data_to_sel: STD_LOGIC_VECTOR (7 downto 0);
signal mult_data_to_sel: STD_LOGIC_VECTOR (7 downto 0):="00000000";

begin

mux: ALUmux port map (

s_in => selector_in(1),
x_in => y_in,
y_in => comp_to_mux,
s_out => mux_to_fa

);

comp: Comp1 port map (
s_in=>y_in,
s_out=> comp_to_mux
);

add: FullAdder8b port map(

clk_in => clk_in,
enable_in => selector_in(0),
x_in => x_in,
y_in => y_in,
c_in => '0',
c_out => open,
s_out => add_data_to_sel,
enable_out => add_to_sel
);

sub: FullAdder8b port map(

clk_in => clk_in,
enable_in => selector_in(1),
x_in => x_in,
y_in => mux_to_fa,
c_in => selector_in(1),
c_out => open,
s_out => sub_data_to_sel,
enable_out => sub_to_sel
);

ALU_selector: Selector port map(

clk_in => clk_in,
s_in=>selector_in,
a_in=>add_data_to_sel,
b_in=>sub_data_to_sel,
c_in=>mult_data_to_sel,
enable_in=> enable_in,
enable_out=> enable_out,
s_out=> s_out
);

end Behavioral;

