----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:48:44 07/12/2015 
-- Design Name: 
-- Module Name:    multiplier_8b - data_flow 
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

entity multiplier_8b is
    Port ( mpn_in : in  STD_LOGIC_VECTOR (7 downto 0);
           mpr_in : in  STD_LOGIC_VECTOR (7 downto 0);
           prd_out : in  STD_LOGIC_VECTOR (7 downto 0));
end multiplier_8b;

architecture data_flow of multiplier_8b is

component latch 
	 Port ( d_in : in  STD_LOGIC_VECTOR (7 downto 0);
           d_out : out  STD_LOGIC_VECTOR (7 downto 0);
           set_in : in  STD_LOGIC;
           reset_in : in  STD_LOGIC;
           clk_in : in  STD_LOGIC;
           enable_in : in  STD_LOGIC);
end component;

component fulladder_8b
    Port ( A_in : in  STD_LOGIC_VECTOR (7 downto 0);
           B_in : in  STD_LOGIC_VECTOR (7 downto 0);
           C_in : in  STD_LOGIC;
           S_out : out  STD_LOGIC_VECTOR (7 downto 0);
           C_out : out  STD_LOGIC);
end component;

component CompOne
    Port ( X_in : in  STD_LOGIC_VECTOR (7 downto 0);
           X_out : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component Decoder
    Port ( x_in : in  STD_LOGIC_VECTOR (1 downto 0);
           x_out : out  STD_LOGIC_VECTOR (1 downto 0));
end component;

component Mux
     Port ( c_in : in  STD_LOGIC_VECTOR (1 downto 0);
           w_in : in  STD_LOGIC_VECTOR (7 downto 0);
           x_in : in  STD_LOGIC_VECTOR (7 downto 0);
           y_in : in  STD_LOGIC_VECTOR (7 downto 0);
           z_in : in  STD_LOGIC_VECTOR (7 downto 0);
           s_out : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component Shifter
    Port ( clk_in : in  STD_LOGIC;
           enable_in : in  STD_LOGIC;
           x_in : in  STD_LOGIC;
           x_out : inout  STD_LOGIC_VECTOR (7 downto 0);
           shift_in : in  STD_LOGIC);
end component;

signal main_to_mpn : std_logic_vector (7 downto 0);
signal main_to_comp : std_logic_vector (7 downto 0);
signal comp_to_mpnc : std_logic_vector (7 downto 0);
signal mpn_to_mux : std_logic_vector (7 downto 0);
signal mpnc_to_mux : std_logic_vector (7 downto 0);
signal mux_to_fa : std_logic_vector (7 downto 0);
signal c2 : std_logic;
signal c3 : std_logic;
signal c4 : std_logic;
signal c5 : std_logic;
signal c6 : std_logic;

begin

latch_mpn : latch port map ( 
d_in => main_to_mpn,
d_out => mpn_to_mux,
set_in => ,
reset_in => ,
clk_in => ,
enable_in =>  
);

latch_mpnC : latch port map ( 
d_in => comp_to_mpnc,
d_out => mpnc_to_mux,
set_in => ,
reset_in => ,
clk_in => ,
enable_in =>  
);

fa8b : fulladder_8b port map(

A_in => muxtofa,
B_in => ,
C_in => ,
S_out => ,
C_out => 
);

shft : Shifter port map(
clk_in => ,
enable_in => ,
x_in => , 
x_out => ,
shift_in => 
);

mux4to1 : Mux port map (
c_in => ,
w_in => ,
x_in => ,
y_in => ,
z_in => ,
s_out => 
);

dec : Decoder port map (
x_in => ,
x_out =>
);

comp : compOne port map (
X_in => main_to_comp,
X_out => comp_to_mux
);
end data_flow;

