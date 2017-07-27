

library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity MIX_INVERSE is 
  port( INMINV: in std_logic_vector( 127 downto 0);
        OUTMINV: out std_logic_vector( 127 downto 0)
      );
    end MIX_INVERSE;
    
    architecture MIXINVERSE_STR of MIX_INVERSE is 
    
      
    type MATRIX_IDX is array(15 downto 0) of std_logic_vector( 7 downto 0);
    signal MATRIX, MATMULT_BYE, MATMULT_BYB, MATMULT_BY9, MATMULT_BYD,O_MATRIX: MATRIX_IDX;
            
   
begin 
 
  process(INMINV)
  begin    
    

    for i in 15 downto 0 loop
      MATRIX(15-i)<=INMINV( 8*i+7 downto 8*i);
    end loop;
    end process;
         
  
    
     process(MATRIX)
      variable TEMP91, TEMP92, TEMP93: std_logic_vector(8 downto 0); 

       begin
       for i in 15 downto 0 loop
        TEMP91:=MATRIX(i) & '0';
        if (TEMP91(8)='1') then
          
          TEMP91( 7 downto 0):= TEMP91(7 downto 0) xor ("00011011");
        end if;
        
        TEMP92:= TEMP91(7 downto 0) & '0';
        if (TEMP92(8)='1') then
        
        TEMP92( 7 downto 0):=TEMP92(7 downto 0) xor ("00011011");
      end if;
      
        TEMP93:= TEMP92(7 downto 0) & '0';
        if (TEMP93(8)='1') then
        
        TEMP93( 7 downto 0):=TEMP93(7 downto 0) xor ("00011011");
      end if;
          MATMULT_BY9(i)<= MATRIX(i) xor TEMP93(7 downto 0);
        
      end loop;
      end process;
      
    
      process(MATRIX)
       
    variable TEMPB1, TEMPB2, TEMPB3 : std_logic_vector(8 downto 0); 
begin

    for i in  15 downto 0 loop
	TEMPB1 := MATRIX(i) & '0';	
	if (TEMPB1(8)='1') then
	   TEMPB1(7 downto 0) :=  TEMPB1(7 downto 0) xor "00011011";
	end if;

     TEMPB2:=TEMPB1(7 downto 0) & '0';
    if (TEMPB2(8)='1') then
 	    TEMPB2(7 downto 0) := TEMPB2(7 downto 0) xor "00011011";
	end if;
     
     TEMPB3:=  TEMPB2(7 downto 0) & '0';
    if (TEMPB3(8)='1') then
 	    TEMPB3(7 downto 0) := TEMPB3(7 downto 0) xor "00011011";
	end if;
     
    MATMULT_BYB(i) <= MATRIX(i) xor TEMPB1(7 downto 0) xor TEMPB3(7 downto 0);
    end loop;
end process;

    
      process(MATRIX)
        variable TEMPD1, TEMPD2, TEMPD3 : std_logic_vector(8 downto 0);
begin

    for i in  15 downto 0 loop
	TEMPD1  := MATRIX(i) & '0';	
	if (TEMPD1(8)='1') then
	   TEMPD1(7 downto 0) :=  TEMPD1(7 downto 0) xor "00011011";
	end if;

     TEMPD2 :=TEMPD1(7 downto 0) & '0';
    if (TEMPD2(8)='1') THEN
 	    TEMPD2(7 downto 0) := TEMPD2(7 downto 0) xor "00011011";
	end if;
     
     TEMPD3 :=  TEMPD2(7 downto 0) & '0';
    if (TEMPD3(8)='1') then
 	    TEMPD3(7 downto 0) := TEMPD3(7 downto 0) xor "00011011";
	end if;

    MATMULT_BYD(i) <= MATRIX(i) XOR TEMPD2(7 downto 0) xor TEMPD3(7 downto 0);
    end loop;
end process;

    
       process(MATRIX)
        variable TEMPE1,TEMPE2,TEMPE3 : std_logic_vector(8 downto 0);
begin

    for i in  15 downto 0 loop
	TEMPE1:= MATRIX(i) & '0';	
	if (TEMPE1(8)='1') then	
	   TEMPE1(7 downto 0) :=  TEMPE1(7 downto 0) xor "00011011";
	end if;

     TEMPE2:=TEMPE1(7 downto 0) & '0';
    if (TEMPE2(8)='1') THEN
 	    TEMPE2(7 downto 0) := TEMPE2(7 downto 0) xor "00011011";
	end if;
     
     TEMPE3:= TEMPE2(7 downto 0) & '0';
    if (TEMPE3(8)='1') THEN
 	    TEMPE3(7 downto 0) := TEMPE3(7 downto 0) xor "00011011";
	end if;

    MATMULT_BYE(i) <= TEMPE1(7 downto 0) XOR TEMPE2(7 downto 0) XOR TEMPE3(7 downto 0);
    end loop;
end process;
    
    

  O_MATRIX(0)<= MATMULT_BYE(0) xor MATMULT_BYB(1) xor MATMULT_BYD(2) xor MATMULT_BY9(3);
  O_MATRIX(1)<= MATMULT_BY9(0) xor MATMULT_BYE(1) xor MATMULT_BYB(2) xor MATMULT_BYD(3);
  O_MATRIX(2)<= MATMULT_BYD(0) xor MATMULT_BY9(1) xor MATMULT_BYE(2) xor MATMULT_BYB(3);
  O_MATRIX(3)<= MATMULT_BYB(0) xor MATMULT_BYD(1) xor MATMULT_BY9(2) xor MATMULT_BYE(3);
  O_MATRIX(4)<= MATMULT_BYE(4) xor MATMULT_BYB(5) xor MATMULT_BYD(6) xor MATMULT_BY9(7);
  O_MATRIX(5)<= MATMULT_BY9(4) xor MATMULT_BYE(5) xor MATMULT_BYB(6) xor MATMULT_BYD(7);
  O_MATRIX(6)<= MATMULT_BYD(4) xor MATMULT_BY9(5) xor MATMULT_BYE(6) xor MATMULT_BYB(7);
  O_MATRIX(7)<=MATMULT_BYB(4) xor MATMULT_BYD(5) xor MATMULT_BY9(6) xor MATMULT_BYE(7);
  O_MATRIX(8)<= MATMULT_BYE(8) xor MATMULT_BYB(9) xor MATMULT_BYD(10) xor MATMULT_BY9(11);
  O_MATRIX(9)<= MATMULT_BY9(8) xor MATMULT_BYE(9) xor MATMULT_BYB(10) xor MATMULT_BYD(11);
  O_MATRIX(10)<= MATMULT_BYD(8) xor MATMULT_BY9(9) xor MATMULT_BYE(10) xor MATMULT_BYB(11);
  O_MATRIX(11)<= MATMULT_BYB(8) xor MATMULT_BYD(9) xor MATMULT_BY9(10) xor MATMULT_BYE(11); 
  O_MATRIX(12)<= MATMULT_BYE(12) xor MATMULT_BYB(13) xor MATMULT_BYD(14) xor MATMULT_BY9(15);
  O_MATRIX(13)<= MATMULT_BY9(12) xor MATMULT_BYE(13) xor MATMULT_BYB(14) xor MATMULT_BYD(15);
  O_MATRIX(14)<= MATMULT_BYD(12) xor MATMULT_BY9(13) xor MATMULT_BYE(14) xor MATMULT_BYB(15);
  O_MATRIX(15)<= MATMULT_BYB(12) xor MATMULT_BYD(13) xor MATMULT_BY9(14) xor MATMULT_BYE(15);
  
  
  
     process(O_MATRIX)
      begin
      for i in 15 downto 0 loop
       OUTMINV(8*i+7 downto 8*i)<=O_MATRIX(15-i);
     end loop;
   end process;
 
   
   
 end MIXINVERSE_STR;

  



