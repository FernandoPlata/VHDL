library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vco is 
port(
	vin: in integer range 0 to 255;
	vout: out integer range 0 to 255
	);
end entity;

architecture behavioural of vco is 
type iir is array (0 to 2) of signed (31 downto 0);
type coef is array (0 to 255) of signed (31 downto 0);
signal cos: coef;

begin

process (vin)
begin
	vout <= y(vin);
end process;
end behavioural;

