library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--Este componente encapsula los otros componentes y es un bloque que realiza una
--iteracion i de nbits (Si se requieren 20 bits de precision se requieren
--20 de estos bloques conectados en cascada)

--Xi -> Componente Xi (Para calcular senos y cosenos se requiere que el primer
-- valor Xin sea igual a K = 0.60725 * 2**nbits para obtener valores unitarios)
--Yi -> Componente Yi (Para calcular senos y cosenos se requiere que el primer
-- valor Yin sea igual a 0)
--Zi -> Valor del angulo Zi actual (Para inicializar se requiere que el primer
-- valor sea igual al angulo que se quiere rotar el vector
--ai -> ai -> atan(2**-i) en binario con formato punto fijo Q0.nbits
--Xo - > Componente X(i+1)
--Yo - > Componente Y(i+1)
--Zo - > Componente Z(i+1)
--clkp -> frecuencia de reloj principal

entity iteracion is 
generic(nbits: integer := 15;shift: integer := 0);
port (
	Xi, Yi, Zi, ai: in signed (nbits downto 0);  
	Xo, Yo,Zo: out signed (nbits downto 0); 
	clkp: in std_logic
);
end entity;

architecture algo of iteracion is 

signal dc: std_logic;

component sumador_vector is
generic (
right_shift: integer :=0;
bits: integer :=15);
port(
	X0,Y0: in signed (bits downto 0);
	Q0: out signed(bits downto 0);
	clk,di: in std_logic
);
end component;

component sumador_nrs is
generic (bits: integer := 15); 
port(
	X0,Y0: in signed (bits downto 0);
	Q0: out signed(bits downto 0);
	clk,di: in std_logic
);
end component;

component controlador_signo is 
generic (bits: integer :=15);
port(
	z0: in signed (bits downto 0);
	d: out std_logic
);
end component;

begin 

sumador_x: sumador_vector 
generic map (right_shift => shift, bits => nbits)
port map (
	X0 => Xi,
	Y0 => Yi,
	Q0 => Xo,
	clk => clkp,
	di => dc
);

sumador_y: sumador_vector 
generic map (bits => nbits, right_shift => shift)
port map (
	X0 => Yi,
	Y0 => Xi,
	Q0 => Yo,
	clk => clkp,
	di => not(dc)
);


sumador_z: sumador_nrs
generic map (bits => nbits)
port map (
	X0 => Zi,
	Y0 => ai,
	Q0 => Zo,
	clk => clkp,
	di => dc
);

controlador: controlador_signo 
generic map (bits => nbits)
port map(
	z0 => Zi,
	d => dc
);

end algo;


