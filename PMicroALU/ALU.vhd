library ieee;
use ieee.std_logic_1164.all;
entity ALU is port (
	a, b: in std_logic_vector (2 downto 0 );
	sel: in std_logic_vector (3 downto 0);--Cambio a 3 bits para implementar operaciones extras
	cin: in std_logic;
	disp0, disp1,disp2: out std_logic_vector(6 downto 0);
	salfinal: out std_logic_vector(5 downto 0)--Cambio de tamaño por multiplicador

);
end entity;

architecture arq_alu of ALU is
SIGNAL SAL_UA, SAL_UL,SAL_COM: std_logic_vector(2 downto 0);
signal SAL_MULT: std_logic_vector(5 downto 0);
signal cout: std_logic;
begin
	--ALU ORIGINAL
	arit: entity work.UA (arq_UA) port map (a,b,sel(1 downto 0),cin,SAL_UA,cout);
	log : entity work.UL (arq_UL) port map (a,b,sel(1 downto 0),SAL_UL);
	
	
	--Implementación comparadores y multiplicador de 3 bits. Activar salida por sel (3)
	comp: entity work.comparadores(arq_com) port map(a,b,sel(1 downto 0),SAL_COM);
	mult: entity work.multiplicador(arqmult) port map(a,b,SAL_MULT);
	
	
	
	disp_sal: entity work.display(arq_disp) 
		port map (SAL_UA,SAL_UL, SAL_COM,SAL_MULT,sel,cout,disp0,disp1,disp2,salfinal);
	


end architecture;