library ieee;
use ieee. std_logic_1164.all;
--Multiplicador de 3 bits.
entity multiplicador is port(
	a, b: in std_logic_vector(2 downto 0);
	cout: out std_logic_vector(5 downto 0)
);
end entity;

architecture arqmult of multiplicador is 
	signal carry, carry2, carry3,carry4,carry5: std_logic;
	signal cin: std_logic;
	
	signal a1b0,a2b0:std_logic;
	signal a0b1,a1b1,a2b1:std_logic;
	signal a0b2,a1b2,a2b2:std_logic;
	
	signal auxs1,auxs2:std_logic;
	
begin
	cin<='0';
	--bit 0 de salida
	cout(0)<=a(0) and b(0);
	
	--bit 1 de salida
	a1b0<= a(1) and b(0);
	a0b1<= a(0) and b(1);
	
	sumbit1: entity work.sum1BIT(arqsum) port map(a1b0,a0b1,cin,cout(1),carry);
	
	--bit 2 de salida
	a2b0<= a(2) and b(0);
	a1b1<= a(1) and b(1);
	a0b2<= a(0) and b(2);
	
	sumbit2: entity work.sum1BIT(arqsum) port map(a2b0,a1b1,a0b2,auxs1,carry2);
	sumbit2a:  entity work.sum1BIT(arqsum) port map(auxs1,carry,cin,cout(2),carry3);
	
	--bit 3 de salida
	a2b1<=a(2) and b(1);
	a1b2<=a(1) and b(2);
	sumbit3: entity work.sum1BIT(arqsum) port map(a2b1,a1b2,carry2,auxs2,carry4); 
	sumbit3a: entity work.sum1BIT(arqsum) port map(auxs2,carry3,cin,cout(3),carry5);
	
	--bit 4 de salida y bit de carreo
	a2b2<= a(2) and b(2);
	sumbit4: entity work.sum1BIT(arqsum) port map(a2b2,carry4,carry5,cout(4),cout(5));
	
end architecture; 