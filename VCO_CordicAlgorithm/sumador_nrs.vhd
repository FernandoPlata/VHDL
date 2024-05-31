library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--Este componente realiza la suma o resta de dos vectores de (bits + 1) bits: Q0 = X0 +- Y0 
--A diferencia de sumador_vector no hay corrimiento y es unicamente utilizado para sumar Z(i+1) = z(i) +- atan(2**-i)
--X0 -> componente x (zi)
--Y0 -> componente y	(ai)
--Q0 -> salida (z(i+1))
--di -> determina si se suma o se resta
--clk -> señal de reloj

entity sumador_nrs is
generic (bits: integer := 15); 
port(
	X0,Y0: in signed (bits downto 0);
	Q0: out signed(bits downto 0);
	clk,di: in std_logic
);
end entity;

architecture comportamiento of sumador_nrs is
signal X,Y,Q: signed (bits downto 0);
begin
process (clk)
begin
	if rising_edge(clk) then 
		X <= X0;
		Y <= Y0;
	end if;
end process;

process (di)
begin
if di = '1' then
	Q <= X + Y;
else
	Q <= X - Y;
end if;
end process;

process (clk)
begin 
	if rising_edge(clk) then
		Q0 <= Q;
	end if;
end process;
end comportamiento;