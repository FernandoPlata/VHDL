library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

Entity cont is
	port(clk: in std_logic;
		count: out integer range 0 to 127);
End cont;

Architecture algo of cont is
	signal cuenta: integer range 0 to 127;
begin
	process(clk)
	begin
		if rising_edge(clk) then 
			if (cuenta=127) then 
				count<=0;
				cuenta<=0;
			else
				cuenta<=cuenta+1;
				count<=cuenta;
			end if;
		end if;
	end process;
End algo;