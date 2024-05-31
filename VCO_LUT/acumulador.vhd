library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Este bloque es el dedicado a acumular la fase

--clk: Es la señal de reloj
--frec: Es la entrada del ADC en binario
--strobe: Es la señal de salida para controlar el reloj del DAC
--phase: Es el valor de la fase el cual depende del ADC

entity acumulador is
port(
	clk: in std_logic;
	frec: in integer range 0 to 255;
	phase: buffer integer range 0 to 255;
	strobe: out std_logic
);
end entity;

architecture comport of acumulador is
signal cont: integer range 0 to 100000;
signal mota: std_logic;
type mem is array (0 to 255) of integer range 0 to 100000;
signal cuentaf: mem:=(93750, 46875, 31250, 23437, 18750, 15625, 13392, 11718, 10416, 9375, 8522, 7812, 7211, 6696, 6250, 5859, 5514, 5208, 4934, 4687, 4464, 4261, 4076, 3906, 3750, 3605, 3472, 3348, 3232, 3125, 3024, 2929, 2840, 2757, 2678, 2604, 2533, 2467, 2403, 2343, 2286, 2232, 2180, 2130, 2083, 2038, 1994, 1953, 1913, 1875, 1838, 1802, 1768, 1736, 1704, 1674, 1644, 1616, 1588, 1562, 1536, 1512, 1488, 1464, 1442, 1420, 1399, 1378, 1358, 1339, 1320, 1302, 1284, 1266, 1250, 1233, 1217, 1201, 1186, 1171, 1157, 1143, 1129, 1116, 1102, 1090, 1077, 1065, 1053, 1041, 1030, 1019, 1008, 997, 986, 976, 966, 956, 946, 937, 928, 919, 910, 901, 892, 884, 876, 868, 860, 852, 844, 837, 829, 822, 815, 808, 801, 794, 787, 781, 774, 768, 762, 756, 750, 744, 738, 732, 726, 721, 715, 710, 704, 699, 694, 689, 684, 679, 674, 669, 664, 660, 655, 651, 646, 642, 637, 633, 629, 625, 620, 616, 612, 608, 604, 600, 597, 593, 589, 585, 582, 578, 575, 571, 568, 564, 561, 558, 554, 551, 548, 545, 541, 538, 535, 532, 529, 526, 523, 520, 517, 515, 512, 509, 506, 504, 501, 498, 496, 493, 490, 488, 485, 483, 480, 478, 475, 473, 471, 468, 466, 464, 461, 459, 457, 455, 452, 450, 448, 446, 444, 442, 440, 438, 436, 434, 432, 430, 428, 426, 424, 422, 420, 418, 416, 414, 412, 411, 409, 407, 405, 404, 402, 400, 398, 397, 395, 393, 392, 390, 389, 387, 385, 384, 382, 381, 379, 378, 376, 375, 373, 372, 370, 369, 367, 366);
begin
process (clk)
begin 
	if rising_edge(clk) then
		if cont >= cuentaf(frec) then 
			cont <= 0;
			phase <= phase + 1;
			mota <= not(mota);
		else 
			cont <= cont + 1;
		end if;
	end if;
end process;
strobe <= mota;
end comport;		
		



