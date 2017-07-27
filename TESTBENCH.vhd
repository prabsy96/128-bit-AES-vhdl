library ieee;
use ieee.std_logic_1164.all;

entity TESTBENCH is
end TESTBENCH;

architecture BEHAVIOUR of TESTBENCH is

component TOPLEVEL is                                   ------TOP LEVEL
  port( PLAINTEXT0: in std_logic_vector( 127 downto 0);   ---- INPUT 
        KEY0: in std_logic_vector( 127 downto 0);      ---- INPUT KEY
        ROUND_MAIN0: in integer range 0 to 10;
        CONT: in integer range 0 to 1;
        OUT_CIPHER0: out std_logic_vector( 127 downto 0));
  end component; 
  
  signal PLAIN_S, KEY_S, OUT_S: std_logic_vector(127 downto 0);
  signal ROUND_S: integer range 0 to 10;
  signal CONT_S: integer range 0 to 1;
  
begin
  
  X1: TOPLEVEL port map( PLAINTEXT0=>PLAIN_S, KEY0=>KEY_S, ROUND_MAIN0=>ROUND_S, CONT=>CONT_S, OUT_CIPHER0=>OUT_S);
    
     PLAIN_S<= X"0123456789abcdeffedcba9876543210";
      KEY_S<= X"0f1571c947d9e8590cb7add6af7f6798";
    
    TST1: process
    begin
      
     
      ROUND_S<=0;
      CONT_S<=0;
      wait for 5 ns;
      
      
      ROUND_S<=1;
      wait for 5 ns;
      
      ROUND_S<=2;
      wait for 5 ns;
      
      ROUND_S<=3;
      wait for 5 ns;
      
      ROUND_S<=4;
      wait for 5 ns;
      
      ROUND_S<=5;
      wait for 5 ns;
      
      ROUND_S<=6;
      wait for 5 ns;
      
      ROUND_S<=7;
      wait for 5 ns;
      
      ROUND_S<=8;
      wait for 5 ns;
      
      ROUND_S<=9;
      wait for 5 ns;
      
      ROUND_S<=10;
      wait for 5 ns;
   
      CONT_S<=1;
      ROUND_S<=0;
      wait for 5 ns;
      
      ROUND_S<=1;
      wait for 5 ns;
      
      ROUND_S<=2;
      wait for 5 ns;
      
      ROUND_S<=3;
      wait for 5 ns;
      
      ROUND_S<=4;
      wait for 5 ns;
      
      ROUND_S<=5;
      wait for 5 ns;
      
      ROUND_S<=6;
      wait for 5 ns;
      
      ROUND_S<=7;
      wait for 5 ns;
      
      ROUND_S<=8;
      wait for 5 ns;
      
      ROUND_S<=9;
      wait for 5 ns;
      
      ROUND_S<=10;
      wait for 5 ns;
      
 
      
    end process;
  end BEHAVIOUR;
      
