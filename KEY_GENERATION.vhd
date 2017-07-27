library ieee;
use ieee.std_logic_1164.all;

entity KEY_GEN is 
  port( CIPHERKEY: in std_logic_vector( 127 downto 0);    --- ORIGINAL KEY
        ROUND: in integer range 0 to 10;
        OUT_KEY:out std_logic_vector( 1407 downto 0));    --- FULL EXPANDED KEY
      end KEY_GEN;
      
      architecture KEY_GEN_STR of KEY_GEN is
        
        component FOURBYTESBOX is
          port ( INB_SBOX: in std_logic_vector( 31 downto 0);
                  OUTB_SBOX: out std_logic_vector( 31 downto 0));
        end component;
        
        
        component ROT_WORD is                             ---- SHIFTING
          port( IN_RWORD: in std_logic_vector( 31 downto 0);
                OUT_WORD: out std_logic_vector( 31 downto 0));
          end component;
        
        
        
        type MAT is array( 3 downto 0) of std_logic_vector( 31 downto 0);
        signal WORD: MAT;
        
        type NEWMAT is array (39 downto 0) of std_logic_vector( 31 downto 0);
        signal NWORD: NEWMAT;
              
        type TMAT is array(9 downto 0) of std_logic_vector( 31 downto 0);
        signal RCON, T_WORD, O_WORD:TMAT;
        
        Type MAT1 is array( 0 to 10) of std_logic_vector ( 127 downto 0);
        signal ROUND_KEY:MAT1;
        
        begin
          
          RCON(9)(31 downto 0)<= "00000001000000000000000000000000";                                          ----- RCON CONSTANT VALUES
          RCON(8)(31 downto 0)<= "00000010000000000000000000000000";
          RCON(7)(31 downto 0)<= "00000100000000000000000000000000";
          RCON(6)(31 downto 0)<= "00001000000000000000000000000000";
          RCON(5)(31 downto 0)<= "00010000000000000000000000000000";
          RCON(4)(31 downto 0)<= "00100000000000000000000000000000"; 
          RCON(3)(31 downto 0)<= "01000000000000000000000000000000";
          RCON(2)(31 downto 0)<= "10000000000000000000000000000000";
          RCON(1)(31 downto 0)<= "00011011000000000000000000000000";
          RCON(0)(31 downto 0)<= "00110110000000000000000000000000";
          
          
            
          
          WORD(3)<= CIPHERKEY( 127 downto 96);              -----  ORIGINAL KEY DIVIDED INTO 4 WORDS OF 2 BYTES EACH
          WORD(2)<= CIPHERKEY( 95 downto 64);
          WORD(1)<= CIPHERKEY( 63 downto 32);
          WORD(0)<= CIPHERKEY( 31 downto 0);
          
          
          
            
          
          X1: ROT_WORD port map ( WORD(0)(31 downto 0), T_WORD(0)(31 downto 0));      ------ FOR 1st ROUND
          Y1: FOURBYTESBOX port map  ( T_WORD(0)(31 downto 0), O_WORD(0)(31 downto 0));
             
          X2: ROT_WORD port map ( NWORD(36)(31 downto 0), T_WORD(1)(31 downto 0));     ------- FOR 2nd ROUND
          Y2: FOURBYTESBOX port map ( T_WORD(1)(31 downto 0), O_WORD(1)(31 downto 0));
          
          X3: ROT_WORD port map ( NWORD(32)(31 downto 0), T_WORD(2)(31 downto 0));     ------- FOR 3rd ROUND
          Y3: FOURBYTESBOX port map  ( T_WORD(2)(31 downto 0), O_WORD(2)(31 downto 0));
            
          X4: ROT_WORD port map ( NWORD(28)(31 downto 0), T_WORD(3)(31 downto 0));     ------- FOR 4th ROUND
          Y4: FOURBYTESBOX port map ( T_WORD(3)(31 downto 0), O_WORD(3)(31 downto 0));
            
          X5: ROT_WORD port maP ( NWORD(24)(31 downto 0), T_WORD(4)(31 downto 0));     ------- FOR 5th ROUND
          Y5: FOURBYTESBOX port map ( T_WORD(4)(31 downto 0), O_WORD(4)(31 downto 0));
          
          X6: ROT_WORD port map ( NWORD(20)(31 downto 0), T_WORD(5)(31 downto 0));     ------- FOR 6th ROUND
          Y6: FOURBYTESBOX port map ( T_WORD(5)(31 downto 0), O_WORD(5)(31 downto 0));
          
          X7: ROT_WORD port map ( NWORD(16)(31 downto 0), T_WORD(6)(31 downto 0));     ------- FOR 7th ROUND
          Y7: FOURBYTESBOX port map ( T_WORD(6)(31 downto 0), O_WORD(6)(31 downto 0));
          
          X8: ROT_WORD port map ( NWORD(12)(31 downto 0), T_WORD(7)(31 downto 0));     ------- FOR 8th ROUND
          Y8: FOURBYTESBOX port map ( T_WORD(7)(31 downto 0), O_WORD(7)(31 downto 0));
          
          X9: ROT_WORD port map ( NWORD(8)(31 downto 0), T_WORD(8)(31 downto 0));     ------- FOR 9th ROUND
          Y9: FOURBYTESBOX port map ( T_WORD(8)(31 downto 0), O_WORD(8)(31 downto 0));
            
          X10: ROT_WORD port map ( NWORD(4)(31 downto 0), T_WORD(9)(31 downto 0));    ------- FOR 10th ROUND
          Y10: FOURBYTESBOX port map ( T_WORD(9)(31 downto 0), O_WORD(9)(31 downto 0));
          
                      
          process( WORD, NWORD, O_WORD, ROUND)
          begin
          
          case ROUND is
            
          when 0 =>   ROUND_KEY(0)(127 downto 96) <= WORD(3);  
                      ROUND_KEY(0)(95 downto 64) <= WORD(2);
                      ROUND_KEY(0)(63 downto 32) <= WORD(1);
                      ROUND_KEY(0)(31 downto 0) <= WORD(0); 
                      
                               
            
          
          when 1 => 
              
                      NWORD(39)<= O_WORD(0) xor WORD(3) xor RCON(9); 
                        
                      NWORD(38)<= NWORD(39) xor WORD(2);
                         
                      NWORD(37)<= NWORD(38) xor WORD(1); 
                      
                      NWORD(36)<= NWORD(37) xor WORD(0); 
                      
                      ROUND_KEY(1)(127 downto 96) <= NWORD(39);  
                      ROUND_KEY(1)(95 downto 64) <= NWORD(38);
                      ROUND_KEY(1)(63 downto 32) <= NWORD(37);
                      ROUND_KEY(1)(31 downto 0) <= NWORD(36); 
                      
                      
                      
          
        when 2 =>     
                      
                      NWORD(35)<= O_WORD(1) xor NWORD(39) xor RCON(8); 
                        
                      NWORD(34)<= NWORD(35) xor NWORD(38);
                         
                      NWORD(33)<= NWORD(34) xor NWORD(37); 
                      
                      NWORD(32)<= NWORD(33) xor NWORD(36);
                      
                      ROUND_KEY(2)(127 downto 96) <= NWORD(35);  
                      ROUND_KEY(2)(95 downto 64) <= NWORD(34);
                      ROUND_KEY(2)(63 downto 32) <= NWORD(33);
                      ROUND_KEY(2)(31 downto 0) <= NWORD(32);
                      
                      
                      
        
        when 3 =>     
                      
                      
                      
                      NWORD(31)<= O_WORD(2) xor NWORD(35) xor RCON(7); 
                        
                      NWORD(30)<= NWORD(31) xor NWORD(34);
                         
                      NWORD(29)<= NWORD(30) xor NWORD(33); 
                      
                      NWORD(28)<= NWORD(29) xor NWORD(32);
                      
                       ROUND_KEY(3)(127 downto 96) <= NWORD(31);  
                      ROUND_KEY(3)(95 downto 64) <= NWORD(30);
                      ROUND_KEY(3)(63 downto 32) <= NWORD(29);
                      ROUND_KEY(3)(31 downto 0) <= NWORD(28);
                      
                      
           
           when 4 =>  
                      
                      NWORD(27)<= O_WORD(3) xor NWORD(31) xor RCON(6); 
                        
                      NWORD(26)<= NWORD(27) xor NWORD(30);
                         
                      NWORD(25)<= NWORD(26) xor NWORD(29); 
                      
                      NWORD(24)<= NWORD(25) xor NWORD(28);
                      
                       ROUND_KEY(4)(127 downto 96) <= NWORD(27);  
                      ROUND_KEY(4)(95 downto 64) <= NWORD(26);
                      ROUND_KEY(4)(63 downto 32) <= NWORD(25);
                      ROUND_KEY(4)(31 downto 0) <= NWORD(24);
                      
                     
           
           
           when 5 =>  
                      
                      NWORD(23)<= O_WORD(4) xor NWORD(27) xor RCON(5); 
                        
                      NWORD(22)<= NWORD(23) xor NWORD(26);
                         
                      NWORD(21)<= NWORD(22) xor NWORD(25); 
                      
                      NWORD(20)<= NWORD(21) xor NWORD(24);
                      
                       ROUND_KEY(5)(127 downto 96) <= NWORD(23);  
                      ROUND_KEY(5)(95 downto 64) <= NWORD(22);
                      ROUND_KEY(5)(63 downto 32) <= NWORD(21);
                      ROUND_KEY(5)(31 downto 0) <= NWORD(20);
                      
                      
                      
          
           when 6 =>  
                      
                      NWORD(19)<= O_WORD(5) xor NWORD(23) xor RCON(4); 
                        
                      NWORD(18)<= NWORD(19) xor NWORD(22);
                         
                      NWORD(17)<= NWORD(18) xor NWORD(21); 
                      
                      NWORD(16)<= NWORD(17) xor NWORD(20);
                      
                       ROUND_KEY(6)(127 downto 96) <= NWORD(19);  
                      ROUND_KEY(6)(95 downto 64) <= NWORD(18);
                      ROUND_KEY(6)(63 downto 32) <= NWORD(17);
                      ROUND_KEY(6)(31 downto 0) <= NWORD(16);
                      
                      
          
          
          
           when 7 =>  
                      NWORD(15)<= O_WORD(6) xor NWORD(19) xor RCON(3); 
                        
                      NWORD(14)<= NWORD(15) xor NWORD(18);
                         
                      NWORD(13)<= NWORD(14) xor NWORD(17); 
                      
                      NWORD(12)<= NWORD(13) xor NWORD(16);
                      
                       ROUND_KEY(7)(127 downto 96) <= NWORD(15);  
                      ROUND_KEY(7)(95 downto 64) <= NWORD(14);
                      ROUND_KEY(7)(63 downto 32) <= NWORD(13);
                      ROUND_KEY(7)(31 downto 0) <= NWORD(12);
                      
                      
                      
          
           when 8 =>  
                      
                      NWORD(11)<= O_WORD(7) xor NWORD(15) xor RCON(2); 
                        
                      NWORD(10)<= NWORD(11) xor NWORD(14);
                         
                      NWORD(9)<= NWORD(10) xor NWORD(13); 
                      
                      NWORD(8)<= NWORD(9) xor NWORD(12);
                      
                       ROUND_KEY(8)(127 downto 96) <= NWORD(11);  
                      ROUND_KEY(8)(95 downto 64) <= NWORD(10);
                      ROUND_KEY(8)(63 downto 32) <= NWORD(9);
                      ROUND_KEY(8)(31 downto 0) <= NWORD(8);
                      
                      
                      
           
           when 9 => 
                      NWORD(7)<= O_WORD(8) xor NWORD(11) xor RCON(1); 
                        
                      NWORD(6)<= NWORD(7) xor NWORD(10);
                         
                      NWORD(5)<= NWORD(6) xor NWORD(9); 
                      
                      NWORD(4)<= NWORD(5) xor NWORD(8);
                      
                       ROUND_KEY(9)(127 downto 96) <= NWORD(7);  
                      ROUND_KEY(9)(95 downto 64) <= NWORD(6);
                      ROUND_KEY(9)(63 downto 32) <= NWORD(5);
                      ROUND_KEY(9)(31 downto 0) <= NWORD(4);
                      
                      
                      
          
           when 10 => 
                      NWORD(3)<= O_WORD(9) xor NWORD(7) xor RCON(0); 
                        
                      NWORD(2)<= NWORD(3) xor NWORD(6);
                         
                      NWORD(1)<= NWORD(2) xor NWORD(5); 
                      
                      NWORD(0)<= NWORD(1) xor NWORD(4);
                      
                       ROUND_KEY(10)(127 downto 96) <= NWORD(3);  
                      ROUND_KEY(10)(95 downto 64) <= NWORD(2);
                      ROUND_KEY(10)(63 downto 32) <= NWORD(1);
                      ROUND_KEY(10)(31 downto 0) <= NWORD(0);
                      
                      
                      
          when others => null; 
                      
                    end case;
              end process;
                  
                  OUT_KEY(127 downto 0)<= ROUND_KEY(10);
                  OUT_KEY(255 downto 128)<= ROUND_KEY(9);
                  OUT_KEY(383 downto 256)<= ROUND_KEY(8);
                  OUT_KEY(511 downto 384)<= ROUND_KEY(7);
                  OUT_KEY(639 downto 512)<= ROUND_KEY(6);
                  OUT_KEY(767 downto 640)<= ROUND_KEY(5);
                  OUT_KEY(895 downto 768)<= ROUND_KEY(4);
                  OUT_KEY(1023 downto 896)<= ROUND_KEY(3);
                  OUT_KEY(1151 downto 1024)<= ROUND_KEY(2);
                  OUT_KEY(1279 downto 1152)<= ROUND_KEY(1);
                  OUT_KEY(1407 downto 1280)<= ROUND_KEY(0);
                  
                  
                  
                end KEY_GEN_STR;
                      
          
