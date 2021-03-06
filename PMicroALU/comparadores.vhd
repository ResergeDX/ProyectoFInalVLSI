library ieee;
use ieee.std_logic_1164.all;
--Comparación entre numeros (=,>,<,!=)
entity comparadores is port(
	a,b: in std_logic_vector (2 downto 0);
	sel: in std_logic_vector (1 downto 0);
	salcom: out std_logic_vector(2 downto 0)
);
end entity;

architecture arq_com of comparadores is
signal igual,mayor, menor, diff: std_logic_vector (2 downto 0):="000";
begin

	--Comparaciones
	process(a,b,sel)
	begin
		if (a=b) then
			igual<="111";
			diff<="000";
		else 
			diff<="111";
			igual<="000";
		end if;
		if (a>b) then
			mayor<="111";
			igual<="000";
			menor<="000";
			diff<="111";
		end if;
		if (a<b) then 
			menor<="111";
			igual<="000";
			mayor<="000";
			diff<="111";
		end if;

		case sel is
			when "00" => 
				salcom<=igual;
			when "01" =>
				salcom<=mayor;
			when "10" =>
				salcom<=menor;
			when "11" =>
				salcom<=diff;
		end case;
		
	end process;
end arq_com;
