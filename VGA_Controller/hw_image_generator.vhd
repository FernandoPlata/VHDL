--------------------------------------------------------------------------------
--
--   FileName:         hw_image_generator.vhd
--   Dependencies:     none
--   Design Software:  Quartus II 9.1
--
--   HDL CODE IS PROVIDED "AS IS."  DIGI-KEY EXPRESSLY DISCLAIMS ANY
--   WARRANTY OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING BUT NOT
--   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
--   PARTICULAR PURPOSE, OR NON-INFRINGEMENT. IN NO EVENT SHALL DIGI-KEY
--   BE LIABLE FOR ANY INCIDENTAL, SPECIAL, INDIRECT OR CONSEQUENTIAL
--   DAMAGES, LOST PROFITS OR LOST DATA, HARM TO YOUR EQUIPMENT, COST OF
--   PROCUREMENT OF SUBSTITUTE GOODS, TECHNOLOGY OR SERVICES, ANY CLAIMS
--   BY THIRD PARTIES (INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF),
--   ANY CLAIMS FOR INDEMNITY OR CONTRIBUTION, OR OTHER SIMILAR COSTS.
--
--   Version History
--   Version 1.0 05/10/2013 Scott Larson
--     Initial Public Release
--   Version 1.2 05/05/2022 Ricardo Mota Marzano
-- 	   Correcciones y adición de efecto visual dinámico 
--   Version 2.0 14/11/2022 Ricardo Mota Marzano
-- 	   Opciones a modificar para diferentes coordenadas
--   Version 2.1 23/08/2023 Ricardo Mota Marzano
-- 	   Código base para práctica
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY hw_image_generator IS
--	GENERIC(
--		--pixels_y1 	:	INTEGER := 800;    		--row that first color will persist until
--		--pixels_x1		:	INTEGER := 600;
--		pixels_y0 	:	INTEGER := 1920;    		--row that first color will persist until
--		pixels_x0	:	INTEGER := 1200);   		--column that first color will persist until
	PORT(
		pixels_y0	: INTEGER;
		pixels_x0	: INTEGER;
		b1, b2      : in std_logic;
		disp_ena	:	IN		STD_LOGIC;		--display enable ('1' = display time, '0' = blanking time)
		row			:	IN		INTEGER;		--row pixel coordinate
		column		:	IN		INTEGER;		--column pixel coordinate
		red			:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');  	--red magnitude output to DAC
		green		:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');  	--green magnitude output to DAC
		blue		:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0')); 	--blue magnitude output to DAC
END hw_image_generator;

ARCHITECTURE behavior OF hw_image_generator IS
signal pixels_y1, pixels_x1: integer;
BEGIN
	pixels_y1 <= pixels_y0 + 300;
	pixels_x1 <= pixels_x0 + 200;
	
	PROCESS(disp_ena, row, column)
	BEGIN
		IF(disp_ena = '1') THEN					--display time
			IF(pixels_y0 < row) and (row < pixels_y1) AND (pixels_x0 < column) and (column < pixels_x1) THEN
				red <= (OTHERS => '0');
				green	<= (OTHERS => b1);
				blue <= (OTHERS => '1');
			ELSE
				red <= (OTHERS => '0');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => b2);
			END IF;
		ELSE									--blanking time
			red <= (OTHERS => '0');
			green <= (OTHERS => '0');
			blue <= (OTHERS => '0');
		END IF;
	
	END PROCESS;
END behavior;