library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity corre is
port(

	frec: in integer range 0 to 255;
	correccion: out integer range 0 to 255
);
end entity;

architecture correccion of corre is 

begin
process(frec)
begin

if frec = 0 then 
	correccion <= 0;
elsif frec = 1 then
	correccion <= 1;
elsif frec = 2 then
	correccion <= 2;
elsif frec = 3 then
	correccion <= 3;
elsif frec = 4 then
	correccion <= 4;
elsif frec = 5 then
	correccion <= 5;
elsif frec = 6 then
	correccion <= 6;
elsif frec = 6 then
	correccion <= 6;
elsif frec = 6 then
	correccion <= 6;
elsif frec = 6 then
	correccion <= 6;
	
else
	correccion <= 3;
	
end if;
end process;
end correccion;

	