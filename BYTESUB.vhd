library ieee;
use ieee.std_logic_1164.all;

entity BYTESUB is
  port( IN_BYTESUB: in std_logic_vector( 127 downto 0);
        OUT_BYTESUB: out std_logic_vector( 127 downto 0)
      );
    end BYTESUB;
    
  architecture BYTESUB_STR of BYTESUB is
 
  component SBOX is 
  	port( SBOXIN: in std_logic_vector( 7 downto 0);	--- 8 bits input
	      SBOXOUT: out std_logic_vector( 7 downto 0 )	--- 8 bits output
	     );
	     end component; 
 
	    begin
    
    
    X0: SBOX port map ( IN_BYTESUB(7 downto 0), OUT_BYTESUB( 7 downto 0));
    X1: SBOX port map ( IN_BYTESUB(15 downto 8), OUT_BYTESUB( 15 downto 8));
    X2: SBOX port map ( IN_BYTESUB(23 downto 16), OUT_BYTESUB( 23 downto 16));
    X3: SBOX port map ( IN_BYTESUB(31 downto 24), OUT_BYTESUB( 31 downto 24));
    X4: SBOX port map ( IN_BYTESUB(39 downto 32), OUT_BYTESUB( 39 downto 32));
    X5: SBOX port map ( IN_BYTESUB(47 downto 40), OUT_BYTESUB( 47 downto 40));
    X6: SBOX port map ( IN_BYTESUB(55 downto 48), OUT_BYTESUB( 55 downto 48));
    X7: SBOX port map ( IN_BYTESUB(63 downto 56), OUT_BYTESUB( 63 downto 56));
    X8: SBOX port map ( IN_BYTESUB(71 downto 64), OUT_BYTESUB( 71 downto 64));
    X9: SBOX port map ( IN_BYTESUB(79 downto 72), OUT_BYTESUB( 79 downto 72));
    X10: SBOX port map ( IN_BYTESUB(87 downto 80), OUT_BYTESUB( 87 downto 80));
    X11: SBOX port map ( IN_BYTESUB(95 downto 88), OUT_BYTESUB( 95 downto 88));
    X12: SBOX port map ( IN_BYTESUB(103 downto 96), OUT_BYTESUB( 103 downto 96));
    X13: SBOX port map ( IN_BYTESUB(111 downto 104), OUT_BYTESUB( 111 downto 104));
    X14: SBOX port map ( IN_BYTESUB(119 downto 112), OUT_BYTESUB( 119 downto 112));
    X15: SBOX port map ( IN_BYTESUB(127 downto 120), OUT_BYTESUB( 127 downto 120));
      
      
      
    end BYTESUB_STR;

