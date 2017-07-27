library ieee;
use ieee.std_logic_1164.all;

entity INV_BYTESUB is
  port( INVERSEIN: in std_logic_vector( 127 downto 0);
        INVERSEOUT: out std_logic_vector( 127 downto 0)
      );
    end INV_BYTESUB;
    
  architecture INV_BYTESUB_STR of INV_BYTESUB is
 
  component INV_SBOX is 
  	port( INVSBOXIN: in std_logic_vector( 7 downto 0);	--- 8 bits input
	      INVSBOXOUT: out std_logic_vector( 7 downto 0 )	--- 8 bits output
	     );
	     end component; 
 
	    begin
    
    
    X0: INV_SBOX port map ( INVERSEIN(7 downto 0), INVERSEOUT( 7 downto 0));
    X1: INV_SBOX port map ( INVERSEIN(15 downto 8), INVERSEOUT( 15 downto 8));
    X2: INV_SBOX port map ( INVERSEIN(23 downto 16), INVERSEOUT( 23 downto 16));
    X3: INV_SBOX port map ( INVERSEIN(31 downto 24), INVERSEOUT( 31 downto 24));
    X4: INV_SBOX port map ( INVERSEIN(39 downto 32), INVERSEOUT( 39 downto 32));
    X5: INV_SBOX port map ( INVERSEIN(47 downto 40), INVERSEOUT( 47 downto 40));
    X6: INV_SBOX port map ( INVERSEIN(55 downto 48), INVERSEOUT( 55 downto 48));
    X7: INV_SBOX port map ( INVERSEIN(63 downto 56), INVERSEOUT( 63 downto 56));
    X8: INV_SBOX port map ( INVERSEIN(71 downto 64), INVERSEOUT( 71 downto 64));
    X9: INV_SBOX port map ( INVERSEIN(79 downto 72), INVERSEOUT( 79 downto 72));
    X10: INV_SBOX port map ( INVERSEIN(87 downto 80), INVERSEOUT( 87 downto 80));
    X11: INV_SBOX port map ( INVERSEIN(95 downto 88), INVERSEOUT( 95 downto 88));
    X12: INV_SBOX port map ( INVERSEIN(103 downto 96), INVERSEOUT( 103 downto 96));
    X13: INV_SBOX port map ( INVERSEIN(111 downto 104), INVERSEOUT( 111 downto 104));
    X14: INV_SBOX port map ( INVERSEIN(119 downto 112), INVERSEOUT( 119 downto 112));
    X15: INV_SBOX port map ( INVERSEIN(127 downto 120), INVERSEOUT( 127 downto 120));
      
      
      
    end INV_BYTESUB_STR;
