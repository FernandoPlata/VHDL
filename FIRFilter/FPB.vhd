library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FPB is
	port (clk : in std_logic;
		  unfiltered : in signed(7 downto 0);
		  filtered : out signed(15 downto 0));
end entity;

---0x5
---0x2
--0x6
--0x5
---0x6
---0xc
--0x7
--0x29
--0x3b
--0x29
--0x7
---0xc
---0x6
--0x5
--0x6
---0x2
---0x5

architecture algo of FPB is
	type array_s8b is array (0 to 18) of signed(7 downto 0);
	signal filter_shift : array_s8b;
	constant filter_coeff : array_s8b := (x"00",x"04",x"04",x"00",x"F8",x"F4",x"00",x"10",x"21",x"28",x"21",x"10",x"00",x"F4",x"F8",x"00",x"04",x"04",x"00");
	type array_s16b is array (0 to 18) of signed(15 downto 0);
	signal filter_comp : array_s16b;
	signal comp_sum : signed(15 downto 0); 
	
	begin
	
		process(clk)
		begin 
			if rising_edge(clk) then
				filter_shift(0) <= unfiltered;
				filter_shift(1) <= filter_shift(0);
				filter_shift(2) <= filter_shift(1);
				filter_shift(3) <= filter_shift(2);
				filter_shift(4) <= filter_shift(3);
				filter_shift(5) <= filter_shift(4);
				filter_shift(6) <= filter_shift(5);
				filter_shift(7) <= filter_shift(6);
				filter_shift(8) <= filter_shift(7);
				filter_shift(9) <= filter_shift(8);
				filter_shift(10) <= filter_shift(9);
				filter_shift(11) <= filter_shift(10);
				filter_shift(12) <= filter_shift(11);
				filter_shift(13) <= filter_shift(12);
				filter_shift(14) <= filter_shift(13);
				filter_shift(15) <= filter_shift(14);
				filter_shift(16) <= filter_shift(15);	
			end if;
		end process;
		
		filter_comp(0) <= filter_shift(0)*filter_coeff(0);
		filter_comp(1) <= filter_shift(1)*filter_coeff(1);
		filter_comp(2) <= filter_shift(2)*filter_coeff(2);
		filter_comp(3) <= filter_shift(3)*filter_coeff(3);
		filter_comp(4) <= filter_shift(4)*filter_coeff(4);
		filter_comp(5) <= filter_shift(5)*filter_coeff(5);
		filter_comp(6) <= filter_shift(6)*filter_coeff(6);
		filter_comp(7) <= filter_shift(7)*filter_coeff(7);
		filter_comp(8) <= filter_shift(8)*filter_coeff(8);
		filter_comp(9) <= filter_shift(9)*filter_coeff(9);
		filter_comp(10) <= filter_shift(10)*filter_coeff(10);
		filter_comp(11) <= filter_shift(11)*filter_coeff(11);
		filter_comp(12) <= filter_shift(12)*filter_coeff(12);
		filter_comp(13) <= filter_shift(13)*filter_coeff(13);
		filter_comp(14) <= filter_shift(14)*filter_coeff(14);
		filter_comp(15) <= filter_shift(15)*filter_coeff(15);
		filter_comp(16) <= filter_shift(16)*filter_coeff(16);
		
		comp_sum <= filter_comp(0)+filter_comp(1)+filter_comp(2)+filter_comp(3)+filter_comp(4)+
					filter_comp(5)+filter_comp(6)+filter_comp(7)+filter_comp(8)+filter_comp(9)+
					filter_comp(10)+filter_comp(11)+filter_comp(12)+filter_comp(13)+filter_comp(14)+
					filter_comp(15)+filter_comp(16);
		
		process(clk)
		begin 
			if rising_edge(clk) then
				filtered <= comp_sum;	
			end if;
		end process;
		
end architecture;