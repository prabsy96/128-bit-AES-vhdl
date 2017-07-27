library ieee;
use ieee.std_logic_1164.all;

entity FOURBYTESBOX is
  port ( INB_SBOX: in std_logic_vector( 31 downto 0);
         OUTB_SBOX: out std_logic_vector( 31 downto 0));
         
       end FOURBYTESBOX;
       
      architecture STR of FOURBYTESBOX is
        
        component SBOX is 
          
        port( SBOXIN: in std_logic_vector( 7 downto 0);	
	            SBOXOUT: out std_logic_vector( 7 downto 0 ));
        end component;
        
        begin
          
          FOURBYTE: for i in 3 downto 0 generate
            
            SBOX_MATCH:  SBOX port map( SBOXIN=> INB_SBOX( 8*i+7 downto 8*i), SBOXOUT=> OUTB_SBOX(8*i+7 downto 8*i));
              
            end generate FOURBYTE;
            
          end STR;
              
