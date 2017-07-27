library ieee;
use ieee.std_logic_1164.all;

entity AES_ENCRYPTION is                                   ------TOP LEVEL
  port( PLAINTEXT: in std_logic_vector( 127 downto 0);   ---- INPUT 
        KEY: in std_logic_vector( 127 downto 0);      ---- INPUT KEY
        ROUND_MAIN: in integer range 0 to 10;
        OUT_CIPHER: out std_logic_vector( 127 downto 0);
        EXP_KEY: out std_logic_vector(1407 downto 0));
  end AES_ENCRYPTION;
    
       
    architecture AES_ENCRYPTION_STR of AES_ENCRYPTION is              ------- ARCHITECTURE OF TOP LEVEL
    
component ADDROUNDKEY is                          ------- ADD ROUND KEY
port( IN_ARKEY: in std_logic_vector( 127 downto 0 );
        SUB_ARKEY: in std_logic_vector( 127 downto 0 );
        OUT_ARKEY: out std_logic_vector ( 127 downto 0)
      );
    end component;
      
      
      component SHIFT_ROW is                          ------- SHIFT ROWS
  port( IN_SROW: in std_logic_vector( 127 downto 0);
        OUT_SROW: out std_logic_vector ( 127 downto 0)
      );
end component;


component BYTESUB is                                  ------- BYTE SUB
  port( IN_BYTESUB: in std_logic_vector( 127 downto 0);
        OUT_BYTESUB: out std_logic_vector( 127 downto 0)
      );
    end component;
    
    
component MIX_COLUMNS is                              ------- MIX CLOUMN
  port( IN_MCOL: in std_logic_vector( 127 downto 0);
        OUT_MCOL: out std_logic_vector( 127 downto 0)
      );
    end component;

component KEY_GEN is
  port( CIPHERKEY: in std_logic_vector( 127 downto 0);    --- ORIGINAL KEY
        ROUND: in integer range 0 to 10;
        OUT_KEY:out std_logic_vector( 1407 downto 0));    --- FULL EXPANDED KEY
      end component;
    

type TEMP is array(10 downto 0) of std_logic_vector(127 downto 0);
signal ADD_ARRAY, NXT:TEMP;

type TEMP1 is array(9 downto 0) of std_logic_vector(127 downto 0);
signal SUB_ARRAY, SHIFT_ARRAY:TEMP1;

type TEMP2 is array(8 downto 0) of std_logic_vector(127 downto 0);
signal MIX_ARRAY:TEMP2;

signal OUTKEY: std_logic_vector(1407 downto 0);
 

begin
  
K0: KEY_GEN port map( KEY(127 downto 0), ROUND_MAIN, OUTKEY(1407 downto 0));   


    ---- ROUND 0 

A0: ADDROUNDKEY port map( PLAINTEXT(127 downto 0), OUTKEY(1407 downto 1280), ADD_ARRAY(10)(127 downto 0)); --- ADDKEYROUND AT 0th ROUND


    ---- ROUND 1 

B0: BYTESUB port map( NXT(10)(127 downto 0), SUB_ARRAY(9)(127 downto 0));----- BYTESUB AT 1st ROUND
S0: SHIFT_ROW port map( SUB_ARRAY(9)(127 downto 0), SHIFT_ARRAY(9)(127 downto 0));----- SHIFTROW AT 1st ROUND
M0: MIX_COLUMNS port map( SHIFT_ARRAY(9)(127 downto 0), MIX_ARRAY(8)(127 downto 0));----- MIXCOLUMN AT 1st ROUND
A1: ADDROUNDKEY port map( MIX_ARRAY(8)(127  downto 0), OUTKEY(1279 downto 1152), ADD_ARRAY(9)(127 downto 0));----- ADDKEYROUND AT 1st ROUND 

     ---- ROUND 2

B1: BYTESUB port map( NXT(9)(127 downto 0), SUB_ARRAY(8)(127 downto 0));----- BYTESUB AT 2nd ROUND
S1: SHIFT_ROW port map( SUB_ARRAY(8)(127 downto 0), SHIFT_ARRAY(8)(127 downto 0));----- SHIFTROW AT 2nd ROUND
M1: MIX_COLUMNS port map( SHIFT_ARRAY(8)(127 downto 0), MIX_ARRAY(7)(127 downto 0));----- MIXCOLUMN AT 2nd ROUND
A2: ADDROUNDKEY port map( MIX_ARRAY(7)(127  downto 0), OUTKEY(1151 downto 1024), ADD_ARRAY(8)(127 downto 0));----- ADDKEYROUND AT 2nd ROUND
  
     ---- ROUND 3 

B2: BYTESUB port map( NXT(8)(127 downto 0), SUB_ARRAY(7)(127 downto 0));----- BYTESUB AT 3rd ROUND
S2: SHIFT_ROW port map( SUB_ARRAY(7)(127 downto 0), SHIFT_ARRAY(7)(127 downto 0));----- SHIFTROW AT 3rd ROUND
M2: MIX_COLUMNS port map( SHIFT_ARRAY(7)(127 downto 0), MIX_ARRAY(6)(127 downto 0));----- MIXCOLUMN AT 3rd ROUND
A3: ADDROUNDKEY port map( MIX_ARRAY(6)(127  downto 0), OUTKEY(1023 downto 896), ADD_ARRAY(7)(127 downto 0));----- ADDKEYROUND AT 3rd ROUND

    ---- ROUND 4 

B3: BYTESUB port map( NXT(7)(127 downto 0), SUB_ARRAY(6)(127 downto 0));----- BYTESUB AT 4th ROUND
S3: SHIFT_ROW port map( SUB_ARRAY(6)(127 downto 0), SHIFT_ARRAY(6)(127 downto 0));----- SHIFTROW AT 4th ROUND
M3: MIX_COLUMNS port map( SHIFT_ARRAY(6)(127 downto 0), MIX_ARRAY(5)(127 downto 0));----- MIXCOLUMN AT 4th ROUND
A4: ADDROUNDKEY port map( MIX_ARRAY(5)(127  downto 0), OUTKEY(895 downto 768), ADD_ARRAY(6)(127 downto 0));----- ADDKEYROUND AT 4th ROUND
  
    ---- ROUND 5

B4: BYTESUB port map( NXT(6)(127 downto 0), SUB_ARRAY(5)(127 downto 0));----- BYTESUB AT 5th ROUND
S4: SHIFT_ROW port map( SUB_ARRAY(5)(127 downto 0), SHIFT_ARRAY(5)(127 downto 0));----- SHIFTROW AT 5th ROUND
M4: MIX_COLUMNS port map( SHIFT_ARRAY(5)(127 downto 0), MIX_ARRAY(4)(127 downto 0));----- MIXCOLUMN AT 5th ROUND
A5: ADDROUNDKEY port map( MIX_ARRAY(4)(127  downto 0), OUTKEY(767  downto 640), ADD_ARRAY(5)(127 downto 0));----- ADDKEYROUND AT 5th ROUND

     ---- ROUND 6

B5: BYTESUB port map( NXT(5)(127 downto 0), SUB_ARRAY(4)(127 downto 0));----- BYTESUB AT 6th ROUND
S5: SHIFT_ROW port map( SUB_ARRAY(4)(127 downto 0), SHIFT_ARRAY(4)(127 downto 0));----- SHIFTROW AT 6th ROUND
M5: MIX_COLUMNS port map( SHIFT_ARRAY(4)(127 downto 0), MIX_ARRAY(3)(127 downto 0));----- MIXCOLUMN AT 6th ROUND
A6: ADDROUNDKEY port map( MIX_ARRAY(3)(127  downto 0), OUTKEY(639 downto 512), ADD_ARRAY(4)(127 downto 0));----- ADDKEYROUND AT 6th ROUND

     ---- ROUND 7

B6: BYTESUB port map( NXT(4)(127 downto 0), SUB_ARRAY(3)(127 downto 0));----- BYTESUB AT 7th ROUND
S6: SHIFT_ROW port map( SUB_ARRAY(3)(127 downto 0), SHIFT_ARRAY(3)(127 downto 0));----- SHIFTROW AT 7th ROUND
M6: MIX_COLUMNS port map( SHIFT_ARRAY(3)(127 downto 0), MIX_ARRAY(2)(127 downto 0));----- MIXCOLUMN AT 7th ROUND
A7: ADDROUNDKEY port map( MIX_ARRAY(2)(127  downto 0), OUTKEY(511 downto 384), ADD_ARRAY(3)(127 downto 0));----- ADDKEYROUND AT 7th ROUND

     ---- ROUND 8

B7: BYTESUB port map( NXT(3)(127 downto 0), SUB_ARRAY(2)(127 downto 0));----- BYTESUB AT 8th ROUND
S7: SHIFT_ROW port map( SUB_ARRAY(2)(127 downto 0), SHIFT_ARRAY(2)(127 downto 0));----- SHIFTROW AT 8th ROUND
M7: MIX_COLUMNS port map( SHIFT_ARRAY(2)(127 downto 0), MIX_ARRAY(1)(127 downto 0));----- MIXCOLUMN AT 8th ROUND
A8: ADDROUNDKEY port map( MIX_ARRAY(1)(127  downto 0), OUTKEY(383 downto 256), ADD_ARRAY(2)(127 downto 0));----- ADDKEYROUND AT 8th ROUND

     ---- ROUND 9

B8: BYTESUB port map( NXT(2)(127 downto 0), SUB_ARRAY(1)(127 downto 0));----- BYTESUB AT 9th ROUND
S8: SHIFT_ROW port map( SUB_ARRAY(1)(127 downto 0), SHIFT_ARRAY(1)(127 downto 0));----- SHIFTROW AT 9th ROUND
M8: MIX_COLUMNS port map( SHIFT_ARRAY(1)(127 downto 0), MIX_ARRAY(0)(127 downto 0));----- MIXCOLUMN AT 9th ROUND
A9: ADDROUNDKEY port map( MIX_ARRAY(0)(127  downto 0), OUTKEY(255 downto 128), ADD_ARRAY(1)(127 downto 0));----- ADDKEYROUND AT 9th ROUND

     ---- ROUND 10

B9: BYTESUB port map( NXT(1)(127 downto 0), SUB_ARRAY(0)(127 downto 0));----- BYTESUB AT 10th ROUND
S9: SHIFT_ROW port map( SUB_ARRAY(0)(127 downto 0), SHIFT_ARRAY(0)(127 downto 0));----- SHIFTROW AT 10th ROUND
A10: ADDROUNDKEY port map( SHIFT_ARRAY(0)(127  downto 0), OUTKEY(127 downto 0), ADD_ARRAY(0)(127 downto 0));----- ADDKEYROUND AT 10th ROUND

process(ROUND_MAIN, ADD_ARRAY)
  begin
    
case ROUND_MAIN is
  
when 0 => 

    NXT(10)<=ADD_ARRAY(10);
    
when 1 =>
  
    NXT(9)<= ADD_ARRAY(9);
    
when 2 =>
  
    NXT(8)<= ADD_ARRAY(8);
    
when 3 =>
  
    NXT(7)<= ADD_ARRAY(7);

when 4 =>
  
    NXT(6)<= ADD_ARRAY(6);

when 5 =>
  
    NXT(5)<= ADD_ARRAY(5);

when 6 =>
  
    NXT(4)<= ADD_ARRAY(4);

when 7 =>
  
    NXT(3)<= ADD_ARRAY(3);

when 8 =>
  
    NXT(2)<= ADD_ARRAY(2);

when 9 =>
  
    NXT(1)<= ADD_ARRAY(1);

when 10 =>
  
    NXT(0)<= ADD_ARRAY(0);


when others => null;
  
end case;
end process;
  
 
OUT_CIPHER(127 downto 0)<=NXT(0)(127 downto 0);
EXP_KEY<=OUTKEY(1407 downto 0);

end AES_ENCRYPTION_STR;   
    

