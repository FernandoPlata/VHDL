library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

Entity Filtro is
	port(unf: in signed (7 downto 0);
		clk: in std_logic;
		y: out signed (15 downto 0));
End Filtro;

Architecture algo of Filtro is
	type array_num is array (0 to 32) of signed (7 downto 0);
	signal corri: array_num;
	constant coefs: array_num:=("11111110","11111110","11111110","11111111","00000000","11111111","11111101","11111100","11111100","11111110",--10
	"00000000","11111101","11111000","11110100","11110110","11110011","11110010","11110011","11110110","11110100","11111000","11111101","00000000",--13
	"11111100","11111100","11111110","11111101","11111111","00000000","11111111","11111110","11111110","11111110");--10
	type m is array (0 to 32) of signed (15 downto 0);
	signal mult: m;
	signal sum: signed(15 downto 0);
Begin

--constant coefs: array_num:=(X"02",X"02",X"02",X"01",X"00",X"01",X"03",X"04",X"04",X"04",--10
--	X"00",X"03",X"08",X"0C",X"10",X"13",X"14",X"13",X"10",X"0C",X"08",X"03",--13
--	X"00",X"02",X"04",X"04",X"03",X"01",X"00",X"01",X"02",X"02",X"02");--10

----0x2
--0x2  00000010 		11111110
--0x2					11111110
--0x1		00000001	11111111
--0x0					00000000
---0x1	00000001	11111111
---0x3	00000011	11111101 
---0x4	00000100	11111100
---0x4				11111100
---0x2				11111110
--0x0					00000000
--0x3					11111101
--0x8		00001000	11111000
--0xc		00001100	11110100
--0x10	00001010	11110110
--0x13	00001101	11110011
--0x14	00001110	11110010
--0x13	00001101	11110011
--0x10	00001010	11110110
--0xc					11110100
--0x8					11111000
--0x3                 11111101
--0x0					00000000
---0x2				11111110
---0x4
---0x4
---0x3
---0x1
--0x0
--0x1
--0x2
--0x2
--0x2
	corrimiento:
	process(clk)
	begin
		if rising_edge(clk) then 
			corri(0)<=unf;
			corri(1)<=corri(0);
			corri(2)<=corri(1);
			corri(3)<=corri(2);
			corri(4)<=corri(3);
			corri(5)<=corri(4);
			corri(6)<=corri(5);
			corri(7)<=corri(6);
			corri(8)<=corri(7);
			corri(9)<=corri(8);
			corri(10)<=corri(9);
			corri(11)<=corri(10);
			corri(12)<=corri(11);
			corri(13)<=corri(12);
			corri(14)<=corri(13);
			corri(15)<=corri(14);
			corri(16)<=corri(15);
			corri(17)<=corri(16);
			corri(18)<=corri(17);
			corri(19)<=corri(18);
			corri(20)<=corri(19);
			corri(21)<=corri(20);
			corri(22)<=corri(21);
			corri(23)<=corri(22);
			corri(24)<=corri(23);
			corri(25)<=corri(24);
			corri(26)<=corri(25);
			corri(27)<=corri(26);
			corri(28)<=corri(27);
			corri(29)<=corri(28);
			corri(30)<=corri(29);
			corri(31)<=corri(30);
			corri(32)<=corri(31);
			
		end if;
	end process;
	
	multiplicador:
		mult(0)<=coefs(0)*corri(0);
		mult(1)<=coefs(1)*corri(1);
		mult(2)<=coefs(2)*corri(2);
		mult(3)<=coefs(3)*corri(3);
		mult(4)<=coefs(4)*corri(4);
		mult(5)<=coefs(5)*corri(5);
		mult(6)<=coefs(6)*corri(6);
		mult(7)<=coefs(7)*corri(7);
		mult(8)<=coefs(8)*corri(8);
		mult(9)<=coefs(9)*corri(9);
		mult(10)<=coefs(10)*corri(10);
		mult(11)<=coefs(11)*corri(11);
		mult(12)<=coefs(12)*corri(12);
		mult(13)<=coefs(13)*corri(13);
		mult(14)<=coefs(14)*corri(14);
		mult(15)<=coefs(15)*corri(15);
		mult(16)<=coefs(16)*corri(16);
		mult(17)<=coefs(17)*corri(17);
		mult(18)<=coefs(18)*corri(18);
		mult(19)<=coefs(19)*corri(19);
		mult(20)<=coefs(20)*corri(20);
		mult(21)<=coefs(21)*corri(21);
		mult(22)<=coefs(22)*corri(22);
		mult(23)<=coefs(23)*corri(23);
		mult(24)<=coefs(24)*corri(24);
		mult(25)<=coefs(25)*corri(25);
		mult(26)<=coefs(26)*corri(26);
		mult(27)<=coefs(27)*corri(27);
		mult(28)<=coefs(28)*corri(28);
		mult(29)<=coefs(29)*corri(29);
		mult(30)<=coefs(30)*corri(30);
		mult(31)<=coefs(31)*corri(31);
		mult(32)<=coefs(32)*corri(32);
	sumador:
	sum<= mult(0)+mult(1)+mult(2)+mult(3)+mult(4)+mult(5)+mult(6)+mult(7)+mult(8)
	+mult(9)+mult(10)+mult(11)+mult(12)+mult(13)+mult(14)+mult(15)+mult(16)+mult(17)
	+mult(18)+mult(19)+mult(20)+mult(21)+mult(22)+mult(23)+mult(24)+mult(25)+mult(26)+mult(27)
	+mult(28)+mult(29)+mult(30)+mult(31)+mult(32);
	
	process(clk)
	begin
		if rising_edge(clk) then 
			y<=sum;
		end if;
	end process;
	
End algo;

