library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sumador_vector is 
port(
	X0,Y0,P0: in signed (9 downto 0);
	Q0: out signal(9 downto 0);
	clk: in std_logic
);
end entity;

architecture comportamiento of sumador-vector is
signal X,Y,P: signed (9 downto 0);
begin
process (clk)
begin
	if rising_edge(clk) then 
		X <= X0;
		Y <= Y0;
		P <= P0;
	end if
	Q0 <= X + Y - P;
end process;
end comportamiento;
		