---MIX COLUMNS---


library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity MIX_COLUMNS is 
  port( IN_MCOL: in std_logic_vector( 127 downto 0);
        OUT_MCOL: out std_logic_vector( 127 downto 0)
      );
    end MIX_COLUMNS;
    
    architecture MCOL_STR of MIX_COLUMNS is 
    
    
    
    type MATRIX_IDX is array(15 downto 0) of std_logic_vector( 7 downto 0);
    type SHIFT is array ( 15 downto 0) of std_logic_vector ( 8 downto 0);
    signal TEMP, TWOMULT_MAT, THREEMULT_MAT: SHIFT;
    signal MATRIX, MATMULT_BY2, MATMULT_BY3, O_MATRIX: MATRIX_IDX;
    
begin 
 
  process(IN_MCOL)
  begin    
    
    for i in 15 downto 0 loop
      MATRIX(15-i)<=IN_MCOL( 8*i+7 downto 8*i);
    end loop;
    end process;
         
  
    
     process(MATRIX, TWOMULT_MAT)
       begin
         
       for i in 15 downto 0 loop
        TWOMULT_MAT(i)<=MATRIX(i) & '0';
        if (TWOMULT_MAT(i)(8)='1') then
          
          MATMULT_BY2(i)<= TWOMULT_MAT(i)(7 downto 0) xor ("00011011");
        else
          MATMULT_BY2(i)<=  TWOMULT_MAT(i)(7 downto 0);
          
        end if;
      end loop;
      end process;
      
    
      process(MATRIX, THREEMULT_MAT, TEMP)
        begin
          
        for i in 15 downto 0 loop
          THREEMULT_MAT(i)<= MATRIX(i) & '0' ;
          TEMP(i)<= THREEMULT_MAT(i) xor'0' & MATRIX(i);
          
          if (TEMP(i)(8)='1') then
          MATMULT_BY3(i)<= TEMP(i)( 7 downto 0) XOR "00011011";
        
        else
        MATMULT_BY3(i)<= TEMP(i)(7 downto 0);
         
        end if;
      end loop;
    end process;
    

  O_MATRIX(0)<= MATMULT_BY2(0) xor MATMULT_BY3(1) xor MATRIX(2) xor MATRIX(3);
  O_MATRIX(1)<= MATRIX(0) xor MATMULT_BY2(1) xor MATMULT_BY3(2) xor MATRIX(3);
  O_MATRIX(2)<= MATRIX(0) xor MATRIX(1) xor MATMULT_BY2(2) xor MATMULT_BY3(3);
  O_MATRIX(3)<= MATMULT_BY3(0) xor MATRIX(1) xor MATRIX(2) xor MATMULT_BY2(3);
  O_MATRIX(4)<= MATMULT_BY2(4) xor MATMULT_BY3(5) xor MATRIX(6) xor MATRIX(7);
  O_MATRIX(5)<= MATRIX(4) xor MATMULT_BY2(5) xor MATMULT_BY3(6) xor MATRIX(7);
  O_MATRIX(6)<= MATRIX(4) xor MATRIX(5) xor MATMULT_BY2(6) xor MATMULT_BY3(7);
  O_MATRIX(7)<= MATMULT_BY3(4) xor MATRIX(5) xor MATRIX(6) xor MATMULT_BY2(7);
  O_MATRIX(8)<= MATMULT_BY2(8) xor MATMULT_BY3(9) xor MATRIX(10) xor MATRIX(11);
  O_MATRIX(9)<= MATRIX(8) xor MATMULT_BY2(9) xor MATMULT_BY3(10) xor MATRIX(11);
  O_MATRIX(10)<= MATRIX(8) xor MATRIX(9) xor MATMULT_BY2(10) xor MATMULT_BY3(11);
  O_MATRIX(11)<= MATMULT_BY3(8) xor MATRIX(9) xor MATRIX(10) xor MATMULT_BY2(11);
  O_MATRIX(12)<= MATMULT_BY2(12) xor MATMULT_BY3(13) xor MATRIX(14) xor MATRIX(15);
  O_MATRIX(13)<= MATRIX(12) xor MATMULT_BY2(13) xor MATMULT_BY3(14) xor MATRIX(15);
  O_MATRIX(14)<= MATRIX(12) xor MATRIX(13) xor MATMULT_BY2(14) xor MATMULT_BY3(15);
  O_MATRIX(15)<= MATMULT_BY3(12) xor MATRIX(13) xor MATRIX(14) xor MATMULT_BY2(15);
  
  
  
     process(O_MATRIX)
      begin
      for i in 15 downto 0 loop
       OUT_MCOL(8*i+7 downto 8*i)<=O_MATRIX(15-i);
     end loop;
   end process;
 
   
   
 end MCOL_STR;


