----S-BOX LOOKUP TABLE------


library ieee;
use ieee.std_logic_1164.all; 

entity SBOX is
	port( SBOXIN: in std_logic_vector( 7 downto 0);	--- 8 bits input
	      SBOXOUT: out std_logic_vector( 7 downto 0 )	--- 8 bits output
	     );
end SBOX;
architecture SBOX_STR of SBOX is
	begin
	  
	SBOXOUT ( 7 downto 0)<=	
			
			---first row---
		"01100011" when SBOXIN ( 7 downto 0)= "00000000" else	--63
		"01111100" when SBOXIN ( 7 downto 0)= "00000001" else	--7C
		"01110111" when SBOXIN ( 7 downto 0)= "00000010" else	--77	
		"01101011" when SBOXIN ( 7 downto 0)= "00000011" else	--7B
		"11110010" when SBOXIN ( 7 downto 0)= "00000100" else	--F2
		"01101011" when SBOXIN ( 7 downto 0)= "00000101" else	--6B
		"01101111" when SBOXIN ( 7 downto 0)= "00000110" else	--6F
		"11000101" when SBOXIN ( 7 downto 0)= "00000111" else	--C5
		"00110000" when SBOXIN ( 7 downto 0)= "00001000" else	--30
		"00000001" when SBOXIN ( 7 downto 0)= "00001001" else	--01
		"01100111" when SBOXIN ( 7 downto 0)= "00001010" else	--67
		"00101011" when SBOXIN ( 7 downto 0)= "00001011" else	--2B
		"11111110" when SBOXIN ( 7 downto 0)= "00001100" else	--FE
		"11010111" when SBOXIN ( 7 downto 0)= "00001101" else	--D7
		"10101011" when SBOXIN ( 7 downto 0)= "00001110" else	--AB
		"01110110" when SBOXIN ( 7 downto 0)= "00001111" else	--76	

			---second row---
		"11001010" when SBOXIN ( 7 downto 0)= "00010000" else	--CA
		"10000010" when SBOXIN ( 7 downto 0)= "00010001" else	--82
		"11001001" when SBOXIN ( 7 downto 0)= "00010010" else	--C9	
		"01111101" when SBOXIN ( 7 downto 0)= "00010011" else	--7D
		"11111010" when SBOXIN ( 7 downto 0)= "00010100" else	--FA
		"01011001" when SBOXIN ( 7 downto 0)= "00010101" else	--59
		"01000111" when SBOXIN ( 7 downto 0)= "00010110" else	--47
		"11110000" when SBOXIN ( 7 downto 0)= "00010111" else	--F0
		"10101101" when SBOXIN ( 7 downto 0)= "00011000" else	--AD
		"11010100" when SBOXIN ( 7 downto 0)= "00011001" else	--D4
		"10100010" when SBOXIN ( 7 downto 0)= "00011010" else	--A2
		"10101111" when SBOXIN ( 7 downto 0)= "00011011" else	--AF
		"10011100" when SBOXIN ( 7 downto 0)= "00011100" else	--9C
		"10100100" when SBOXIN ( 7 downto 0)= "00011101" else	--A4
		"01110010" when SBOXIN ( 7 downto 0)= "00011110" else	--72
		"11000000" when SBOXIN ( 7 downto 0)= "00011111" else	--C0

			---third row---
		"10110111" when SBOXIN ( 7 downto 0)= "00100000" else	--B7
		"11111101" when SBOXIN ( 7 downto 0)= "00100001" else	--FD
		"10010011" when SBOXIN ( 7 downto 0)= "00100010" else	--93	
		"00100110" when SBOXIN ( 7 downto 0)= "00100011" else	--26
		"00110110" when SBOXIN ( 7 downto 0)= "00100100" else	--36
		"00111111" when SBOXIN ( 7 downto 0)= "00100101" else	--3F
		"11110111" when SBOXIN ( 7 downto 0)= "00100110" else	--F7
		"11001100" when SBOXIN ( 7 downto 0)= "00100111" else	--CC
		"00110100" when SBOXIN ( 7 downto 0)= "00101000" else	--34
		"10100101" when SBOXIN ( 7 downto 0)= "00101001" else	--A5
		"11100101" when SBOXIN ( 7 downto 0)= "00101010" else	--E5
		"11110001" when SBOXIN ( 7 downto 0)= "00101011" else	--F1
		"01110001" when SBOXIN ( 7 downto 0)= "00101100" else	--71
		"11011000" when SBOXIN ( 7 downto 0)= "00101101" else	--D8
		"00110001" when SBOXIN ( 7 downto 0)= "00101110" else	--31
		"00010101" when SBOXIN ( 7 downto 0)= "00101111" else	--15	

			---fourth row---
		"00000100" when SBOXIN ( 7 downto 0)= "00110000" else	--04
		"11000111" when SBOXIN ( 7 downto 0)= "00110001" else	--C7
		"00100011" when SBOXIN ( 7 downto 0)= "00110010" else	--23	
		"11000011" when SBOXIN ( 7 downto 0)= "00110011" else	--C3
		"00011000" when SBOXIN ( 7 downto 0)= "00110100" else	--18
		"10010110" when SBOXIN ( 7 downto 0)= "00110101" else	--96
		"00000101" when SBOXIN ( 7 downto 0)= "00110110" else	--05
		"10011010" when SBOXIN ( 7 downto 0)= "00110111" else	--9A
		"00000111" when SBOXIN ( 7 downto 0)= "00111000" else	--07
		"00010010" when SBOXIN ( 7 downto 0)= "00111001" else	--12
		"10000000" when SBOXIN ( 7 downto 0)= "00111010" else	--80
		"11100010" when SBOXIN ( 7 downto 0)= "00111011" else	--E2
		"11101011" when SBOXIN ( 7 downto 0)= "00111100" else	--EB
		"00100111" when SBOXIN ( 7 downto 0)= "00111101" else	--27
		"10110010" when SBOXIN ( 7 downto 0)= "00111110" else	--B2
		"01110101" when SBOXIN ( 7 downto 0)= "00111111" else	--75	
		
		

			---fifth row---
		"00001001" when SBOXIN ( 7 downto 0)= "01000000" else	--09
		"10000011" when SBOXIN ( 7 downto 0)= "01000001" else	--83
		"00101001" when SBOXIN ( 7 downto 0)= "01000010" else	--2C	
		"00011010" when SBOXIN ( 7 downto 0)= "01000011" else	--1A
		"00011011" when SBOXIN ( 7 downto 0)= "01000100" else	--1B
		"01101110" when SBOXIN ( 7 downto 0)= "01000101" else	--6E
		"01011010" when SBOXIN ( 7 downto 0)= "01000110" else	--5A
		"10100000" when SBOXIN ( 7 downto 0)= "01000111" else	--A0
		"01010010" when SBOXIN ( 7 downto 0)= "01001000" else	--52
		"00111011" when SBOXIN ( 7 downto 0)= "01001001" else	--3B
		"11010110" when SBOXIN ( 7 downto 0)= "01001010" else	--D6
		"10110011" when SBOXIN ( 7 downto 0)= "01001011" else	--B3
		"00101001" when SBOXIN ( 7 downto 0)= "01001100" else	--29
		"11100011" when SBOXIN ( 7 downto 0)= "01001101" else	--E3
		"00101111" when SBOXIN ( 7 downto 0)= "01001110" else	--2F
		"10000100" when SBOXIN ( 7 downto 0)= "01001111" else	--84

			    --sixth row
		    "01010011" when SBOXIN ( 7 downto 0)= "01010000" else --53 
		    "11010001" when SBOXIN ( 7 downto 0)= "01010001" else --D1 
		    "00000000" when SBOXIN ( 7 downto 0)= "01010010" else --00 
		    "11101101" when SBOXIN ( 7 downto 0)= "01010011" else --ED 
		    "00100000" when SBOXIN ( 7 downto 0)= "01010100" else --20 
		    "11111100" when SBOXIN ( 7 downto 0)= "01010101" else --FC 
		    "10110001" when SBOXIN ( 7 downto 0)= "01010110" else --B1 
		    "01011011" when SBOXIN ( 7 downto 0)= "01010111" else --5B 
		    "01101010" when SBOXIN ( 7 downto 0)= "01011000" else --6A 
		    "11001011" when SBOXIN ( 7 downto 0)= "01011001" else --CB 
		    "10111110" when SBOXIN ( 7 downto 0)= "01011010" else --BE 
		    "00111001" when SBOXIN ( 7 downto 0)= "01011011" else --39 
		    "01001010" when SBOXIN ( 7 downto 0)= "01011100" else --4A 
		    "01001100" when SBOXIN ( 7 downto 0)= "01011101" else --4C 
		    "01011000" when SBOXIN ( 7 downto 0)= "01011110" else --58
		    "11001111" when SBOXIN ( 7 downto 0)= "01011111" else --CF 

			    --seventh row
		    "11010000" when SBOXIN ( 7 downto 0)= "01100000" else --D0 
		    "11101111" when SBOXIN ( 7 downto 0)= "01100001" else --EF 
		    "10101010" when SBOXIN ( 7 downto 0)= "01100010" else --AA 
		    "11111011" when SBOXIN ( 7 downto 0)= "01100011" else --FB 
		    "01000011" when SBOXIN ( 7 downto 0)= "01100100" else --43 
		    "01001101" when SBOXIN ( 7 downto 0)= "01100101" else --4D 
		    "00110011" when SBOXIN ( 7 downto 0)= "01100110" else --33 
		    "10000101" when SBOXIN ( 7 downto 0)= "01100111" else --85 
		    "01000101" when SBOXIN ( 7 downto 0)= "01101000" else --45 
		    "11111001" when SBOXIN ( 7 downto 0)= "01101001" else --F9 
		    "00000010" when SBOXIN ( 7 downto 0)= "01101010" else --02 
		    "01111111" when SBOXIN ( 7 downto 0)= "01101011" else --7F 
		    "01010000" when SBOXIN ( 7 downto 0)= "01101100" else --50 
		    "00111100" when SBOXIN ( 7 downto 0)= "01101101" else --3C 
		    "10011111" when SBOXIN ( 7 downto 0)= "01101110" else --9F 
		    "10101000" when SBOXIN ( 7 downto 0)= "01101111" else --A8 

			    --eighth row
		    "01010001" when SBOXIN ( 7 downto 0)= "01110000" else --51
		    "10100011" when SBOXIN ( 7 downto 0)= "01110001" else --A3
		    "01000000" when SBOXIN ( 7 downto 0)= "01110010" else --40
		    "10001111" when SBOXIN ( 7 downto 0)= "01110011" else --8F
		    "10010010" when SBOXIN ( 7 downto 0)= "01110100" else --92
		    "10011101" when SBOXIN ( 7 downto 0)= "01110101" else --9D
		    "00111000" when SBOXIN ( 7 downto 0)= "01110110" else --38
		    "11110101" when SBOXIN ( 7 downto 0)= "01110111" else --F5
		    "10111100" when SBOXIN ( 7 downto 0)= "01111000" else --BC
		    "10110110" when SBOXIN ( 7 downto 0)= "01111001" else --B6
		    "11011010" when SBOXIN ( 7 downto 0)= "01111010" else --DA
		    "00100001" when SBOXIN ( 7 downto 0)= "01111011" else --21
		    "00010000" when SBOXIN ( 7 downto 0)= "01111100" else --10
		    "11111111" when SBOXIN ( 7 downto 0)= "01111101" else --FF
		    "11110011" when SBOXIN ( 7 downto 0)= "01111110" else --F3
		    "11010010" when SBOXIN ( 7 downto 0)= "01111111" else --D2

			    --ninth row
		    "11001101" when SBOXIN ( 7 downto 0)= "10000000" else --CD 
		    "00001100" when SBOXIN ( 7 downto 0)= "10000001" else --0C 
		    "00010011" when SBOXIN ( 7 downto 0)= "10000010" else --13 
		    "11101100" when SBOXIN ( 7 downto 0)= "10000011" else --EC 
		    "01011111" when SBOXIN ( 7 downto 0)= "10000100" else --5F 
		    "10010111" when SBOXIN ( 7 downto 0)= "10000101" else --97 
		    "01000100" when SBOXIN ( 7 downto 0)= "10000110" else --44 
		    "00010111" when SBOXIN ( 7 downto 0)= "10000111" else --17 
		    "11000100" when SBOXIN ( 7 downto 0)= "10001000" else --C4 
		    "10100111" when SBOXIN ( 7 downto 0)= "10001001" else --A7 
		    "01111110" when SBOXIN ( 7 downto 0)= "10001010" else --7E 
		    "00111101" when SBOXIN ( 7 downto 0)= "10001011" else --3D 
		    "01100100" when SBOXIN ( 7 downto 0)= "10001100" else --64 
		    "01011101" when SBOXIN ( 7 downto 0)= "10001101" else --5D 
		    "00011001" when SBOXIN ( 7 downto 0)= "10001110" else --19 
		    "01110011" when SBOXIN ( 7 downto 0)= "10001111" else --73 

			    --tenth row
		    "01100000" when SBOXIN ( 7 downto 0)= "10010000" else --60 
		    "10000001" when SBOXIN ( 7 downto 0)= "10010001" else --81 
		    "01001111" when SBOXIN ( 7 downto 0)= "10010010" else --4F 
		    "11011100" when SBOXIN ( 7 downto 0)= "10010011" else --DC 
		    "00100010" when SBOXIN ( 7 downto 0)= "10010100" else --22 
		    "00101010" when SBOXIN ( 7 downto 0)= "10010101" else --2A 
		    "10010000" when SBOXIN ( 7 downto 0)= "10010110" else --90 
		    "10001000" when SBOXIN ( 7 downto 0)= "10010111" else --88 
		    "01000110" when SBOXIN ( 7 downto 0)= "10011000" else --46 
		    "11101110" when SBOXIN ( 7 downto 0)= "10011001" else --EE 
		    "10111000" when SBOXIN ( 7 downto 0)= "10011010" else --B8
		    "00010100" when SBOXIN ( 7 downto 0)= "10011011" else --14 
		    "11011110" when SBOXIN ( 7 downto 0)= "10011100" else --DE
		    "01011110" when SBOXIN ( 7 downto 0)= "10011101" else --5E 
		    "00001011" when SBOXIN ( 7 downto 0)= "10011110" else --0B
		    "11011011" when SBOXIN ( 7 downto 0)= "10011111" else --DB 

			    --eleventh row
		    "11100000" when SBOXIN ( 7 downto 0)= "10100000" else --E0 
		    "00110010" when SBOXIN ( 7 downto 0)= "10100001" else --32 
		    "00111010" when SBOXIN ( 7 downto 0)= "10100010" else --3A 
		    "00001010" when SBOXIN ( 7 downto 0)= "10100011" else --0A 
		    "01001001" when SBOXIN ( 7 downto 0)= "10100100" else --49 
		    "00000110" when SBOXIN ( 7 downto 0)= "10100101" else --06 
		    "00100100" when SBOXIN ( 7 downto 0)= "10100110" else --24 
		    "01011100" when SBOXIN ( 7 downto 0)= "10100111" else --5C 
		    "11000010" when SBOXIN ( 7 downto 0)= "10101000" else --C2 
		    "11010011" when SBOXIN ( 7 downto 0)= "10101001" else --D3 
		    "10101100" when SBOXIN ( 7 downto 0)= "10101010" else --AC 
		    "01100010" when SBOXIN ( 7 downto 0)= "10101011" else --62 
		    "10010001" when SBOXIN ( 7 downto 0)= "10101100" else --91 
		    "10010101" when SBOXIN ( 7 downto 0)= "10101101" else --95 
		    "11100100" when SBOXIN ( 7 downto 0)= "10101110" else --E4 
		    "01111001" when SBOXIN ( 7 downto 0)= "10101111" else --79 

			    --twelveth row
		    "11100111" when SBOXIN ( 7 downto 0)= "10110000" else --E7 
		    "11001000" when SBOXIN ( 7 downto 0)= "10110001" else --C8 
		    "00110111" when SBOXIN ( 7 downto 0)= "10110010" else --37 
		    "01101101" when SBOXIN ( 7 downto 0)= "10110011" else --6D 
		    "10001101" when SBOXIN ( 7 downto 0)= "10110100" else --8D 
		    "11010101" when SBOXIN ( 7 downto 0)= "10110101" else --D5 
		    "01001110" when SBOXIN ( 7 downto 0)= "10110110" else --4E 
		    "10101001" when SBOXIN ( 7 downto 0)= "10110111" else --A9 
		    "01101100" when SBOXIN ( 7 downto 0)= "10111000" else --6C 
		    "01010110" when SBOXIN ( 7 downto 0)= "10111001" else --56 
		    "11110100" when SBOXIN ( 7 downto 0)= "10111010" else --F4 
		    "11101010" when SBOXIN ( 7 downto 0)= "10111011" else --EA 
		    "01100101" when SBOXIN ( 7 downto 0)= "10111100" else --65 
		    "01111010" when SBOXIN ( 7 downto 0)= "10111101" else --7A 
		    "10101110" when SBOXIN ( 7 downto 0)= "10111110" else --AE 
		    "00001000" when SBOXIN ( 7 downto 0)= "10111111" else --08 

			    --thirteenth row
		    "10111010" when SBOXIN ( 7 downto 0)= "11000000" else --BA 
		    "01111000" when SBOXIN ( 7 downto 0)= "11000001" else --78 
		    "00100101" when SBOXIN ( 7 downto 0)= "11000010" else --25 
		    "00101110" when SBOXIN ( 7 downto 0)= "11000011" else --2E 
		    "00011100" when SBOXIN ( 7 downto 0)= "11000100" else --1C
		    "10100110" when SBOXIN ( 7 downto 0)= "11000101" else --A6 
		    "10110100" when SBOXIN ( 7 downto 0)= "11000110" else --B4 
		    "11000110" when SBOXIN ( 7 downto 0)= "11000111" else --C6 
		    "11101000" when SBOXIN ( 7 downto 0)= "11001000" else --E8 
		    "11011101" when SBOXIN ( 7 downto 0)= "11001001" else --DD 
		    "01110100" when SBOXIN ( 7 downto 0)= "11001010" else --74 
		    "00011111" when SBOXIN ( 7 downto 0)= "11001011" else --1F 
		    "01001011" when SBOXIN ( 7 downto 0)= "11001100" else --4B 
		    "10111101" when SBOXIN ( 7 downto 0)= "11001101" else --BD 
		    "10001011" when SBOXIN ( 7 downto 0)= "11001110" else --8B 
		    "10001010" when SBOXIN ( 7 downto 0)= "11001111" else --8A 

			    --fourteenth row
		    "01110000" when SBOXIN ( 7 downto 0)= "11010000" else --70 
		    "00111110" when SBOXIN ( 7 downto 0)= "11010001" else --3E 
		    "10110101" when SBOXIN ( 7 downto 0)= "11010010" else --B5 
		    "01100110" when SBOXIN ( 7 downto 0)= "11010011" else --66 
		    "01001000" when SBOXIN ( 7 downto 0)= "11010100" else --48 
		    "00000011" when SBOXIN ( 7 downto 0)= "11010101" else --03 
		    "11110110" when SBOXIN ( 7 downto 0)= "11010110" else --F6 
		    "00001110" when SBOXIN ( 7 downto 0)= "11010111" else --0E 
		    "01100001" when SBOXIN ( 7 downto 0)= "11011000" else --61 
		    "00110101" when SBOXIN ( 7 downto 0)= "11011001" else --35 
		    "01010111" when SBOXIN ( 7 downto 0)= "11011010" else --57 
		    "10111001" when SBOXIN ( 7 downto 0)= "11011011" else --B9 
		    "10000110" when SBOXIN ( 7 downto 0)= "11011100" else --86 
		    "11000001" when SBOXIN ( 7 downto 0)= "11011101" else --C1 
		    "00011101" when SBOXIN ( 7 downto 0)= "11011110" else --1D 
		    "10011110" when SBOXIN ( 7 downto 0)= "11011111" else --9E 
		
			    --fifteenth row
		    "11100001" when SBOXIN ( 7 downto 0)= "11100000" else --E1 
		    "11111000" when SBOXIN ( 7 downto 0)= "11100001" else --F8 
		    "10011000" when SBOXIN ( 7 downto 0)= "11100010" else --98 
		    "00010001" when SBOXIN ( 7 downto 0)= "11100011" else --11 
		    "01101001" when SBOXIN ( 7 downto 0)= "11100100" else --69 
		    "11011001" when SBOXIN ( 7 downto 0)= "11100101" else --D9 
		    "10001110" when SBOXIN ( 7 downto 0)= "11100110" else --8E
		    "10010100" when SBOXIN ( 7 downto 0)= "11100111" else --94 
		    "10011011" when SBOXIN ( 7 downto 0)= "11101000" else --9B 
		    "00011110" when SBOXIN ( 7 downto 0)= "11101001" else --1E 
		    "10000111" when SBOXIN ( 7 downto 0)= "11101010" else --87 
		    "11101001" when SBOXIN ( 7 downto 0)= "11101011" else --E9 
		    "11001110" when SBOXIN ( 7 downto 0)= "11101100" else --CE 
		    "01010101" when SBOXIN ( 7 downto 0)= "11101101" else --55 
		    "00101000" when SBOXIN ( 7 downto 0)= "11101110" else --28 
		    "11011111" when SBOXIN ( 7 downto 0)= "11101111" else --DF

			---sixteenth row--- 

 		    "10001100" when SBOXIN ( 7 downto 0)= "11110000" else --8C 
		    "10100001" when SBOXIN ( 7 downto 0)= "11110001" else --A1 
		    "10001001" when SBOXIN ( 7 downto 0)= "11110010" else --89 
		    "00001101" when SBOXIN ( 7 downto 0)= "11110011" else --0D 
		    "10111111" when SBOXIN ( 7 downto 0)= "11110100" else --BF 
		    "11100110" when SBOXIN ( 7 downto 0)= "11110101" else --E6 
		    "01000010" when SBOXIN ( 7 downto 0)= "11110110" else --42
		    "01101000" when SBOXIN ( 7 downto 0)= "11110111" else --68 
		    "01000001" when SBOXIN ( 7 downto 0)= "11111000" else --41 
		    "10011001" when SBOXIN ( 7 downto 0)= "11111001" else --99 
		    "00101101" when SBOXIN ( 7 downto 0)= "11111010" else --2D 
		    "00001111" when SBOXIN ( 7 downto 0)= "11111011" else --0F 
		    "10110000" when SBOXIN ( 7 downto 0)= "11111100" else --B0 
		    "01010100" when SBOXIN ( 7 downto 0)= "11111101" else --54 
		    "10111011" when SBOXIN ( 7 downto 0)= "11111110" else --BB 
		    "00010110" when SBOXIN ( 7 downto 0)= "11111111";--16


		    
		   
end SBOX_STR;

