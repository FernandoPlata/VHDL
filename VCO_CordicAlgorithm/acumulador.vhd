library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--Este componente es el acumulador de fase del VCO y responsable de controlar su frecuencia

-- dfase -> el cambio en la fase por ciclo de reloj 
-- clk -> señal de reloj
-- fase -> valor de fase actual (se conecta a Zin)

entity acumulador is
generic (nbits: integer := 15); 
port(
	dfase: in signed (nbits downto 0);
	clk: in std_logic;
	fase: buffer signed (nbits downto 0);
	s: out std_logic
);
end entity;

architecture algo of acumulador is
signal cont: integer range 0 to 2**(nbits+1);
begin

process (clk)
begin 
	if rising_edge(clk) then
		if cont < 2**nbits then 
			fase <= fase + dfase;
		else 
			fase <= fase - dfase;
		end if;
	end if;
end process;
end algo;
