library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity PasaBajas is 
port( x: in signed (7 downto 0);
	clk: in std_logic;
	y: out signed (15 downto 0));
end PasaBajas;

architecture algo of PasaBajas is 
type arreglo is array (0 to 12) of signed (7 downto 0);
constant coef: arreglo := (x"00",
x"0f",
x"00",
x"19",
x"00",
x"4d",
x"79",
x"4d",
x"00",
x"19",
x"00",
x"0f",
x"00"); 
signal delay: arreglo;

type m is array (0 to 12) of signed (15 downto 0);
signal mult: m;
signal sum: signed (15 downto 0);

begin 
registro:
process (clk)
begin 
	if rising_edge(clk) then 
		delay(0) <= x;
		delay(1) <= delay(0);
		delay(2) <= delay(1);
		delay(3) <= delay(2);
		delay(4) <= delay(3);
		delay(5) <= delay(4);
		delay(6) <= delay(5);
		delay(7) <= delay(6);
		delay(8) <= delay(7);
		delay(9) <= delay(8);
		delay(10) <= delay(9);
		delay(11) <= delay(10);
		delay(12) <= delay(11);
	end if;
end process;

multiplicador:

	mult(0) <= coef(0)* delay(0);
	mult(1) <= coef(1)* delay(1);
	mult(2) <= coef(2)* delay(2);
	mult(3) <= coef(3)* delay(3);
	mult(4) <= coef(4)* delay(4);
	mult(5) <= coef(5)* delay(5);
	mult(6) <= coef(6)* delay(6);
	mult(7) <= coef(7)* delay(7);
	mult(8) <= coef(8)* delay(8);
	mult(9) <= coef(9)* delay(9);
	mult(10) <= coef(10)* delay(10);
	mult(11) <= coef(11)* delay(11);
	mult(12) <= coef(12)* delay(12);


	sumador:
	sum <= mult(0) + mult(1) + mult(2) + mult(3) + mult(4) + mult(5) + mult(6) + 
	mult(7) + mult(8) + mult(9) + mult(10) + mult(11) + mult(12);

process (clk)
begin
	if rising_edge(clk) then
		y <= sum;
	end if;
end process;
end algo;