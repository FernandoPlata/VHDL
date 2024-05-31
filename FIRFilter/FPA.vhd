library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FPA is
	port ( x: in integer range 255 downto 0;
		clk: in std_logic;
		y: out signed (15 downto 0));
end entity;
---0xFAE8
---0xFFFB
--0x71b
--0x8e8
--0x5
---0xEE37
---0xDC65
--0x54f0

architecture HPF_STRUCT_BEHAVE of FPA is
	type coef is array( 0 to 14) of signed (7 downto 0);
	type del is array(0 to 14) of integer range 255 downto 0;
	constant coef1:coef := (x"f6",x"00",x"0e",x"11",x"00",x"DD",x"B9",x"A9",x"B9",x"DD",x"00",x"11",x"0E",x"00",x"F6");
	type m is array( 0 to 14) of signed (15 downto 0);
	signal mult: m;
	signal delay : del;
	signal suma: signed(15 downto 0);

	begin 
		process(clk)
		begin
			if rising_edge(clk) then
				delay(0)<=x;
				delay(1)<=delay(0);
				delay(2)<=delay(1);
				delay(3)<=delay(2);
				delay(4)<=delay(3);
				delay(5)<=delay(4);
				delay(6)<=delay(5);
				delay(7)<=delay(6);
				delay(8)<=delay(7);
				delay(9)<=delay(8);
				delay(10)<=delay(9);
				delay(11)<=delay(10);
				delay(12)<=delay(11);
				delay(13)<=delay(12);
				delay(14)<=delay(13);
				y<=suma;
			end if;
	end process;
	
	multiplicador:
	mult(0)<=coef1(0)*delay(0);
	mult(1)<=coef1(1)*delay(1);
	mult(2)<=coef1(2)*delay(2);
	mult(3)<=coef1(3)*delay(3);
	mult(4)<=coef1(4)*delay(4);
	mult(5)<=coef1(5)*delay(5);
	mult(6)<=coef1(6)*delay(6);
	mult(7)<=coef1(7)*delay(7);
	mult(8)<=coef1(8)*delay(8);
	mult(9)<=coef1(9)*delay(9);
	mult(10)<=coef1(10)*delay(10);
	mult(11)<=coef1(11)*delay(11);
	mult(12)<=coef1(12)*delay(12);
	mult(13)<=coef1(13)*delay(13);
	mult(14)<=coef1(14)*delay(14);
	
	sumador:
	suma<=mult(0)+mult(1)+mult(2)+mult(3)+mult(4)+mult(5)+mult(6)+mult(7)+mult(8)+mult(9)+mult(10)+mult(11)+mult(12)+mult(13)+mult(14);
	
end architecture;
			