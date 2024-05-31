library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity div_frec24 is
	port(clk: in std_logic;
		divf: out std_logic);
end entity;

architecture clock of div_frec24 is
signal aux: integer range 0 to 24;    --A 2k: 2000*256=512000
signal auxd: std_logic;
begin
	process(clk)
	begin
		if rising_edge(clk) then 
			if (aux=23) then
				auxd<=not auxd;
				aux<=0;
			else
				aux<=aux+1;
			end if;
		end if;
	divf<=auxd;
	end process;
end architecture; 