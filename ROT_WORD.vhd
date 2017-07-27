library ieee;
use ieee.std_logic_1164.all;

entity ROT_WORD is
  port( IN_RWORD: in std_logic_vector( 31 downto 0);
            OUT_WORD: out std_logic_vector( 31 downto 0));
            
          end ROT_WORD;
          
          architecture ROT_WORD_STR of ROT_WORD is
            type MATR_ID is array (3 downto 0) of std_logic_vector(7 downto 0);
            signal INMAT, OUTMAT:MATR_ID;
            
            begin
              process(IN_RWORD)
                begin
              
              for i in 3 downto 0 loop
              INMAT( 3-i)<= IN_RWORD(31-8*i downto 24-8*i);
            end loop;
          end process;
          
          
          OUTMAT(0)<= INMAT(3);
          OUTMAT(3)<= INMAT(2);
          OUTMAT(2)<= INMAT(1);
          OUTMAT(1)<= INMAT(0);
          
          OUT_WORD(31 downto 24)<=OUTMAT(3);
          OUT_WORD(23 downto 16)<=OUTMAT(2);
          OUT_WORD(15 downto 8)<=OUTMAT(1);
          OUT_WORD(7 downto 0)<=OUTMAT(0);
          
        end ROT_WORD_STR;
