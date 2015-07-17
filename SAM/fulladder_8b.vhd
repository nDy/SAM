----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:22:06 07/12/2015 
-- Design Name: 
-- Module Name:    fulladder_8b - data_flow 
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

entity fulladder_8b is
    Port ( A_in : in  STD_LOGIC_VECTOR (3 downto 0);
           B_in : in  STD_LOGIC_VECTOR (3 downto 0);
           C_in : in  STD_LOGIC;
           S_out : out  STD_LOGIC_VECTOR (3 downto 0);
           C_out : out  STD_LOGIC);
end fulladder_8b;

architecture data_flow of fulladder_8b is

component fulladder
    Port ( A_in : in  STD_LOGIC;
           B_in : in  STD_LOGIC;
           C_in : in  STD_LOGIC;
           S_out : out  STD_LOGIC;
           C_out : out  STD_LOGIC);
end component;

signal c0 : std_logic;
signal c1 : std_logic;
signal c2 : std_logic;
signal c3 : std_logic;



begin

fa0 : fulladder port map(

A_in => A_in(0),

B_in => B_in(0),

C_in => '0',

S_out => S_out(0),

C_out => c0

);

fa1 : fulladder port map(

A_in => A_in(1),

B_in => B_in(1),

C_in => c0,

S_out => S_out(1),

C_out => c1

);

fa2 : fulladder port map(

A_in => A_in(2),

B_in => B_in(2),

C_in => c1,

S_out => S_out(2),

C_out => c2

);

fa3 : fulladder port map(

A_in => A_in(3),

B_in => B_in(3),

C_in => c2,

S_out => S_out(3),

C_out => C_out

);

end data_flow;

