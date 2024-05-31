library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--Integración final de 32 iteraciones del algoritmo de CORDIC
--Muy lento para simular mas de un ciclo de (-pi/2, pi/2)
--Precision muy alta para usar en el dac de psoc 
--Funciona !!!!

entity cordic32b is 
generic (precision: integer := 31);
port (
	Xin,Yin,Zin: in signed (precision downto 0);
	Xout,Yout,Zout: out signed (precision downto 0);
	clk: in std_logic
);
end entity;

architecture algo of cordic32b is 
 
component iteracion is 
generic(nbits: integer := 15;shift: integer := 0);
port (
	Xi, Yi: in signed (nbits downto 0); 
	Zi, ai: in signed (nbits downto 0);
	Xo, Yo: out signed (nbits downto 0); 
	Zo: out signed (nbits downto 0);
	clkp: in std_logic
);
end component;

component rom_atan32 is
port(
	a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,a17,a18,a19,a20,a21,a22,a23,a24,a25,a26,a27,a28,a29,a30,a31: out signed (31 downto 0));
end component;

signal X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,X21,X22,X23,X24,X25,X26,X27,X28,X29,X30: signed (precision downto 0);
signal Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7,Y8,Y9,Y10,Y11,Y12,Y13,Y14,Y15,Y16,Y17,Y18,Y19,Y20,Y21,Y22,Y23,Y24,Y25,Y26,Y27,Y28,Y29,Y30: signed (precision downto 0);
signal Z0,Z1,Z2,Z3,Z4,Z5,Z6,Z7,Z8,Z9,Z10,Z11,Z12,Z13,Z14,Z15,Z16,Z17,Z18,Z19,Z20,Z21,Z22,Z23,Z24,Z25,Z26,Z27,Z28,Z29,Z30: signed (precision downto 0);
signal at0,at1,at2,at3,at4,at5,at6,at7,at8,at9,at10,at11,at12,at13,at14,at15,at16,at17,at18,at19,at20,at21,at22,at23,at24,at25,at26,at27,at28,at29,at30,at31: signed (precision downto 0);


begin

iteracion0: iteracion 
generic map (nbits => precision, shift => 0)
port map (
	Xi => Xin,
	Yi => Yin,
	Zi => Zin,
	Xo => X0,
	Yo => Y0,
	Zo => Z0,
	ai => at0,
	clkp => clk
);

iteracion1: iteracion 
generic map (nbits => precision, shift => 1)
port map (
	Xi => X0,
	Yi => Y0,
	Zi => Z0,
	Xo => X1,
	Yo => Y1,
	Zo => Z1,
	ai => at1,
	clkp => clk
);

iteracion2: iteracion 
generic map (nbits => precision, shift => 2)
port map (
	Xi => X1,
	Yi => Y1,
	Zi => Z1,
	Xo => X2,
	Yo => Y2,
	Zo => Z2,
	ai => at2,
	clkp => clk
);

iteracion3: iteracion 
generic map (nbits => precision, shift => 3)
port map (
	Xi => X2,
	Yi => Y2,
	Zi => Z2,
	Xo => X3,
	Yo => Y3,
	Zo => Z3,
	ai => at3,
	clkp => clk
);

iteracion4: iteracion 
generic map (nbits => precision, shift =>4 )
port map (
	Xi => X3,
	Yi => Y3,
	Zi => Z3,
	Xo => X4,
	Yo => Y4,
	Zo => Z4,
	ai => at4,
	clkp => clk
);

iteracion5: iteracion 
generic map (nbits => precision, shift =>5 )
port map (
	Xi => X4,
	Yi => Y4,
	Zi => Z4,
	Xo => X5,
	Yo => Y5,
	Zo => Z5,
	ai => at5,
	clkp => clk
);

iteracion6: iteracion 
generic map (nbits => precision, shift =>6 )
port map (
	Xi => X5,
	Yi => Y5,
	Zi => Z5,
	Xo => X6,
	Yo => Y6,
	Zo => Z6,
	ai => at6,
	clkp => clk
);

iteracion7: iteracion 
generic map (nbits => precision, shift =>7 )
port map (
	Xi => X6,
	Yi => Y6,
	Zi => Z6,
	Xo => X7,
	Yo => Y7,
	Zo => Z7,
	ai => at7,
	clkp => clk
);

iteracion8: iteracion 
generic map (nbits => precision, shift =>8 )
port map (
	Xi => X7,
	Yi => Y7,
	Zi => Z7,
	Xo => X8,
	Yo => Y8,
	Zo => Z8,
	ai => at8,
	clkp => clk
);

iteracion9: iteracion 
generic map (nbits => precision, shift =>9 )
port map (
	Xi => X8,
	Yi => Y8,
	Zi => Z8,
	Xo => X9,
	Yo => Y9,
	Zo => Z9,
	ai => at9,
	clkp => clk
);

iteracion10: iteracion 
generic map (nbits => precision, shift =>10 )
port map (
	Xi => X9,
	Yi => Y9,
	Zi => Z9,
	Xo => X10,
	Yo => Y10,
	Zo => Z10,
	ai => at10,
	clkp => clk
);

iteracion11: iteracion 
generic map (nbits => precision, shift => 11)
port map (
	Xi => X10,
	Yi => Y10,
	Zi => Z10,
	Xo => X11,
	Yo => Y11,
	Zo => Z11,
	ai => at11,
	clkp => clk
);

iteracion12: iteracion 
generic map (nbits => precision, shift => 12)
port map (
	Xi => X11,
	Yi => Y11,
	Zi => Z11,
	Xo => X12,
	Yo => Y12,
	Zo => Z12,
	ai => at12,
	clkp => clk
);

iteracion13: iteracion 
generic map (nbits => precision, shift => 13)
port map (
	Xi => X12,
	Yi => Y12,
	Zi => Z12,
	Xo => X13,
	Yo => Y13,
	Zo => Z13,
	ai => at13,
	clkp => clk
);

iteracion14: iteracion 
generic map (nbits => precision, shift =>14 )
port map (
	Xi => X13,
	Yi => Y13,
	Zi => Z13,
	Xo => X14,
	Yo => Y14,
	Zo => Z14,
	ai => at14,
	clkp => clk
);

iteracion15: iteracion 
generic map (nbits => precision, shift =>15 )
port map (
	Xi => X14,
	Yi => Y14,
	Zi => Z14,
	Xo => X15,
	Yo => Y15,
	Zo => Z15,
	ai => at15,
	clkp => clk
);

iteracion16: iteracion 
generic map (nbits => precision, shift =>16 )
port map (
	Xi => X15,
	Yi => Y15,
	Zi => Z15,
	Xo => X16,
	Yo => Y16,
	Zo => Z16,
	ai => at16,
	clkp => clk
);

iteracion17: iteracion 
generic map (nbits => precision, shift =>17 )
port map (
	Xi => X16,
	Yi => Y16,
	Zi => Z16,
	Xo => X17,
	Yo => Y17,
	Zo => Z17,
	ai => at17,
	clkp => clk
);

iteracion18: iteracion 
generic map (nbits => precision, shift =>18 )
port map (
	Xi => X17,
	Yi => Y17,
	Zi => Z17,
	Xo => X18,
	Yo => Y18,
	Zo => Z18,
	ai => at18,
	clkp => clk
);

iteracion19: iteracion 
generic map (nbits => precision, shift =>19 )
port map (
	Xi => X18,
	Yi => Y18,
	Zi => Z18,
	Xo => X19,
	Yo => Y19,
	Zo => Z19,
	ai => at19,
	clkp => clk
);

iteracion20: iteracion 
generic map (nbits => precision, shift =>20 )
port map (
	Xi => X19,
	Yi => Y19,
	Zi => Z19,
	Xo => X20,
	Yo => Y20,
	Zo => Z20,
	ai => at20,
	clkp => clk
);

iteracion21: iteracion 
generic map (nbits => precision, shift => 21)
port map (
	Xi => X20,
	Yi => Y20,
	Zi => Z20,
	Xo => X21,
	Yo => Y21,
	Zo => Z21,
	ai => at21,
	clkp => clk
);

iteracion22: iteracion 
generic map (nbits => precision, shift => 22)
port map (
	Xi => X21,
	Yi => Y21,
	Zi => Z21,
	Xo => X22,
	Yo => Y22,
	Zo => Z22,
	ai => at22,
	clkp => clk
);

iteracion23: iteracion 
generic map (nbits => precision, shift => 23)
port map (
	Xi => X22,
	Yi => Y22,
	Zi => Z22,
	Xo => X23,
	Yo => Y23,
	Zo => Z23,
	ai => at23,
	clkp => clk
);

iteracion24: iteracion 
generic map (nbits => precision, shift =>24 )
port map (
	Xi => X23,
	Yi => Y23,
	Zi => Z23,
	Xo => X24,
	Yo => Y24,
	Zo => Z24,
	ai => at24,
	clkp => clk
);

iteracion25: iteracion 
generic map (nbits => precision, shift =>25 )
port map (
	Xi => X24,
	Yi => Y24,
	Zi => Z24,
	Xo => X25,
	Yo => Y25,
	Zo => Z25,
	ai => at25,
	clkp => clk
);

iteracion26: iteracion 
generic map (nbits => precision, shift =>26 )
port map (
	Xi => X25,
	Yi => Y25,
	Zi => Z25,
	Xo => X26,
	Yo => Y26,
	Zo => Z26,
	ai => at26,
	clkp => clk
);

iteracion27: iteracion 
generic map (nbits => precision, shift =>27 )
port map (
	Xi => X26,
	Yi => Y26,
	Zi => Z26,
	Xo => X27,
	Yo => Y27,
	Zo => Z27,
	ai => at27,
	clkp => clk
);

iteracion28: iteracion 
generic map (nbits => precision, shift =>28 )
port map (
	Xi => X27,
	Yi => Y27,
	Zi => Z27,
	Xo => X28,
	Yo => Y28,
	Zo => Z28,
	ai => at28,
	clkp => clk
);

iteracion29: iteracion 
generic map (nbits => precision, shift =>29 )
port map (
	Xi => X28,
	Yi => Y28,
	Zi => Z28,
	Xo => X29,
	Yo => Y29,
	Zo => Z29,
	ai => at29,
	clkp => clk
);

iteracion30: iteracion 
generic map (nbits => precision, shift =>30 )
port map (
	Xi => X29,
	Yi => Y29,
	Zi => Z29,
	Xo => X30,
	Yo => Y30,
	Zo => Z30,
	ai => at30,
	clkp => clk
);

iteracion31: iteracion 
generic map (nbits => precision, shift => 31)
port map (
	Xi => X30,
	Yi => Y30,
	Zi => Z30,
	Xo => Xout,
	Yo => Yout,
	Zo => Zout,
	ai => at31,
	clkp => clk
);

romatan: rom_atan32
port map(
	a0 => at0,
	a1 => at1,
	a2 => at2,
	a3 => at3,
	a4 => at4,
	a5 => at5,
	a6 => at6,
	a7 => at7,
	a8 => at8,
	a9 => at9,
	a10 => at10,
	a11 => at11,
	a12 => at12,
	a13 => at13,
	a14 => at14,
	a15 => at15,
	a16 => at16,
	a17 => at17,
	a18 => at18,
	a19 => at19,
	a20 => at20,
	a21 => at21,
	a22 => at22,
	a23 => at23,
	a24 => at24,
	a25 => at25,
	a26 => at26,
	a27 => at27,
	a28 => at28,
	a29 => at29,
	a30 => at30,
	a31 => at31
);
end algo;


 