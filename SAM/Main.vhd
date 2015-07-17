----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:33:27 06/23/2014 
-- Design Name: 
-- Module Name:    Main - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Main is
	GENERIC(Num_Hex_Digits: integer := 2);
	
	PORT(reset            : in std_logic; 
		  LED    			 : out std_logic;
		  Clock_50  		 : in std_logic;
		  LCD_RS           : out std_logic;
		  LCD_E            : out std_logic;
		  LCD_RW 			 : out std_logic;
--		  LCD_ON 			 : out std_logic;
--		  LCD_BLON 			 : out std_logic;
		  sf_ce0           : out std_logic;
		  DATA_BUS 			 : inout std_logic_vector(7 downto 0));

end Main;

architecture Behavioral of Main is
	type character_string is array (0 to 31) of std_logic_vector(7 downto 0);
	type state_type is (HOLD, FUNC_SET, DISPLAY_ON, MODE_SET, PRINT_STRING, LINE2, RETURN_HOME, DROP_LCD_E, RESET1, RESET2, RESET3, DISPLAY_OFF, DISPLAY_CLEAR);
	
	signal state                     : state_type; 
	signal next_command              : state_type;
	signal LCD_display_string        : character_string;
	signal DATA_BUS_VALUE				: std_logic_vector(7 downto 0);
	signal Next_Char 						: std_logic_vector(7 downto 0);
	signal CLK_COUNT_400Hz 				: std_logic_vector(19 downto 0);
	signal CHAR_COUNT    				: std_logic_vector(4 downto 0);
	signal CLK_400Hz_enable				: std_logic;
	signal LCD_RW_INT						: std_logic := '0';
	signal Hex_Display_Data 			: std_logic_vector((Num_Hex_Digits*4)-1 downto 0) := X"32";
--	signal Hex_Display_Data 			: std_logic_vector((Num_Hex_Digits*4)-1 downto 0); --:= "00000000";
--	signal Hex_Display_Data 			: std_logic_vector((Num_Hex_Digits*4)-1 downto 0):= "00000000";
	
begin

	sf_ce0 <= '1';


	LCD_display_string <= (
			--line 1          
			X"43", X"6F", X"75", X"6E", X"74", X"3D", X"0" & Hex_Display_Data(7 downto 4), X"0" & Hex_Display_Data(3 downto 0), X"20", X"20", X"20", X"20", X"20", X"20", X"20", X"20",

			--line 2 
			X"44", X"45", X"32", X"20", X"20", X"20", X"20", X"20", X"20", X"20", X"20", X"20", X"20", X"20", X"20", X"20");
			
	DATA_BUS <= DATA_BUS_VALUE when LCD_RW_INT = '0' else "ZZZZZZZZ";
	Next_Char <= LCD_display_string(conv_integer(CHAR_COUNT));
	LCD_RW <= LCD_RW_INT;
	
process
begin
	wait until Clock_50'event and Clock_50 = '1';
		if reset = '0' then
			CLK_COUNT_400Hz <= X"00000";
			CLK_400Hz_enable <= '0';
		else
			if CLK_COUNT_400Hz < X"0F424" then
				CLK_COUNT_400Hz <= CLK_COUNT_400Hz + 1;
				CLK_400Hz_enable <= '0';
			else
				CLK_COUNT_400Hz <= X"00000";
				CLK_400Hz_enable <= '1';
			end if;
		end if;
end process;


process(Clock_50, reset)
begin
if reset = '0' then
	state <= RESET1;
	DATA_BUS_VALUE <= X"38";
	next_command <= RESET2;
	LCD_E <= '1';
	LCD_RS <= '0';
	LCD_RW_INT <= '0';
elsif Clock_50'event and Clock_50 = '1' then
	if CLK_400Hz_enable = '1' then
		case state is
			
			when RESET1 =>
				LCD_E <= '1';
				LCD_RS <= '0';
				LCD_RW_INT <= '0';
				DATA_BUS_VALUE <= X"38";
				state <= DROP_LCD_E;
				next_command <= RESET2;
				CHAR_COUNT <= "00000";
				
			when RESET2 =>
				LCD_E <= '1';
				LCD_RS <= '0';
				LCD_RW_INT <= '0';
				DATA_BUS_VALUE <= X"38";
				state <= DROP_LCD_E;
				next_command <= RESET3;
			
			when RESET3 =>
				LCD_E <= '1';
				LCD_RS <= '0';
				LCD_RW_INT <= '0';
				DATA_BUS_VALUE <= X"38";
				state <= DROP_LCD_E;
				next_command <= FUNC_SET;
				
			when FUNC_SET =>
				LCD_E <= '1';
				LCD_RS <= '0';
				LCD_RW_INT <= '0';
				DATA_BUS_VALUE <= X"38";
				state <= DROP_LCD_E;
				next_command <= DISPLAY_OFF;
				
			when DISPLAY_OFF =>
				LCD_E <= '1';
				LCD_RS <= '0';
				LCD_RW_INT <= '0';
				DATA_BUS_VALUE <= X"08";
				state <= DROP_LCD_E;
				next_command <= DISPLAY_CLEAR;
				
			when DISPLAY_CLEAR =>
				LCD_E <= '1';
				LCD_RS <= '0';
				LCD_RW_INT <= '0';
				DATA_BUS_VALUE <= X"01";
				state <= DROP_LCD_E;
				next_command <= DISPLAY_ON;
				
			when DISPLAY_ON =>
				LCD_E <= '1';
				LCD_RS <= '0';
				LCD_RW_INT <= '0';
				DATA_BUS_VALUE <= X"0c";
				state <= DROP_LCD_E;
				next_command <= MODE_SET;
			
			when MODE_SET =>
				LCD_E <= '1';
				LCD_RS <= '0';
				LCD_RW_INT <= '0';
				DATA_BUS_VALUE <= X"06";
				state <= DROP_LCD_E;
				next_command <= Print_String;
				
			when Print_String =>
				state <= DROP_LCD_E;
				LCD_E <= '1';
				LCD_RS <= '1';
				LCD_RW_INT <= '0';
				if Next_Char(7 downto 4) /= X"0" then
					DATA_BUS_VALUE <= Next_char;
				else
					if Next_Char(3 downto 0) > 9 then
						DATA_BUS_VALUE <= X"4" & (Next_Char(3 downto 0) - 9);
					else
						DATA_BUS_VALUE <= X"3" & Next_Char(3 downto 0);
					end if;
				end if;
				
				if (CHAR_COUNT < 31) and (Next_Char /= X"FE") then
					CHAR_COUNT <= CHAR_COUNT + 1;
				else
					CHAR_COUNT <= "00000";
				end if;
				
				if CHAR_COUNT = 15 then 
					next_command <= LINE2;
				elsif (CHAR_COUNT = 31) or (Next_Char = X"FE") then
					next_command <= return_home;
				else
					next_command <= Print_String;
				end if;
				
				
			when LINE2 =>
				LCD_E <= '1';
				LCD_RS <= '0';
				LCD_RW_INT <= '0';
				DATA_BUS_VALUE <= X"c0";
				state <= DROP_LCD_E;
				next_command <= Print_String;
				
			when RETURN_HOME =>
				LCD_E <= '1';
				LCD_RS <= '0';
				LCD_RW_INT <= '0';
				DATA_BUS_VALUE <= X"80";
				state <= DROP_LCD_E;
				next_command <= Print_String;
				
			when DROP_LCD_E =>
				LCD_E <= '0';
				state <= HOLD;
				
			when HOLD =>
				state <= next_command;
			
			end case;
		end if;
	end if;
end process;

LED <= reset;

end Behavioral;


