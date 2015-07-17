----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:04:18 07/16/2015 
-- Design Name: 
-- Module Name:    SAM - Data_Flow 
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

entity SAM is
    Port ( clk_in : in  std_logic;
			  overflow_out : out  std_logic;
           led_out : out  std_logic_vector (7 downto 0);
           lcd_e_out : out  std_logic;
           lcd_rs_out : out  std_logic;
           lcd_rw_out : out  std_logic;
           sf_ce0_out : out  std_logic;
           sf_d_out : out  std_logic_vector (3 downto 0));
end SAM;

architecture Behavioral of SAM is

function reverse_any_vector (a: in std_logic_vector)
return std_logic_vector is
  variable result: std_logic_vector(a'RANGE);
  alias aa: std_logic_vector(a'REVERSE_RANGE) is a;
begin
  for i in aa'RANGE loop
    result(i) := aa(i);
  end loop;
  return result;
end;

component lcd is
	port(
		clk, reset : in std_logic;
		SF_D : out std_logic_vector(3 downto 0);
		SF_I : in std_logic_vector(7 downto 0);
		LCD_E, LCD_RS, LCD_RW, SF_CE0 : out std_logic;
		LED : out std_logic_vector(7 downto 0) );
end component;

component ALU is
    Port ( clk_in : in  STD_LOGIC;
			  enable_in : in  STD_LOGIC;
           selector_in : in  STD_LOGIC_VECTOR (2 downto 0);
           x_in : in  STD_LOGIC_VECTOR (7 downto 0);
           y_in : in  STD_LOGIC_VECTOR (7 downto 0);
           s_out : out  STD_LOGIC_VECTOR (7 downto 0);
			  enable_out : out  STD_LOGIC;
			  overflow_out : out  STD_LOGIC);
			  
end component;

component UDOchip is
    Port ( s_in : in  STD_LOGIC_VECTOR (7 downto 0);
			  enable_in : in  STD_LOGIC;
			  enable_out : out  STD_LOGIC;
           s_out : out  STD_LOGIC_VECTOR (2 downto 0));
end component;

component SAMmux is
    Port ( s_in : in  STD_LOGIC_VECTOR (2 downto 0);
			  enable_in : in  STD_LOGIC;
			  enable_out : out  STD_LOGIC;
           s_out : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component Counter is
    Port ( clk_in : in  STD_LOGIC;
           enable_in : in  STD_LOGIC;
			  enable_out : out  STD_LOGIC;
           s_out : out  STD_LOGIC_VECTOR (2 downto 0));
end component;

signal databus: std_logic_vector(7 downto 0):= "00000000";

signal seed: std_logic_vector(7 downto 0):= "00000001";

signal display_enabler: std_logic;

signal alu_enabler: std_logic:='0';

signal mux_enabler: std_logic:='0';

signal udo_enabler: std_logic:='0';

signal counter_enabler: std_logic:='0';

signal udo_to_alu: STD_LOGIC_VECTOR (2 downto 0);

signal SAMmux_to_udo: STD_LOGIC_VECTOR (7 downto 0);

signal count_to_SAMmux: STD_LOGIC_VECTOR (2 downto 0);

signal timer : integer range 0 to 75000000 := 0;

begin



lcd0: lcd port map(

clk => clk_in,
reset => display_enabler,
SF_I => reverse_any_vector (databus),

LED => led_out,
LCD_E => lcd_e_out,
LCD_RS => lcd_rs_out,
LCD_RW => lcd_rw_out,
SF_CE0 => sf_ce0_out,
SF_D => sf_d_out

);

ALU_unit: ALU port map(

clk_in => clk_in,
enable_in => alu_enabler,
x_in => databus,
y_in => seed,
selector_in => udo_to_alu,
enable_out => display_enabler,
s_out => databus,
overflow_out=> overflow_out

);

user_defined_operations: UDOchip port map(
s_in=> SAMmux_to_udo,
s_out=> udo_to_alu,
enable_in => udo_enabler,
enable_out => alu_enabler
);

counter_mux: SAMmux port map(
s_in=> count_to_SamMux,
s_out=> SAMmux_to_udo,
enable_in => mux_enabler,
enable_out => udo_enabler
);

SAM_counter: Counter port map(
clk_in=> clk_in,
enable_in => counter_enabler,
enable_out => mux_enabler,
s_out=> count_to_SAMmux
);

control_loop: process (clk_in)
begin

if rising_edge(clk_in) then
	if(timer = 75000000) then
		counter_enabler <= '1';
		timer<= 0;
	else
		counter_enabler <= '0';
		timer <= timer + 1;
	end if;

end if;

end process;

end Behavioral;