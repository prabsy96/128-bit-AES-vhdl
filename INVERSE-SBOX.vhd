----INVERSE S-BOX LOOKUP TABLE------


library ieee;
use ieee.std_logic_1164.all; 

entity INV_SBOX is
	port( INVSBOXIN: in std_logic_vector( 7 downto 0);	--- 8 bits input
	      INVSBOXOUT: out std_logic_vector( 7 downto 0 )	--- 8 bits output
	     );
end INV_SBOX;
architecture INV_SBOX_STR of INV_SBOX is
	begin
	  
	INVSBOXOUT ( 7 downto 0)<=	
			
			---first row---
		"01010010" when INVSBOXIN ( 7 downto 0)= "00000000" else	--52
		"00001001" when INVSBOXIN ( 7 downto 0)= "00000001" else	--09
		"01101010" when INVSBOXIN ( 7 downto 0)= "00000010" else	--6A	
		"11010101" when INVSBOXIN ( 7 downto 0)= "00000011" else	--D5
		"00110000" when INVSBOXIN ( 7 downto 0)= "00000100" else	--30
		"00110110" when INVSBOXIN ( 7 downto 0)= "00000101" else	--36
		"10100101" when INVSBOXIN ( 7 downto 0)= "00000110" else	--A5
		"00111000" when INVSBOXIN ( 7 downto 0)= "00000111" else	--38
		"10111111" when INVSBOXIN ( 7 downto 0)= "00001000" else	--BF
		"01000000" when INVSBOXIN ( 7 downto 0)= "00001001" else	--40
		"10100011" when INVSBOXIN ( 7 downto 0)= "00001010" else	--A3
		"10011110" when INVSBOXIN ( 7 downto 0)= "00001011" else	--9E
		"10000001" when INVSBOXIN ( 7 downto 0)= "00001100" else	--81
		"11110011" when INVSBOXIN ( 7 downto 0)= "00001101" else	--F3
		"11010111" when INVSBOXIN ( 7 downto 0)= "00001110" else	--D7
		"11111011" when INVSBOXIN ( 7 downto 0)= "00001111" else	--FB	

			---second row---
		"01111100" when INVSBOXIN ( 7 downto 0)= "00010000" else	--7C
		"11100011" when INVSBOXIN ( 7 downto 0)= "00010001" else	--E3
		"00111001" when INVSBOXIN ( 7 downto 0)= "00010010" else	--39	
		"10000010" when INVSBOXIN ( 7 downto 0)= "00010011" else	--82
		"10011011" when INVSBOXIN ( 7 downto 0)= "00010100" else	--9B
		"00101111" when INVSBOXIN ( 7 downto 0)= "00010101" else	--2F
		"11111111" when INVSBOXIN ( 7 downto 0)= "00010110" else	--FF
		"10001111" when INVSBOXIN ( 7 downto 0)= "00010111" else	--87
		"00110100" when INVSBOXIN ( 7 downto 0)= "00011000" else	--34
		"10001110" when INVSBOXIN ( 7 downto 0)= "00011001" else	--8E
		"01000011" when INVSBOXIN ( 7 downto 0)= "00011010" else	--43
		"01000100" when INVSBOXIN ( 7 downto 0)= "00011011" else	--44
		"11000100" when INVSBOXIN ( 7 downto 0)= "00011100" else	--C4
		"11011110" when INVSBOXIN ( 7 downto 0)= "00011101" else	--DE
		"11101001" when INVSBOXIN ( 7 downto 0)= "00011110" else	--E9
		"11001011" when INVSBOXIN ( 7 downto 0)= "00011111" else	--CB
		
			---third row---
		"01010100" when INVSBOXIN ( 7 downto 0)= "00100000" else	--54
		"01111011" when INVSBOXIN ( 7 downto 0)= "00100001" else	--7B
		"10010100" when INVSBOXIN ( 7 downto 0)= "00100010" else	--94	
		"00110010" when INVSBOXIN ( 7 downto 0)= "00100011" else	--32
		"10100110" when INVSBOXIN ( 7 downto 0)= "00100100" else	--A6
		"11000010" when INVSBOXIN ( 7 downto 0)= "00100101" else	--C2
		"00100011" when INVSBOXIN ( 7 downto 0)= "00100110" else	--23
		"00111101" when INVSBOXIN ( 7 downto 0)= "00100111" else	--3D
		"11101110" when INVSBOXIN ( 7 downto 0)= "00101000" else	--EE
		"01001100" when INVSBOXIN ( 7 downto 0)= "00101001" else	--4C
		"10010101" when INVSBOXIN ( 7 downto 0)= "00101010" else	--95
		"00001011" when INVSBOXIN ( 7 downto 0)= "00101011" else	--0B
		"01000010" when INVSBOXIN ( 7 downto 0)= "00101100" else	--42
		"11111010" when INVSBOXIN ( 7 downto 0)= "00101101" else	--FA
		"11000011" when INVSBOXIN ( 7 downto 0)= "00101110" else	--C3
		"01001110" when INVSBOXIN ( 7 downto 0)= "00101111" else	--4E	

			---fourth row---
		"00001000" when INVSBOXIN ( 7 downto 0)= "00110000" else	--08
		"00101110" when INVSBOXIN ( 7 downto 0)= "00110001" else	--2E
		"10100001" when INVSBOXIN ( 7 downto 0)= "00110010" else	--A1	
		"01100110" when INVSBOXIN ( 7 downto 0)= "00110011" else	--66
		"00101000" when INVSBOXIN ( 7 downto 0)= "00110100" else	--28
		"11011001" when INVSBOXIN ( 7 downto 0)= "00110101" else	--D9
		"00100100" when INVSBOXIN ( 7 downto 0)= "00110110" else	--24
		"10110010" when INVSBOXIN ( 7 downto 0)= "00110111" else	--B2
		"01110110" when INVSBOXIN ( 7 downto 0)= "00111000" else	--76
		"01011011" when INVSBOXIN ( 7 downto 0)= "00111001" else	--5B
		"10100010" when INVSBOXIN ( 7 downto 0)= "00111010" else	--A2
		"01001001" when INVSBOXIN ( 7 downto 0)= "00111011" else	--49
		"01101101" when INVSBOXIN ( 7 downto 0)= "00111100" else	--6D
		"10001011" when INVSBOXIN ( 7 downto 0)= "00111101" else	--8B
		"11010001" when INVSBOXIN ( 7 downto 0)= "00111110" else	--D1
		"00100101" when INVSBOXIN ( 7 downto 0)= "00111111" else	--25	
		
		

			---fifth row---
		"01110010" when INVSBOXIN ( 7 downto 0)= "01000000" else	--72
		"11111000" when INVSBOXIN ( 7 downto 0)= "01000001" else	--F8
		"11110110" when INVSBOXIN ( 7 downto 0)= "01000010" else	--F6	
		"01100100" when INVSBOXIN ( 7 downto 0)= "01000011" else	--64
		"10000110" when INVSBOXIN ( 7 downto 0)= "01000100" else	--86
		"01101000" when INVSBOXIN ( 7 downto 0)= "01000101" else	--68
		"10011000" when INVSBOXIN ( 7 downto 0)= "01000110" else	--98
		"00010110" when INVSBOXIN ( 7 downto 0)= "01000111" else	--16
		"11010100" when INVSBOXIN ( 7 downto 0)= "01001000" else	--D4
		"10100100" when INVSBOXIN ( 7 downto 0)= "01001001" else	--A4
		"01011100" when INVSBOXIN ( 7 downto 0)= "01001010" else	--5C
		"11001100" when INVSBOXIN ( 7 downto 0)= "01001011" else	--CC
		"01011101" when INVSBOXIN ( 7 downto 0)= "01001100" else	--5D
		"01100101" when INVSBOXIN ( 7 downto 0)= "01001101" else	--65
		"10110110" when INVSBOXIN ( 7 downto 0)= "01001110" else	--B6
		"10010010" when INVSBOXIN ( 7 downto 0)= "01001111" else	--92

			    --sixth row
		    "01101100" when INVSBOXIN ( 7 downto 0)= "01010000" else --6C 
		    "01110000" when INVSBOXIN ( 7 downto 0)= "01010001" else --70 
		    "01001000" when INVSBOXIN ( 7 downto 0)= "01010010" else --48 
		    "01010000" when INVSBOXIN ( 7 downto 0)= "01010011" else --50 
		    "11111101" when INVSBOXIN ( 7 downto 0)= "01010100" else --FD 
		    "11101101" when INVSBOXIN ( 7 downto 0)= "01010101" else --ED 
		    "10111001" when INVSBOXIN ( 7 downto 0)= "01010110" else --B9 
		    "11011010" when INVSBOXIN ( 7 downto 0)= "01010111" else --DA 
		    "01101110" when INVSBOXIN ( 7 downto 0)= "01011000" else --5E 
		    "00010101" when INVSBOXIN ( 7 downto 0)= "01011001" else --15 
		    "01000110" when INVSBOXIN ( 7 downto 0)= "01011010" else --46 
		    "01010111" when INVSBOXIN ( 7 downto 0)= "01011011" else --57 
		    "10100111" when INVSBOXIN ( 7 downto 0)= "01011100" else --A7 
		    "10001101" when INVSBOXIN ( 7 downto 0)= "01011101" else --8D 
		    "10011101" when INVSBOXIN ( 7 downto 0)= "01011110" else --9D
		    "10000100" when INVSBOXIN ( 7 downto 0)= "01011111" else --84 

			    --seventh row
		    "10010000" when INVSBOXIN ( 7 downto 0)= "01100000" else --90 
		    "11011000" when INVSBOXIN ( 7 downto 0)= "01100001" else --D8 
		    "10101011" when INVSBOXIN ( 7 downto 0)= "01100010" else --AB 
		    "00000000" when INVSBOXIN ( 7 downto 0)= "01100011" else --00 
		    "10001100" when INVSBOXIN ( 7 downto 0)= "01100100" else --8C 
		    "10111100" when INVSBOXIN ( 7 downto 0)= "01100101" else --BC 
		    "11010011" when INVSBOXIN ( 7 downto 0)= "01100110" else --D3 
		    "00001010" when INVSBOXIN ( 7 downto 0)= "01100111" else --0A 
		    "11110111" when INVSBOXIN ( 7 downto 0)= "01101000" else --F7 
		    "11100100" when INVSBOXIN ( 7 downto 0)= "01101001" else --E4 
		    "01011000" when INVSBOXIN ( 7 downto 0)= "01101010" else --58 
		    "00000101" when INVSBOXIN ( 7 downto 0)= "01101011" else --05 
		    "10111000" when INVSBOXIN ( 7 downto 0)= "01101100" else --B8 
		    "10110011" when INVSBOXIN ( 7 downto 0)= "01101101" else --B3 
		    "01000101" when INVSBOXIN ( 7 downto 0)= "01101110" else --45 
		    "00000110" when INVSBOXIN ( 7 downto 0)= "01101111" else --06 

			    --eighth row
		    "11010000" when INVSBOXIN ( 7 downto 0)= "01110000" else --D0
		    "00101100" when INVSBOXIN ( 7 downto 0)= "01110001" else --2C
		    "00011110" when INVSBOXIN ( 7 downto 0)= "01110010" else --1E
		    "10001111" when INVSBOXIN ( 7 downto 0)= "01110011" else --8F
		    "11001010" when INVSBOXIN ( 7 downto 0)= "01110100" else --CA
		    "00111111" when INVSBOXIN ( 7 downto 0)= "01110101" else --3F
		    "00001111" when INVSBOXIN ( 7 downto 0)= "01110110" else --0F
		    "00000010" when INVSBOXIN ( 7 downto 0)= "01110111" else --02
		    "11000001" when INVSBOXIN ( 7 downto 0)= "01111000" else --C1
		    "10101111" when INVSBOXIN ( 7 downto 0)= "01111001" else --AF
		    "10111101" when INVSBOXIN ( 7 downto 0)= "01111010" else --BD
		    "00000011" when INVSBOXIN ( 7 downto 0)= "01111011" else --03
		    "00000001" when INVSBOXIN ( 7 downto 0)= "01111100" else --01
		    "00010011" when INVSBOXIN ( 7 downto 0)= "01111101" else --13
		    "10001010" when INVSBOXIN ( 7 downto 0)= "01111110" else --8A
		    "01101011" when INVSBOXIN ( 7 downto 0)= "01111111" else --6B

			    --ninth row
		    "00111010" when INVSBOXIN ( 7 downto 0)= "10000000" else --3A 
		    "10010001" when INVSBOXIN ( 7 downto 0)= "10000001" else --91 
		    "00010001" when INVSBOXIN ( 7 downto 0)= "10000010" else --11 
		    "01000001" when INVSBOXIN ( 7 downto 0)= "10000011" else --41 
		    "01001111" when INVSBOXIN ( 7 downto 0)= "10000100" else --4F 
		    "01100111" when INVSBOXIN ( 7 downto 0)= "10000101" else --67 
		    "11011100" when INVSBOXIN ( 7 downto 0)= "10000110" else --DC 
		    "11101010" when INVSBOXIN ( 7 downto 0)= "10000111" else --EA 
		    "10010111" when INVSBOXIN ( 7 downto 0)= "10001000" else --97 
		    "11110010" when INVSBOXIN ( 7 downto 0)= "10001001" else --F2 
		    "11001111" when INVSBOXIN ( 7 downto 0)= "10001010" else --CF 
		    "11001110" when INVSBOXIN ( 7 downto 0)= "10001011" else --CE 
		    "11110000" when INVSBOXIN ( 7 downto 0)= "10001100" else --F0 
		    "10110100" when INVSBOXIN ( 7 downto 0)= "10001101" else --B4 
		    "11100110" when INVSBOXIN ( 7 downto 0)= "10001110" else --E6 
		    "01110011" when INVSBOXIN ( 7 downto 0)= "10001111" else --73 

			    --tenth row
		    "10010110" when INVSBOXIN ( 7 downto 0)= "10010000" else --96 
		    "10101100" when INVSBOXIN ( 7 downto 0)= "10010001" else --AC 
		    "01110100" when INVSBOXIN ( 7 downto 0)= "10010010" else --74 
		    "00100010" when INVSBOXIN ( 7 downto 0)= "10010011" else --22 
		    "11100111" when INVSBOXIN ( 7 downto 0)= "10010100" else --E7 
		    "10101101" when INVSBOXIN ( 7 downto 0)= "10010101" else --AD 
		    "00110101" when INVSBOXIN ( 7 downto 0)= "10010110" else --35 
		    "10000101" when INVSBOXIN ( 7 downto 0)= "10010111" else --85 
		    "11100010" when INVSBOXIN ( 7 downto 0)= "10011000" else --E2 
		    "11111001" when INVSBOXIN ( 7 downto 0)= "10011001" else --F9 
		    "00110111" when INVSBOXIN ( 7 downto 0)= "10011010" else --37
		    "11101000" when INVSBOXIN ( 7 downto 0)= "10011011" else --E8 
		    "00011100" when INVSBOXIN ( 7 downto 0)= "10011100" else --1C
		    "01110101" when INVSBOXIN ( 7 downto 0)= "10011101" else --75 
		    "11011111" when INVSBOXIN ( 7 downto 0)= "10011110" else --DF
		    "01101110" when INVSBOXIN ( 7 downto 0)= "10011111" else --6E 

			    --eleventh row
		    "01000111" when INVSBOXIN ( 7 downto 0)= "10100000" else --47 
		    "11110001" when INVSBOXIN ( 7 downto 0)= "10100001" else --F1 
		    "00011010" when INVSBOXIN ( 7 downto 0)= "10100010" else --1A 
		    "01110001" when INVSBOXIN ( 7 downto 0)= "10100011" else --71 
		    "00011101" when INVSBOXIN ( 7 downto 0)= "10100100" else --1D 
		    "00101001" when INVSBOXIN ( 7 downto 0)= "10100101" else --29 
		    "11000101" when INVSBOXIN ( 7 downto 0)= "10100110" else --C5 
		    "10001001" when INVSBOXIN ( 7 downto 0)= "10100111" else --89 
		    "01101111" when INVSBOXIN ( 7 downto 0)= "10101000" else --6F 
		    "10110111" when INVSBOXIN ( 7 downto 0)= "10101001" else --B7 
		    "01100010" when INVSBOXIN ( 7 downto 0)= "10101010" else --62 
		    "00001110" when INVSBOXIN ( 7 downto 0)= "10101011" else --0E 
		    "10101010" when INVSBOXIN ( 7 downto 0)= "10101100" else --AA 
		    "00011000" when INVSBOXIN ( 7 downto 0)= "10101101" else --18 
		    "10111110" when INVSBOXIN ( 7 downto 0)= "10101110" else --BE 
		    "00011011" when INVSBOXIN ( 7 downto 0)= "10101111" else --1B 

			    --twelveth row
		    "11111100" when INVSBOXIN ( 7 downto 0)= "10110000" else --FC 
		    "01010110" when INVSBOXIN ( 7 downto 0)= "10110001" else --56 
		    "00111110" when INVSBOXIN ( 7 downto 0)= "10110010" else --3E 
		    "01001011" when INVSBOXIN ( 7 downto 0)= "10110011" else --4B 
		    "11000110" when INVSBOXIN ( 7 downto 0)= "10110100" else --C6 
		    "10000010" when INVSBOXIN ( 7 downto 0)= "10110101" else --D2 
		    "01111001" when INVSBOXIN ( 7 downto 0)= "10110110" else --79 
		    "00100000" when INVSBOXIN ( 7 downto 0)= "10110111" else --20 
		    "10011010" when INVSBOXIN ( 7 downto 0)= "10111000" else --9A 
		    "11011011" when INVSBOXIN ( 7 downto 0)= "10111001" else --DB 
		    "11000000" when INVSBOXIN ( 7 downto 0)= "10111010" else --C0 
		    "11111110" when INVSBOXIN ( 7 downto 0)= "10111011" else --FE 
		    "01111000" when INVSBOXIN ( 7 downto 0)= "10111100" else --78 
		    "11001101" when INVSBOXIN ( 7 downto 0)= "10111101" else --CD 
		    "01011010" when INVSBOXIN ( 7 downto 0)= "10111110" else --5A 
		    "11110100" when INVSBOXIN ( 7 downto 0)= "10111111" else --F4 

			    --thirteenth row
		    "00011111" when INVSBOXIN ( 7 downto 0)= "11000000" else --1F 
		    "11011101" when INVSBOXIN ( 7 downto 0)= "11000001" else --DD 
		    "10101000" when INVSBOXIN ( 7 downto 0)= "11000010" else --A8 
		    "00110011" when INVSBOXIN ( 7 downto 0)= "11000011" else --33 
		    "10001000" when INVSBOXIN ( 7 downto 0)= "11000100" else --88
		    "00000111" when INVSBOXIN ( 7 downto 0)= "11000101" else --07 
		    "11000111" when INVSBOXIN ( 7 downto 0)= "11000110" else --C7 
		    "00110001" when INVSBOXIN ( 7 downto 0)= "11000111" else --31 
		    "10110001" when INVSBOXIN ( 7 downto 0)= "11001000" else --B1 
		    "00010010" when INVSBOXIN ( 7 downto 0)= "11001001" else --12 
		    "00010000" when INVSBOXIN ( 7 downto 0)= "11001010" else --10 
		    "01011001" when INVSBOXIN ( 7 downto 0)= "11001011" else --59 
		    "00100111" when INVSBOXIN ( 7 downto 0)= "11001100" else --27 
		    "10001110" when INVSBOXIN ( 7 downto 0)= "11001101" else --8E 
		    "11101100" when INVSBOXIN ( 7 downto 0)= "11001110" else --EC 
		    "01011111" when INVSBOXIN ( 7 downto 0)= "11001111" else --5F 

			    --fourteenth row
		    "01100000" when INVSBOXIN ( 7 downto 0)= "11010000" else --60 
		    "01010001" when INVSBOXIN ( 7 downto 0)= "11010001" else --51 
		    "01111111" when INVSBOXIN ( 7 downto 0)= "11010010" else --7F 
		    "10101001" when INVSBOXIN ( 7 downto 0)= "11010011" else --A9 
		    "00011001" when INVSBOXIN ( 7 downto 0)= "11010100" else --19 
		    "10110101" when INVSBOXIN ( 7 downto 0)= "11010101" else --B5 
		    "01001010" when INVSBOXIN ( 7 downto 0)= "11010110" else --4A 
		    "00001101" when INVSBOXIN ( 7 downto 0)= "11010111" else --0D 
		    "00101101" when INVSBOXIN ( 7 downto 0)= "11011000" else --2D 
		    "11100101" when INVSBOXIN ( 7 downto 0)= "11011001" else --E5 
		    "01111010" when INVSBOXIN ( 7 downto 0)= "11011010" else --7A 
		    "10011111" when INVSBOXIN ( 7 downto 0)= "11011011" else --9F
		    "10010011" when INVSBOXIN ( 7 downto 0)= "11011100" else --93 
		    "11001001" when INVSBOXIN ( 7 downto 0)= "11011101" else --C9 
		    "10011100" when INVSBOXIN ( 7 downto 0)= "11011110" else --9C 
		    "11101111" when INVSBOXIN ( 7 downto 0)= "11011111" else --EF 
		
			    --fifteenth row
		    "10100000" when INVSBOXIN ( 7 downto 0)= "11100000" else --A0 
		    "11100000" when INVSBOXIN ( 7 downto 0)= "11100001" else --E0 
		    "00111011" when INVSBOXIN ( 7 downto 0)= "11100010" else --3B 
		    "01001101" when INVSBOXIN ( 7 downto 0)= "11100011" else --4D 
		    "10101110" when INVSBOXIN ( 7 downto 0)= "11100100" else --AE 
		    "00101010" when INVSBOXIN ( 7 downto 0)= "11100101" else --2A 
		    "11110101" when INVSBOXIN ( 7 downto 0)= "11100110" else --F5
		    "10110000" when INVSBOXIN ( 7 downto 0)= "11100111" else --B0 
		    "11001000" when INVSBOXIN ( 7 downto 0)= "11101000" else --C8 
		    "11101011" when INVSBOXIN ( 7 downto 0)= "11101001" else --EB 
		    "10111011" when INVSBOXIN ( 7 downto 0)= "11101010" else --BB 
		    "00111100" when INVSBOXIN ( 7 downto 0)= "11101011" else --3C 
		    "10000011" when INVSBOXIN ( 7 downto 0)= "11101100" else --83 
		    "01010011" when INVSBOXIN ( 7 downto 0)= "11101101" else --53 
		    "10011001" when INVSBOXIN ( 7 downto 0)= "11101110" else --99 
		    "01100001" when INVSBOXIN ( 7 downto 0)= "11101111" else --61

			---sixteenth row--- 

 		    "00010111" when INVSBOXIN ( 7 downto 0)= "11110000" else --17 
		    "00101011" when INVSBOXIN ( 7 downto 0)= "11110001" else --2B
		    "00000100" when INVSBOXIN ( 7 downto 0)= "11110010" else --04 
		    "01111110" when INVSBOXIN ( 7 downto 0)= "11110011" else --7E 
		    "10111010" when INVSBOXIN ( 7 downto 0)= "11110100" else --BA 
		    "01110111" when INVSBOXIN ( 7 downto 0)= "11110101" else --77 
		    "11010110" when INVSBOXIN ( 7 downto 0)= "11110110" else --D6
		    "00100110" when INVSBOXIN ( 7 downto 0)= "11110111" else --26 
		    "11100001" when INVSBOXIN ( 7 downto 0)= "11111000" else --E1 
		    "01101001" when INVSBOXIN ( 7 downto 0)= "11111001" else --69 
		    "00010100" when INVSBOXIN ( 7 downto 0)= "11111010" else --14 
		    "01100011" when INVSBOXIN ( 7 downto 0)= "11111011" else --63 
		    "01010101" when INVSBOXIN ( 7 downto 0)= "11111100" else --55 
		    "00100001" when INVSBOXIN ( 7 downto 0)= "11111101" else --21 
		    "00001100" when INVSBOXIN ( 7 downto 0)= "11111110" else --0C 
		    "01111101" when INVSBOXIN ( 7 downto 0)= "11111111";--7D


		    
		   
end INV_SBOX_STR;

