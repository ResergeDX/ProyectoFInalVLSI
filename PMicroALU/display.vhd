library ieee;
use ieee.std_logic_1164.all;

entity display is port(
	UA, UL,UC: in std_logic_vector(2 downto 0);--AGREGADO UC (COMPARACIONES)
	UM: in std_logic_vector(5 downto 0);--AGREGADO UM (MULTIPLICADOR DE 3 BITS)
	sel: in std_logic_vector (3 downto 0);--MODIFICADO PARA SELECCION DE NUEVAS OPERACIONES
	cout: in std_logic;
	disp0, disp1, disp2: out std_logic_vector(6 downto 0);
	salfinal: out std_logic_vector(5 downto 0)--MODIFICADO TAMAÑO DE SALIDA A 6 BITS (POR MULTIPLICADOR)
);
end entity;
architecture arq_disp of display is 
signal uaparcial, uaparcial2,ulparcial: std_logic_vector( 3 downto 0);
signal ucomp: std_logic_vector(2 downto 0);
signal umult: std_logic_vector(5 downto 0);

begin

	process(sel,cout,UA,UL,UC,UM)
	begin
	if(sel(3)='0') then 
		--UA
		if(sel(2)='0') then
			--resta
			if (sel(1 downto 0) ="10" OR sel(1 downto 0) ="11") then
				uaparcial <=cout&UA;
				--uaparcial <= '0'&UA;
				case uaparcial is 
					when "0000" => disp0 <="1000000";--0
					when "0001" => disp0 <="1111001";--1
					when "0010" => disp0 <="0100100";--2
					when "0011" => disp0 <="0110000";--3
					when "0100" => disp0 <="0011001";--4
					when "0101" => disp0 <="0010010";--5
					when "0110" => disp0 <="0000010";--6
					when "0111" => disp0 <="1111000";--7
					when "1000" => disp0 <="1000000";--0
					when "1001" => disp0 <="1111001";--1
					when "1010" => disp0 <="0100100";--2
					when "1011" => disp0 <="0110000";--3
					when "1100" => disp0 <="0011001";--4
					when "1101" => disp0 <="0010010";--5
					when "1110" => disp0 <="0000010";--6
					when "1111" => disp0 <="1111000";--7
					when others => disp0 <="1000000";
				end case;
				
				disp1 <= "1000000";
				disp2 <= "1111111";
				--Tamaño de 4 bits en 6 bits
				salfinal <= "00"&uaparcial;
			--suma y casos extra
			else
				uaparcial2 <= cout&UA;
				
				case uaparcial2 is 
					when "0000" => disp0 <="1000000";--0
					when "0001" => disp0 <="1111001";--1
					when "0010" => disp0 <="0100100";--2
					when "0011" => disp0 <="0110000";--3
					when "0100" => disp0 <="0011001";--4
					when "0101" => disp0 <="0010010";--5
					when "0110" => disp0 <="0000010";--6
					when "0111" => disp0 <="1111000";--7
					when "1000" => disp0 <="0000000";--8
					when "1001" => disp0 <="0011000";--9
					when "1010" => disp0 <="1000000";--10
					when "1011" => disp0 <="1111001";--11
					when "1100" => disp0 <="0100100";--12
					when "1101" => disp0 <="0110000";--13
					when "1110" => disp0 <="0011001";--14
					when "1111" => disp0 <="0010010";--15
					when others => disp0 <="1000000";
				end case;
				
				case uaparcial2 is 
					when "0000" => disp1 <="1000000";--0
					when "0001" => disp1 <="1000000";--1
					when "0010" => disp1 <="1000000";--2
					when "0011" => disp1 <="1000000";--3
					when "0100" => disp1 <="1000000";--4
					when "0101" => disp1 <="1000000";--5
					when "0110" => disp1 <="1000000";--6
					when "0111" => disp1 <="1000000";--7
					when "1000" => disp1 <="1000000";--8
					when "1001" => disp1 <="1000000";--9
					when "1010" => disp1 <="1111001";--10
					when "1011" => disp1 <="1111001";--11
					when "1100" => disp1 <="1111001";--12
					when "1101" => disp1 <="1111001";--13
					when "1110" => disp1 <="1111001";--14
					when "1111" => disp1 <="1111001";--15
					when others => disp1 <="1000000";
				end case;
				
				disp2 <= "1111111";
				--Tamaño de 4 bits en 6 bits
				salfinal <= "00"&uaparcial2;
			
			end if;
		--UL	
		else
			ulparcial <= '0'&UL;
			case ulparcial (0) is
				when '1' => disp0 <= "1111001";
				when '0' => disp0 <= "1000000";
				when others =>disp0<="1111111";
			end Case;
			case ulparcial (1) is
				when '1' => disp1 <= "1111001";
				when '0' => disp1 <= "1000000";
				when others =>disp1<="1111111";
			end Case;
			case ulparcial (2) is
				when '1' => disp2 <= "1111001";
				when '0' => disp2 <= "1000000";
				when others =>disp2<="1111111";
			end Case;
			
			--Tamaño de 4 bits en 6 bits
			salfinal <="000"&UL;
			
		end if;
	--OPERACIONES DE COMPARACIÓN Y MULTIPLICACIÓN
	else
		if(sel(2)='0') then
			--Comparaciones
			ucomp<=UC;
			 case ucomp is 
			 --Verdadero display 1 con V
				when "111" =>
					disp0 <= "1111111";
					disp1 <= "1000001";
					disp2 <= "1111111";
				--Falso display 1 con F
				when "000" =>
					disp0 <= "1111111";
					disp1 <= "0001110";
					disp2 <= "1111111";
				when others =>
					disp0 <= "1111111";
					disp1 <= "1111111";
					disp2 <= "1111111";
			end case;
		else
			--multiplicador
			
			if(sel(1 downto 0)="00") then
				umult<=UM;
				case umult is 
					when "000000" => disp0 <="1000000";--0
					when "000001" => disp0 <="1111001";--1
					when "000010" => disp0 <="0100100";--2
					when "000011" => disp0 <="0110000";--3
					when "000100" => disp0 <="0011001";--4
					when "000101" => disp0 <="0010010";--5
					when "000110" => disp0 <="0000010";--6
					when "000111" => disp0 <="1111000";--7
					when "001000" => disp0 <="0000000";--8
					when "001001" => disp0 <="0011000";--9
					when "001010" => disp0 <="1000000";--10
					
					when "001100" => disp0 <="0100100";--12
					when "001110" => disp0 <="0011001";--14
					when "001111" => disp0 <="0010010";--15
					when "010000" => disp0 <="0000010";--16
					when "010010" => disp0 <="0000000";--18
					
					when "010100" => disp0 <="1000000";--20
					when "010101" => disp0 <="1111001";--21
					when "011000" => disp0 <="0011001";--24
					when "011001" => disp0 <="0010010";--25
					when "011100" => disp0 <="0000000";--28
					
					when "011110" => disp0 <="1000000";--30
					when "100011" => disp0 <="0010010";--35
					when "100100" => disp0 <="0000010";--36
					
					when "101010" => disp0 <="0100100";--42
					when "110001" => disp0 <="0011000";--49
					
					when others => disp0 <="1000000";
					
				end case;
				
				case umult is 
					when "000000" => disp1 <="1000000";--0
					when "000001" => disp1 <="1000000";--1
					when "000010" => disp1 <="1000000";--2
					when "000011" => disp1 <="1000000";--3
					when "000100" => disp1 <="1000000";--4
					when "000101" => disp1 <="1000000";--5
					when "000110" => disp1 <="1000000";--6
					when "000111" => disp1 <="1000000";--7
					when "001000" => disp1 <="1000000";--8
					when "001001" => disp1 <="1000000";--9
					when "001010" => disp1 <="1111001";--10
					
					when "001100" => disp1 <="1111001";--12
					when "001110" => disp1 <="1111001";--14
					when "001111" => disp1 <="1111001";--15
					when "010000" => disp1 <="1111001";--16
					when "010010" => disp1 <="1111001";--18
					
					when "010100" => disp1 <="0100100";--20
					when "010101" => disp1 <="0100100";--21
					when "011000" => disp1 <="0100100";--24
					when "011001" => disp1 <="0100100";--25
					when "011100" => disp1 <="0100100";--28
					
					when "011110" => disp1 <="0110000";--30
					when "100011" => disp1 <="0110000";--35
					when "100100" => disp1 <="0110000";--36
					
					when "101010" => disp1 <="0011001";--42
					when "110001" => disp1 <="0011001";--49
					when others => disp1 <="1000000";
				end case;
				
				disp2 <= "1111111";
				
				salfinal <= umult;
			end if;
			
		end if;
	
	end if;
	end process;
end architecture arq_disp;