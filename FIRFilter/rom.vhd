library ieee;
use ieee.std_logic_1164.all;

entity rom is
generic(dir: integer :=7;
		dato: integer :=7);
port(a1: in integer range 0 to 127;
	 d1: out integer range 0 to 127;
	 a2: in integer range 0 to 127;
	 d2: out integer range 0 to 127;
	 do: out integer range 0 to 255);
end entity;

architecture rtl of rom is
type localidades is array (0 to (2**dir-1)) of integer range 0 to (2**dato-1);
signal mem: localidades := (64,67,70,73,76,79,82,85,
88,91,93,96,99,101,104,106,
108,111,113,115,116,118,120,121,
122,123,124,125,126,126,127,127,
127,127,127,126,126,125,124,123,
122,121,120,118,116,115,113,111,
108,106,104,101,99,96,93,91,
88,85,82,79,76,73,70,67,
64,60,57,54,51,48,45,42,
39,36,34,31,28,26,23,21,
19,16,14,12,11,9,7,6,
5,4,3,2,1,1,0,0,
0,0,0,1,1,2,3,4,
5,6,7,9,11,12,14,16,
19,21,23,26,28,31,34,36,
39,42,45,48,51,54,57,60);

signal mem2: localidades := (64,67,70,73,76,79,82,85,
88,91,93,96,99,101,104,106,
108,111,113,115,116,118,120,121,
122,123,124,125,126,126,127,127,
127,127,127,126,126,125,124,123,
122,121,120,118,116,115,113,111,
108,106,104,101,99,96,93,91,
88,85,82,79,76,73,70,67,
64,60,57,54,51,48,45,42,
39,36,34,31,28,26,23,21,
19,16,14,12,11,9,7,6,
5,4,3,2,1,1,0,0,
0,0,0,1,1,2,3,4,
5,6,7,9,11,12,14,16,
19,21,23,26,28,31,34,36,
39,42,45,48,51,54,57,60);

begin

d1 <= mem(a1);
d2 <= mem2(a2); 

do <= mem(a1) + mem2(a2);

end rtl;