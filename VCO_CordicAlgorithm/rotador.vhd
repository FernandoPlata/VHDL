library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--Este componente acopla la se�al seno para que oscile ya que el algoritmo de CORDIC 
--solo converge para los angulos (-pi/2,pi/2)

-- vin -> se�al seno
-- vout -> se�al seno acoplada
-- s-> se�al que indica el estado de la fase. Esta debe ser de un reloj con periodo igual a T_oscilacion 
-- y con un desfase igual a 2*(nbits +1)*frec_clk (Depende del psoc o controlador de frecuencia)

entity rotador is
generic (nbits: integer := 15); 
port(
	vin: in signed (nbits downto 0);
	vout: out signed (nbits downto 0);
	s: in std_logic
);
end entity;

architecture algo of rotador is
begin

process(s)
begin 
	if s = '1' then
		vout <= 0 - vin;
	else 
		vout <= vin;
	end if;
end process;
end algo;