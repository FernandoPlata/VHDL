library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

-- Este componente es donde se almacenan las constantes de atan(2**-i) 
-- Su tamaño depende del numero de bits
-- ai -> atan(2**-i) en binario con formato punto fijo Q0.15


entity rom_atan is
	port(
	a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15: out signed (15 downto 0));
end entity;

architecture rtl of rom_atan is
type localidades is array (0 to 15) of signed (15 downto 0);
signal a: localidades:=(
"0110010010000111",
"0011101101011000",
"0001111101011011",
"0000111111101010",
"0000011111111101",
"0000001111111111",
"0000000111111111",
"0000000011111111",
"0000000001111111",
"0000000000111111",
"0000000000011111",
"0000000000001111",
"0000000000000111",
"0000000000000011",
"0000000000000001",
"0000000000000000");
begin
	a0 <= a(0);
	a1 <= a(1);
	a2 <= a(2);
	a3 <= a(3);
	a4 <= a(4);
	a5 <= a(5);
	a6 <= a(6);
	a7 <= a(7);
	a8 <= a(8);
	a9 <= a(9);
	a10 <= a(10);
	a11 <= a(11);
	a12 <= a(12);
	a13 <= a(13);
	a14 <= a(14);
	a15 <= a(15);
end rtl;