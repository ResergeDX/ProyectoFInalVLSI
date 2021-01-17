library ieee;
use ieee.stD_logic_1164.all;
entity sum1BIT is port(
	a,b,cin: in std_logic;
	salsum : out std_logic;
	cout: out std_logic
);
end entity sum1BIT;
architecture arqsum of sum1BIT is 
begin
	salsum<= a xor b xor cin;
	cout<= (a and b) or ((a xor b)and cin);
end architecture;
	