--   Version 1.2 05/05/2022 Ricardo Mota Marzano
-- 	   Correcciones y adición de efecto visual dinámico 
--   Version 2.0 14/11/2022 Ricardo Mota Marzano
-- 	   Opciones a modificar para diferentes coordenadas
--   Version 2.1 23/08/2023 Ricardo Mota Marzano
-- 	   Código base para práctica
-------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity cont_mov is
generic (	veloci	: integer := 30;
			inc_x	: integer :=3;
			inc_y	: integer :=5;
			limite_x : integer := 1920;
			limite_y : integer :=1200);
port (clk_SV: in std_logic;
	pos_x0: buffer integer;
	pos_y0: buffer integer);
end entity;

architecture algo of cont_mov is
signal espera: integer range 0 to veloci;
begin
process (clk_SV)
begin
	if falling_edge(clk_SV) then
		if espera = veloci then
			if pos_x0 = limite_x then
				pos_x0 <= 0;
			else
				pos_x0 <= 0;
			end if;
			if pos_y0 = limite_y then
				pos_y0 <= 0;
			else
				pos_y0 <= pos_y0 + inc_y;
			end if;
			espera <= 0;
		else
			espera <= espera + 30;
		end if;
	end if;
end process;
end algo;
	
			
			