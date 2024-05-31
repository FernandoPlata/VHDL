library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

--Este componente controla la señal di de cada iteración. Esta señal es responsable del signo de operación
--de los sumadores de cada iteración
--
--Ya que la aproximación depende de aproximar la rotacion al angulo z0 a 0: 
--z(i+1) = z(i) + di*atan(i) entonces:
--
--{di = 1 (suma) si zi < 0
--{di = -1 (resta) si xi > 0

entity controlador_signo is 
generic (bits: integer :=15);
port(
	z0: in signed (bits downto 0);
	d: out std_logic
);
end entity;

architecture algo of controlador_signo is 
begin

process (z0)
begin 
	if (z0 < 0) then 
		d <= '1';
	else 
		d <= '0';
	end if;
end process;
end algo;