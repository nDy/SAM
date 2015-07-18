library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;
    use ieee.std_logic_unsigned.all;
   
    entity Booth is
        port(x, y: in std_logic_vector(7 downto 0);
		  			  clk_in : in  std_logic;
				 enable_in: in std_logic;
				 enable_out: out std_logic;
             O: out std_logic_vector(15 downto 0));
    end Booth;
   
    architecture booth of Booth is
        begin
           
            process(x, y)
             variable a: std_logic_vector(16 downto 0);
             variable s,p : std_logic_vector(7 downto 0);
             variable i:integer;


                begin
					 
					 if(enable_in='1' and clk_in = '1') then
                    a := "00000000000000000";
                    s := y;
                    a(8 downto 1) := x;
                   
                    for i in 0 to 7 loop
                       if(a(1) = '1' and a(0) = '0') then
                          p := (a(16 downto 9));
                          a(16 downto 9) := (p - s);
                         
                       elsif(a(1) = '0' and a(0) = '1') then
                          p := (a(16 downto 9));
                          a(16 downto 9) := (p + s);
                         
                       end if;
                      
                       a(15 downto 0) := a(16 downto 1);
                      
                    end loop;
                   
                    O(15 downto 0) <= a(16 downto 1);
						  enable_out<='1';
					 end if;
                   enable_out<='0';
                end process;
               
            end booth;