library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--Este componente realiza la suma o resta de dos vectores de (bits + 1) bits: Q0 = X0 +- Y0 
--right_shift indica cuantos bits de corrimiento se aplican a Y0 
--X0 -> componente x
--Y0 -> componente y
--Q0 -> salida 
--di -> determina si se suma o se resta
--clk -> señal de reloj

entity sumador_vector is 
generic (
right_shift: integer :=0;
bits: integer :=15);
port(
	X0,Y0: in signed (bits downto 0);
	Q0: out signed(bits downto 0);
	clk,di: in std_logic
);
end entity;

architecture comportamiento of sumador_vector is
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
	Q <= X + shift_right(Y,right_shift);
else
	Q <= X - shift_right(Y,right_shift);
end if;
end process;

process (clk)
begin 
	if rising_edge(clk) then
		Q0 <= Q;
	end if;
end process;
end comportamiento;