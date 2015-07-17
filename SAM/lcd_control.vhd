----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:28:00 07/13/2015 
-- Design Name: 
-- Module Name:    lcd_control - Behavioral 
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
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity lcd_control is
   port (
       rst                : in STD_LOGIC;
       clk                : in STD_LOGIC;
       control                : out std_logic_vector (2 downto 0); -- LCD_RS, LCD_RW, LCD_E
       sf_d                : out STD_LOGIC_VECTOR (7 downto 0)); --LCD data bus
end lcd_control;

architecture lcd_control_arch of lcd_control is
type state_type is (waiting, init1,init2,init3,init4,init5,init6,init7,
                            shift1,shift2,shift3,shift4,shift5,shift6,shift7,shift8,shift9,
                            win_lose1,win_lose2,win_lose3,win_lose4,win_lose5,donestate);
signal state,next_state  : state_type;
signal sf_d_temp              : std_logic_vector (7 downto 0) := "00000000";
signal state_flag                     : std_logic := '0';
signal count, count_temp: integer := 0;
signal win_loss: std_logic_vector (1 downto 0) := "00";

constant TIME1 : integer := 750000;
constant TIME2 : integer := 1;
constant TIME3 : integer := 210000;
constant TIME4 : integer := 420000;
begin

run : process (state,clk,count) is
begin
    case state is     
        -- Initialization Starts --------------------------------
        when waiting =>
            sf_d_temp <= "00000000";
            control <= "000";                                 -- RS, RW, E         
            if     (count >= TIME1) then
                    next_state <= init1;      state_flag <= '1'; 
            else    next_state <= waiting; state_flag <= '0';
            end if;
        when init1 =>
            sf_d_temp <= "00111100";    --Function set DL = 8bit, NL = 2, Font = 5x11
            if     (count = TIME4) then
                    next_state <= init2;    control <= "001"; state_flag <= '1';
            elsif (count > TIME2 AND count <= TIME4) then
                    next_state <= init1; control <= "000"; state_flag <= '0'; 
            else    next_state <= init1; control <= "001"; state_flag <= '0';
            end if;
        when init2 =>
            sf_d_temp <= "00111100";    --Function set DL = 8bit, NL = 2, Font = 5x11
            if     (count = TIME4) then
                    next_state <= init3;    control <= "001"; state_flag <= '1';
            elsif (count > TIME2 AND count <= TIME4) then
                    next_state <= init2; control <= "000"; state_flag <= '0'; 
            else  next_state <= init2; control <= "001"; state_flag <= '0';
            end if;
        when init3 =>
            sf_d_temp <= "00111100";     --Function set DL = 8bit, NL = 2, Font = 5x11
            if     (count = TIME4) then
                    next_state <= init4;    control <= "001"; state_flag <= '1';
            elsif (count > TIME2 AND count <= TIME4) then
                    next_state <= init3; control <= "000"; state_flag <= '0'; 
            else    next_state <= init3; control <= "001"; state_flag <= '0';
            end if;
        when init4 =>
            sf_d_temp <= "00111100";     --Function set DL = 8bit, NL = 2, Font = 5x11
            if     (count = TIME3) then
                    next_state <= init5;    control <= "001"; state_flag <= '1';
            elsif (count > TIME2 AND count <= TIME3) then
                    next_state <= init4; control <= "000"; state_flag <= '0'; 
            else    next_state <= init4; control <= "001"; state_flag <= '0';
            end if;
        when init5 =>
            sf_d_temp <= "00001100";     --Set Display Display=on, Cursor=off, cursor_position=off
            if     (count = TIME3) then
                    next_state <= init6; control <= "001"; state_flag <= '1';
            elsif (count > TIME2 AND count <= TIME3) then
                    next_state <= init5; control <= "000"; state_flag <= '0'; 
            else    next_state <= init5; control <= "001"; state_flag <= '0';
            end if;
        when init6 =>
            sf_d_temp <= "00000001";     --Clear Display
            if     (count = TIME3) then
                    next_state <= init7; control <= "001"; state_flag <= '1';
            elsif (count > TIME2 AND count <= TIME3) then
                    next_state <= init6; control <= "000"; state_flag <= '0'; 
            else    next_state <= init6; control <= "001"; state_flag <= '0';
            end if;
        when init7 =>
            sf_d_temp <= "00000110";     --Entry Mode set ID=1, S=0
            if     (count = TIME3) then
                    next_state <= shift1; control <= "001"; state_flag <= '1';
            elsif (count > TIME2 AND count <= TIME3) then
                    next_state <= init7; control <= "000"; state_flag <= '0'; 
            else    next_state <= init7; control <= "001"; state_flag <= '0';
            end if;
---------------------- Initialization Ends -----------------------------------


-------------------------Write out 'Shift Register:'-----------------------
        when shift1 =>
            sf_d_temp <= "10000000"; -- Set Address hx00     
            if     (count = TIME3) then
                    next_state <= shift2; control <= "001"; state_flag <= '1';
            elsif (count > TIME2 AND count <= TIME3) then
                    next_state <= shift1; control <= "000"; state_flag <= '0'; 
            else    next_state <= shift1; control <= "001"; state_flag <= '0';
            end if;
		  when shift2 =>
            sf_d_temp <= "10000000"; -- Set Address hx00     
            if     (count = TIME3) then
                    next_state <= shift2; control <= "001"; state_flag <= '1';
            elsif (count > TIME2 AND count <= TIME3) then
                    next_state <= shift1; control <= "000"; state_flag <= '0'; 
            else    next_state <= shift1; control <= "001"; state_flag <= '0';
            end if;
			when shift3 =>
            sf_d_temp <= "10000000"; -- Set Address hx00     
            if     (count = TIME3) then
                    next_state <= shift2; control <= "001"; state_flag <= '1';
            elsif (count > TIME2 AND count <= TIME3) then
                    next_state <= shift1; control <= "000"; state_flag <= '0'; 
            else    next_state <= shift1; control <= "001"; state_flag <= '0';
            end if;
			when shift4 =>
            sf_d_temp <= "10000000"; -- Set Address hx00     
            if     (count = TIME3) then
                    next_state <= shift2; control <= "001"; state_flag <= '1';
            elsif (count > TIME2 AND count <= TIME3) then
                    next_state <= shift1; control <= "000"; state_flag <= '0'; 
            else    next_state <= shift1; control <= "001"; state_flag <= '0';
            end if;
			when shift5 =>
            sf_d_temp <= "10000000"; -- Set Address hx00     
            if     (count = TIME3) then
                    next_state <= shift2; control <= "001"; state_flag <= '1';
            elsif (count > TIME2 AND count <= TIME3) then
                    next_state <= shift1; control <= "000"; state_flag <= '0'; 
            else    next_state <= shift1; control <= "001"; state_flag <= '0';
            end if;
			when shift6 =>
            sf_d_temp <= "10000000"; -- Set Address hx00     
            if     (count = TIME3) then
                    next_state <= shift2; control <= "001"; state_flag <= '1';
            elsif (count > TIME2 AND count <= TIME3) then
                    next_state <= shift1; control <= "000"; state_flag <= '0'; 
            else    next_state <= shift1; control <= "001"; state_flag <= '0';
            end if;
			when shift7 =>
            sf_d_temp <= "10000000"; -- Set Address hx00     
            if     (count = TIME3) then
                    next_state <= shift2; control <= "001"; state_flag <= '1';
            elsif (count > TIME2 AND count <= TIME3) then
                    next_state <= shift1; control <= "000"; state_flag <= '0'; 
            else    next_state <= shift1; control <= "001"; state_flag <= '0';
            end if;
			when shift8 =>
            sf_d_temp <= "10000000"; -- Set Address hx00     
            if     (count = TIME3) then
                    next_state <= shift2; control <= "001"; state_flag <= '1';
            elsif (count > TIME2 AND count <= TIME3) then
                    next_state <= shift1; control <= "000"; state_flag <= '0'; 
            else    next_state <= shift1; control <= "001"; state_flag <= '0';
            end if;
			when shift9 =>
            sf_d_temp <= "10000000"; -- Set Address hx00     
            if     (count = TIME3) then
                    next_state <= shift2; control <= "001"; state_flag <= '1';
            elsif (count > TIME2 AND count <= TIME3) then
                    next_state <= shift1; control <= "000"; state_flag <= '0'; 
            else    next_state <= shift1; control <= "001"; state_flag <= '0';
            end if;
				
			when win_lose1 =>
            sf_d_temp <= "10000000"; -- Set Address hx00     
            if     (count = TIME3) then
                    next_state <= shift2; control <= "001"; state_flag <= '1';
            elsif (count > TIME2 AND count <= TIME3) then
                    next_state <= shift1; control <= "000"; state_flag <= '0'; 
            else    next_state <= shift1; control <= "001"; state_flag <= '0';
            end if;

        when donestate =>
            control <= "100";               
            sf_d_temp <= "00000000";
            if     (count = TIME3) then
                    next_state <= donestate; state_flag <= '1';
            else    next_state <= donestate; state_flag <= '0';
            end if;
    end case;
end process run;

       

       
timing : process (rst, clk, count) is
begin
    if    (rising_edge(clk)) then
        sf_d <= sf_d_temp;
        count <= count_temp;
        if (rst = '1') then
            state <= waiting;
            count_temp <= 0;
        elsif (state_flag = '1') then
             state <= next_state;
            count_temp <= 0;
        else
            state <= next_state;
            count_temp <= count_temp + 1;
        end if;
    end if;
end process timing;

end lcd_control_arch; 

