--------------------------------------------------------------------------------
--
--   FileName:         hw_image_generator.vhd
--   Dependencies:     none
--   Design Software:  Quartus II 64-bit Version 12.1 Build 177 SJ Full Version
--
--   HDL CODE IS PROVIDED "AS IS."  DIGI-KEY EXPRESSLY DISCLAIMS ANY
--   WARRANTY OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING BUT NOT
--   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
--   PARTICULAR PURPOSE, OR NON-INFRINGEMENT. IN NO EVENT SHALL DIGI-KEY
--   BE LIABLE FOR ANY INCIDENTAL, SPECIAL, INDIRECT OR CONSEQUENTIAL
--   DAMAGES, LOST PROFITS OR LOST DATA, HARM TO YOUR EQUIPMENT, COST OF
--   PROCUREMENT OF SUBSTITUTE GOODS, TECHNOLOGY OR SERVICES, ANY CLAIMS
--   BY THIRD PARTIES (INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF),
--   ANY CLAIMS FOR INDEMNITY OR CONTRIBUTION, OR OTHER SIMILAR COSTS.
--
--   Version History
--   Version 1.0 05/10/2013 Scott Larson
--     Initial Public Release
--    
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY hw_image_generator IS
  GENERIC(
   pixels_y :  INTEGER := 478;   --row that first color will persist until
   pixels_x :  INTEGER := 600);  --column that first color will persist until
  PORT(
    disp_ena :  IN   STD_LOGIC;  --display enable ('1' = display time, '0' = blanking time)
    row      :  IN   INTEGER;    --row pixel coordinate
    column   :  IN   INTEGER;    --column pixel coordinate
	 
    red      :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');  --red magnitude output to DAC
    green    :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');  --green magnitude output to DAC
    blue     :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
	 
	 disp0, disp1,disp2,disA, disB,leddecode,ledfetch: in std_logic_vector(6 downto 0);
	 bus_datos: in std_logic_vector(15 downto 0)
	 );
    
	 END hw_image_generator;

ARCHITECTURE behavior OF hw_image_generator IS

signal b,d0,d1,d2,instr: integer range 0 to 600;
BEGIN
b<=120;
d2<=280;
d1<=360;
d0<=440;
instr<=30;

	PROCESS(disp_ena, row, column, disp0, disp1,disp2,disA, disB,ledfetch,leddecode,bus_datos)
		BEGIN
		IF(disp_ena = '1') THEN        --display time
		--Instruccion
			if ((row >35  and row<40 ) AND (column>70 and column <95)) then 
				red <= (Others =>'1');
				green <= (Others =>'1');
				blue <= (Others =>'1');
				
			elsif ((row >35  and row<65 ) AND (column>80 and column <85)) then 
				red <= (Others =>'1');
				green <= (Others =>'1');	
				blue <= (Others =>'1');
			
			elsif ((row > 65 and row<70 ) AND (column>70 and column <95)) then 
				red <= (Others =>'1');
				green <= (Others =>'1');
				blue <= (Others =>'1');	
				
		--Num Instruccion
			--0
			elsif ((row >35  and row<40 ) AND (column>110 and column <120)) then 
				if(ledfetch(0)='0') then
					red <= (Others =>'1');
					green <= (Others =>'1');
					blue <= (Others =>'1');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
			--1
			elsif ((row >40  and row<50 ) AND (column>120 and column <125)) then 
				if(ledfetch(1)='0') then
					red <= (Others =>'1');
					green <= (Others =>'1');
					blue <= (Others =>'1');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
			--2
			elsif ((row >55  and row<65 ) AND (column>120 and column <125)) then 
				if(ledfetch(2)='0') then
					red <= (Others =>'1');
					green <= (Others =>'1');
					blue <= (Others =>'1');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
			--3
			elsif ((row >65  and row<70 ) AND (column>110 and column <120)) then 
				if(ledfetch(3)='0') then
					red <= (Others =>'1');
					green <= (Others =>'1');
					blue <= (Others =>'1');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
			--4
			elsif ((row >55  and row<65 ) AND (column>105 and column <110)) then 
				if(ledfetch(4)='0') then
					red <= (Others =>'1');
					green <= (Others =>'1');
					blue <= (Others =>'1');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
			--5
			elsif ((row >40  and row<50 ) AND (column>105 and column <110)) then 
				if(ledfetch(5)='0') then
					red <= (Others =>'1');
					green <= (Others =>'1');
					blue <= (Others =>'1');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
			--6
			elsif ((row >50  and row<55 ) AND (column>110 and column <120)) then 
				if(ledfetch(6)='0') then
					red <= (Others =>'1');
					green <= (Others =>'1');
					blue <= (Others =>'1');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
		--Representacion Instruccion
			--15
			elsif ((row >40  and row<50 ) AND (column>120+instr and column <130+instr)) then 
				if(bus_datos(15)='1') then
					red <= (Others =>'0');
					green <= (Others =>'1');
					blue <= (Others =>'0');
				else
					red <= (Others =>'1');
					green <= (Others =>'1');
					blue <= (Others =>'1');
				end if;
			--14
			elsif ((row >40  and row<50 ) AND (column>135+instr and column <145+instr)) then 
				if(bus_datos(14)='1') then
					red <= (Others =>'0');
					green <= (Others =>'1');
					blue <= (Others =>'0');
				else
					red <= (Others =>'1');
					green <= (Others =>'1');
					blue <= (Others =>'1');
				end if;
			--13
			elsif ((row >40  and row<50 ) AND (column>150+instr and column <160+instr)) then 
				if(bus_datos(13)='1') then
					red <= (Others =>'0');
					green <= (Others =>'1');
					blue <= (Others =>'0');
				else
					red <= (Others =>'1');
					green <= (Others =>'1');
					blue <= (Others =>'1');
				end if;
			--12
			elsif ((row >40  and row<50 ) AND (column>165+instr and column <175+instr)) then 
				if(bus_datos(12)='1') then
					red <= (Others =>'0');
					green <= (Others =>'1');
					blue <= (Others =>'0');
				else
					red <= (Others =>'1');
					green <= (Others =>'1');
					blue <= (Others =>'1');
				end if;
			--11
			elsif ((row >40  and row<50 ) AND (column>180+instr and column <190+instr)) then 
				if(bus_datos(11)='1') then
					red <= (Others =>'0');
					green <= (Others =>'1');
					blue <= (Others =>'0');
				else
					red <= (Others =>'1');
					green <= (Others =>'1');
					blue <= (Others =>'1');
				end if;
			--10
			elsif ((row >40  and row<50 ) AND (column>195+instr and column <205+instr)) then 
				if(bus_datos(10)='1') then
					red <= (Others =>'0');
					green <= (Others =>'1');
					blue <= (Others =>'0');
				else
					red <= (Others =>'1');
					green <= (Others =>'1');
					blue <= (Others =>'1');
				end if;
			--09
			elsif ((row >40  and row<50 ) AND (column>210+instr and column <220+instr)) then 
				if(bus_datos(9)='1') then
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'1');
				else
					red <= (Others =>'1');
					green <= (Others =>'1');
					blue <= (Others =>'1');
				end if;
				
			--08
			elsif ((row >40  and row<50 ) AND (column>225+instr and column <235+instr)) then 
				if(bus_datos(8)='1') then
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'1');
				else
					red <= (Others =>'1');
					green <= (Others =>'1');
					blue <= (Others =>'1');
				end if;
			
			--07
			elsif ((row >40  and row<50 ) AND (column>240+instr and column <250+instr)) then 
				if(bus_datos(7)='1') then
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'1');
				else
					red <= (Others =>'1');
					green <= (Others =>'1');
					blue <= (Others =>'1');
				end if;
			
			--06
			elsif ((row >40  and row<50 ) AND (column>255+instr and column <265+instr)) then 
				if(bus_datos(6)='1') then
					red <= (Others =>'1');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				else
					red <= (Others =>'1');
					green <= (Others =>'1');
					blue <= (Others =>'1');
				end if;
				
			--05
			elsif ((row >40  and row<50 ) AND (column>270+instr and column <280+instr)) then 
				if(bus_datos(5)='1') then
					red <= (Others =>'1');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				else
					red <= (Others =>'1');
					green <= (Others =>'1');
					blue <= (Others =>'1');
				end if;
				
			--04
			elsif ((row >40  and row<50 ) AND (column>285+instr and column <295+instr)) then 
				if(bus_datos(4)='1') then
					red <= (Others =>'1');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				else
					red <= (Others =>'1');
					green <= (Others =>'1');
					blue <= (Others =>'1');
				end if;
			--03
			elsif ((row >40  and row<50 ) AND (column>300+instr and column <310+instr)) then 
				if(bus_datos(3)='1') then
					red <= (Others =>'1');
					green <= (Others =>'0');
					blue <= (Others =>'1');
				else
					red <= (Others =>'1');
					green <= (Others =>'1');
					blue <= (Others =>'1');
				end if;
				
			--02
			elsif ((row >40  and row<50 ) AND (column>315+instr and column <325+instr)) then 
				if(bus_datos(2)='1') then
					red <= (Others =>'1');
					green <= (Others =>'0');
					blue <= (Others =>'1');
				else
					red <= (Others =>'1');
					green <= (Others =>'1');
					blue <= (Others =>'1');
				end if;
			
			--01
			elsif ((row >40  and row<50 ) AND (column>330+instr and column <340+instr)) then 
				if(bus_datos(1)='1') then
					red <= (Others =>'1');
					green <= (Others =>'0');
					blue <= (Others =>'1');
				else
					red <= (Others =>'1');
					green <= (Others =>'1');
					blue <= (Others =>'1');
				end if;
			
			--00
			elsif ((row >40  and row<50 ) AND (column>345+instr and column <355+instr)) then 
				if(bus_datos(0)='1') then
					red <= (Others =>'1');
					green <= (Others =>'0');
					blue <= (Others =>'1');
				else
					red <= (Others =>'1');
					green <= (Others =>'1');
					blue <= (Others =>'1');
				end if;
				
			--Visualizacion de decodificacion de instruccion
			
			elsif ((row >60  and row<70 ) AND (column>120+instr and column <205+instr)) then 
			
				red <= (Others =>'0');
				green <= (Others =>'1');
				blue <= (Others =>'0');
			elsif ((row >60  and row<70 ) AND (column>210+instr and column <250+instr)) then 
			
				red <= (Others =>'0');
				green <= (Others =>'0');
				blue <= (Others =>'1');
			elsif ((row >60  and row<70 ) AND (column>255+instr and column <295+instr)) then 
			
				red <= (Others =>'1');
				green <= (Others =>'0');
				blue <= (Others =>'0');
				
			elsif ((row >60  and row<70 ) AND (column>300+instr and column <355+instr)) then 
			
				red <= (Others =>'1');
				green <= (Others =>'0');
				blue <= (Others =>'1');
				
		--Dato A (azul)
			elsif ((row >120  and row<140 ) AND (column>70 and column <100)) then 
				if(disA(0)='0') then
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'1');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
			--1
			elsif ((row >140  and row<220 ) AND (column>100 and column <115)) then
				if(disA(1)='0') then
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'1');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
			--2
			elsif ((row >240  and row<320 ) AND (column>100 and column <115)) then
				if(disA(2)='0') then
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'1');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
			--3
			elsif ((row >320  and row<340 ) AND (column>70 and column <100)) then
				if(disA(3)='0') then
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'1');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
			--4
			elsif ((row >240  and row<320 ) AND (column>55 and column <70)) then
				if(disA(4)='0') then
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'1');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
			--5
			elsif ((row >140  and row<220 ) AND (column>55 and column <70) ) then
				if(disA(5)='0') then
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'1');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
			--6
			elsif ((row >220  and row<240 ) AND (column>70 and column <100)) then
				if(disA(6)='0') then
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'1');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
				
			--Operacion (Verde)
			--0
			
			elsif ((row >210 and row<220 ) AND (column>140 and column <150)) then 
				if(leddecode(0)='0') then
					red <= (Others =>'0');
					green <= (Others =>'1');
					blue <= (Others =>'0');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
				
			--1
			elsif ((row >220  and row<230 ) AND (column>150 and column <160)) then
				if(leddecode(1)='0' ) then
					red <= (Others =>'0');
					green <= (Others =>'1');
					blue <= (Others =>'0');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
			--2
			elsif ((row >240  and row<250 ) AND (column>150 and column <160)) then
				if(leddecode(2)='0') then
					red <= (Others =>'0');
					green <= (Others =>'1');
					blue <= (Others =>'0');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
			--3
			elsif ((row >250  and row<260 ) AND (column>140 and column <150)) then
				if(leddecode(3)='0') then
					red <= (Others =>'0');
					green <= (Others =>'1');
					blue <= (Others =>'0');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
			--4
			elsif ((row >240  and row<250 )  AND (column>130 and column <140)) then
				if(leddecode(4)='0') then
					red <= (Others =>'0');
					green <= (Others =>'1');
					blue <= (Others =>'0');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
			--5
			elsif ((row >220  and row<230 ) AND (column>130 and column <140) ) then
				if(leddecode(5)='0') then
					red <= (Others =>'0');
					green <= (Others =>'1');
					blue <= (Others =>'0');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
			--6
			elsif ((row >230  and row<240 ) AND (column>140 and column <150)) then
				if(leddecode(6)='0') then
					red <= (Others =>'0');
					green <= (Others =>'1');
					blue <= (Others =>'0');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
				
			--Operaciones extras
			
				
			--Entrada B (rojo)
			elsif ((row >120  and row<140 ) AND (column>70+b and column <100+b)) then 
				if(disB(0)='0') then
					red <= (Others =>'1');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
			--1
			elsif ((row >140  and row<220 ) AND (column>100+b and column <115+b)) then
				if(disB(1)='0') then
					red <= (Others =>'1');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
			--2
			elsif ((row >240  and row<320 ) AND (column>100+b and column <115+b)) then
				if(disB(2)='0') then
					red <= (Others =>'1');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
			--3
			elsif ((row >320  and row<340 ) AND (column>70+b and column <100+b)) then
				if(disB(3)='0') then
					red <= (Others =>'1');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
			--4
			elsif ((row >240  and row<320 ) AND (column>55+b and column <70+b)) then
				if(disB(4)='0') then
					red <= (Others =>'1');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
			--5
			elsif ((row >140  and row<220 ) AND (column>55+b and column <70+b) ) then
				if(disB(5)='0') then
					red <= (Others =>'1');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
			--6
			elsif ((row >220  and row<240 ) AND (column>70+b and column <100+b)) then
				if(disB(6)='0') then
					red <= (Others =>'1');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
				
			--Signo Igual
			
			elsif ((row >205  and row<220 ) AND (column>255 and column <280)) then
				
					red <= (Others =>'1');
					green <= (Others =>'1');
					blue <= (Others =>'1');
				
					
				
			elsif ((row >240  and row<255 ) AND (column>255 and column <280)) then
				
					red <= (Others =>'1');
					green <= (Others =>'1');
					blue <= (Others =>'1');
				
				
			--Respuesta Obtenida (Magenta)
			elsif ((row >120  and row<140 ) AND (column>70+d0 and column <100+d0)) then 
				if(disp0(0)='0') then
					red <= (Others =>'1');
					green <= (Others =>'0');
					blue <= (Others =>'1');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
			--1
			elsif ((row >140  and row<220 ) AND (column>100+d0 and column <115+d0)) then
				if(disp0(1)='0') then
					red <= (Others =>'1');
					green <= (Others =>'0');
					blue <= (Others =>'1');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
			--2
			elsif ((row >240  and row<320 ) AND (column>100+d0 and column <115+d0)) then
				if(disp0(2)='0') then
					red <= (Others =>'1');
					green <= (Others =>'0');
					blue <= (Others =>'1');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
			--3
			elsif ((row >320  and row<340 ) AND (column>70+d0 and column <100+d0)) then
				if(disp0(3)='0') then
					red <= (Others =>'1');
					green <= (Others =>'0');
					blue <= (Others =>'1');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
			--4
			elsif ((row >240  and row<320 ) AND (column>55+d0 and column <70+d0)) then
				if(disp0(4)='0') then
					red <= (Others =>'1');
					green <= (Others =>'0');
					blue <= (Others =>'1');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
			--5
			elsif ((row >140  and row<220 ) AND (column>55+d0 and column <70+d0)) then
				if(disp0(5)='0') then
					red <= (Others =>'1');
					green <= (Others =>'0');
					blue <= (Others =>'1');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
			--6
			elsif ((row >220  and row<240 ) AND (column>70+d0 and column <100+d0)) then
				if(disp0(6)='0') then
					red <= (Others =>'1');
					green <= (Others =>'0');
					blue <= (Others =>'1');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
			--D1
			--0
			elsif ((row >120  and row<140 ) AND (column>70+d1 and column <100+d1)) then 
				if(disp1(0)='0') then
					red <= (Others =>'1');
					green <= (Others =>'0');
					blue <= (Others =>'1');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
			--1
			elsif ((row >140  and row<220 ) AND (column>100+d1 and column <115+d1)) then
				if(disp1(1)='0') then
					red <= (Others =>'1');
					green <= (Others =>'0');
					blue <= (Others =>'1');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
			--2
			elsif ((row >240  and row<320 ) AND (column>100+d1 and column <115+d1)) then
				if(disp1(2)='0') then
					red <= (Others =>'1');
					green <= (Others =>'0');
					blue <= (Others =>'1');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
			--3
			elsif ((row >320  and row<340 ) AND (column>70+d1 and column <100+d1)) then
				if(disp1(3)='0') then
					red <= (Others =>'1');
					green <= (Others =>'0');
					blue <= (Others =>'1');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
			--4
			elsif ((row >240  and row<320 ) AND (column>55+d1 and column <70+d1)) then
				if(disp1(4)='0') then
					red <= (Others =>'1');
					green <= (Others =>'0');
					blue <= (Others =>'1');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
			--5
			elsif ((row >140  and row<220 ) AND (column>55+d1 and column <70+d1)) then
				if(disp1(5)='0') then
					red <= (Others =>'1');
					green <= (Others =>'0');
					blue <= (Others =>'1');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
			--6
			elsif ((row >220  and row<240 ) AND (column>70+d1 and column <100+d1)) then
				if(disp1(6)='0') then
					red <= (Others =>'1');
					green <= (Others =>'0');
					blue <= (Others =>'1');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;

			--D2
			--0
			elsif ((row >120  and row<140 ) AND (column>70+d2 and column <100+d2)) then 
				if(disp2(0)='0') then
					red <= (Others =>'1');
					green <= (Others =>'0');
					blue <= (Others =>'1');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
			--1
			elsif ((row >140  and row<220 ) AND (column>100+d2 and column <115+d2)) then
				if(disp2(1)='0') then
					red <= (Others =>'1');
					green <= (Others =>'0');
					blue <= (Others =>'1');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
			--2
			elsif ((row >240  and row<320 ) AND (column>100+d2 and column <115+d2)) then
				if(disp2(2)='0') then
					red <= (Others =>'1');
					green <= (Others =>'0');
					blue <= (Others =>'1');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
			--3
			elsif ((row >320  and row<340 ) AND (column>70+d2 and column <100+d2)) then
				if(disp2(3)='0') then
					red <= (Others =>'1');
					green <= (Others =>'0');
					blue <= (Others =>'1');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
			--4
			elsif ((row >240  and row<320 ) AND (column>55+d2 and column <70+d2)) then
				if(disp2(4)='0') then
					red <= (Others =>'1');
					green <= (Others =>'0');
					blue <= (Others =>'1');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
			--5
			elsif ((row >140  and row<220 ) AND (column>55+d2 and column <70+d2)) then
				if(disp2(5)='0') then
					red <= (Others =>'1');
					green <= (Others =>'0');
					blue <= (Others =>'1');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;
			--6
			elsif ((row >220  and row<240 ) AND (column>70+d2 and column <100+d2)) then
				if(disp2(6)='0') then
					red <= (Others =>'1');
					green <= (Others =>'0');
					blue <= (Others =>'1');
				else
					red <= (Others =>'0');
					green <= (Others =>'0');
					blue <= (Others =>'0');
				end if;		
			
			
			
			else		
					red <= (OTHERS => '0');  --es el fondo
					green	<= (OTHERS => '0');
					blue <= (OTHERS => '0');
			end if;
			
			
			
		else		
				red <= (OTHERS => '0');  --es el fondo
				green	<= (OTHERS => '0');
				blue <= (OTHERS => '0');
		end if;
		


	END PROCESS;
END behavior;