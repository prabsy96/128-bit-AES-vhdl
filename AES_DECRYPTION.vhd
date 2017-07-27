library ieee;
use ieee.std_logic_1164.all;

entity AES_DECRYPTION is 
  port( IN_CIPHER: in std_logic_vector( 127 downto 0);
        KEY1: in std_logic_vector( 1407 downto 0);
        ROUND_MAIN1: in integer range 0 to 10;
        OUT_PLAINTEXT: out std_logic_vector( 127 downto 0));
        
      end AES_DECRYPTION;
      
        architecture AES_DECRYPTION_STR of AES_DECRYPTION is 
        
component ADDROUNDKEY is                          ------- ADD ROUND KEY
port( IN_ARKEY: in std_logic_vector( 127 downto 0 );
        SUB_ARKEY: in std_logic_vector( 127 downto 0 );
        OUT_ARKEY: out std_logic_vector ( 127 downto 0)
      );
    end component;
      
      
      component INV_SHIFT_ROW is                          ------- SHIFT ROWS
  port( IN_INVSROW: in std_logic_vector( 127 downto 0);
        OUT_INVSROW: out std_logic_vector ( 127 downto 0)
      );
end component;


component INV_BYTESUB is                                  ------- BYTE SUB
  port( INVERSEIN: in std_logic_vector( 127 downto 0);
        INVERSEOUT: out std_logic_vector( 127 downto 0)
      );
    end component;
    
    
component MIX_INVERSE is 
  port( INMINV: in std_logic_vector( 127 downto 0);
        OUTMINV: out std_logic_vector( 127 downto 0)
      );
    end component;


type TEMP_MAT is array(10 downto 0) of std_logic_vector(127 downto 0);
signal ADD_ARRAY, NXT:TEMP_MAT;

type TEMP1_MAT is array(9 downto 0) of std_logic_vector(127 downto 0);
signal SUB_ARRAY, SHIFT_ARRAY:TEMP1_MAT;

type TEMP2_MAT is array(8 downto 0) of std_logic_vector(127 downto 0);
signal MIX_ARRAY:TEMP2_MAT;

signal OUTKEY1: std_logic_vector(1407 downto 0);
 

begin
  
OUTKEY1(1407 downto 0)<= KEY1(1407 downto 0);

    ---- ROUND 0 

A10: ADDROUNDKEY port map( IN_CIPHER(127 downto 0), OUTKEY1(1407 downto 1280), ADD_ARRAY(10)(127 downto 0)); 
  
    ---- ROUND 1 

S10: INV_SHIFT_ROW port map( NXT(10)(127 downto 0), SHIFT_ARRAY(9)(127 downto 0));
B10: INV_BYTESUB port map( SHIFT_ARRAY(9)(127 downto 0), SUB_ARRAY(9)(127 downto 0));
A11: ADDROUNDKEY port map( SUB_ARRAY(9)(127 downto 0), OUTKEY1(1279 downto 1152), ADD_ARRAY(9)(127 downto 0));
M10: MIX_INVERSE port map( ADD_ARRAY(9)(127 downto 0), MIX_ARRAY(8)(127 downto 0));
  
    ---- ROUND 2

S11: INV_SHIFT_ROW port map( NXT(9)(127 downto 0), SHIFT_ARRAY(8)(127 downto 0));
B11: INV_BYTESUB port map( SHIFT_ARRAY(8)(127 downto 0), SUB_ARRAY(8)(127 downto 0));
A12: ADDROUNDKEY port map( SUB_ARRAY(8)(127 downto 0), OUTKEY1(1151 downto 1024), ADD_ARRAY(8)(127 downto 0));
M11: MIX_INVERSE port map( ADD_ARRAY(8)(127 downto 0), MIX_ARRAY(7)(127 downto 0));

    ---- ROUND 3 

S12: INV_SHIFT_ROW port map( NXT(8)(127 downto 0), SHIFT_ARRAY(7)(127 downto 0));
B12: INV_BYTESUB port map( SHIFT_ARRAY(7)(127 downto 0), SUB_ARRAY(7)(127 downto 0));
A13: ADDROUNDKEY port map( SUB_ARRAY(7)(127 downto 0), OUTKEY1(1023 downto 896), ADD_ARRAY(7)(127 downto 0));
M12: MIX_INVERSE port map( ADD_ARRAY(7)(127 downto 0), MIX_ARRAY(6)(127 downto 0));

    ---- ROUND 4 

S13: INV_SHIFT_ROW port map( NXT(7)(127 downto 0), SHIFT_ARRAY(6)(127 downto 0));
B13: INV_BYTESUB port map( SHIFT_ARRAY(6)(127 downto 0), SUB_ARRAY(6)(127 downto 0));
A14: ADDROUNDKEY port map( SUB_ARRAY(6)(127 downto 0), OUTKEY1(895 downto 768), ADD_ARRAY(6)(127 downto 0));
M13: MIX_INVERSE port map( ADD_ARRAY(6)(127 downto 0), MIX_ARRAY(5)(127 downto 0));

    ---- ROUND 5

S14: INV_SHIFT_ROW port map( NXT(6)(127 downto 0), SHIFT_ARRAY(5)(127 downto 0));
B14: INV_BYTESUB port map( SHIFT_ARRAY(5)(127 downto 0), SUB_ARRAY(5)(127 downto 0));
A15: ADDROUNDKEY port map( SUB_ARRAY(5)(127 downto 0), OUTKEY1(767 downto 640), ADD_ARRAY(5)(127 downto 0));
M14: MIX_INVERSE port map( ADD_ARRAY(5)(127 downto 0), MIX_ARRAY(4)(127 downto 0));

    ---- ROUND 6 

S15: INV_SHIFT_ROW port map( NXT(5)(127 downto 0), SHIFT_ARRAY(4)(127 downto 0));
B15: INV_BYTESUB port map( SHIFT_ARRAY(4)(127 downto 0), SUB_ARRAY(4)(127 downto 0));
A16: ADDROUNDKEY port map( SUB_ARRAY(4)(127 downto 0), OUTKEY1(639 downto 512), ADD_ARRAY(4)(127 downto 0));
M15: MIX_INVERSE port map( ADD_ARRAY(4)(127 downto 0), MIX_ARRAY(3)(127 downto 0));

    ---- ROUND 7 

S16: INV_SHIFT_ROW port map( NXT(4)(127 downto 0), SHIFT_ARRAY(3)(127 downto 0));
B16: INV_BYTESUB port map( SHIFT_ARRAY(3)(127 downto 0), SUB_ARRAY(3)(127 downto 0));
A17: ADDROUNDKEY port map( SUB_ARRAY(3)(127 downto 0), OUTKEY1(511 downto 384), ADD_ARRAY(3)(127 downto 0));
M16: MIX_INVERSE port map( ADD_ARRAY(3)(127 downto 0), MIX_ARRAY(2)(127 downto 0));

    ---- ROUND 8 

S17: INV_SHIFT_ROW port map( NXT(3)(127 downto 0), SHIFT_ARRAY(2)(127 downto 0));
B17: INV_BYTESUB port map( SHIFT_ARRAY(2)(127 downto 0), SUB_ARRAY(2)(127 downto 0));
A18: ADDROUNDKEY port map( SUB_ARRAY(2)(127 downto 0), OUTKEY1(383 downto 256), ADD_ARRAY(2)(127 downto 0));
M17: MIX_INVERSE port map( ADD_ARRAY(2)(127 downto 0), MIX_ARRAY(1)(127 downto 0));

    ---- ROUND 9 

S18: INV_SHIFT_ROW port map( NXT(2)(127 downto 0), SHIFT_ARRAY(1)(127 downto 0));
B18: INV_BYTESUB port map( SHIFT_ARRAY(1)(127 downto 0), SUB_ARRAY(1)(127 downto 0));
A19: ADDROUNDKEY port map( SUB_ARRAY(1)(127 downto 0), OUTKEY1(255 downto 128), ADD_ARRAY(1)(127 downto 0));
M18: MIX_INVERSE port map( ADD_ARRAY(1)(127 downto 0), MIX_ARRAY(0)(127 downto 0));

    ---- ROUND 10 

S19: INV_SHIFT_ROW port map( NXT(1)(127 downto 0), SHIFT_ARRAY(0)(127 downto 0));
B19: INV_BYTESUB port map( SHIFT_ARRAY(0)(127 downto 0), SUB_ARRAY(0)(127 downto 0));
A20: ADDROUNDKEY port map( SUB_ARRAY(0)(127 downto 0), OUTKEY1(127 downto 0), ADD_ARRAY(0)(127 downto 0));

process(ROUND_MAIN1, ADD_ARRAY, MIX_ARRAY)
  begin
    
    case ROUND_MAIN1 is
  
when 0 => 

    NXT(10)<=ADD_ARRAY(10);
    
when 1 =>
  
    NXT(9)<= MIX_ARRAY(8);
    
when 2 =>
  
    NXT(8)<= MIX_ARRAY(7);
    
when 3 =>
  
    NXT(7)<= MIX_ARRAY(6);

when 4 =>
  
    NXT(6)<= MIX_ARRAY(5);

when 5 =>
  
    NXT(5)<= MIX_ARRAY(4);

when 6 =>
  
    NXT(4)<= MIX_ARRAY(3);

when 7 =>
  
    NXT(3)<= MIX_ARRAY(2);

when 8 =>
  
    NXT(2)<= MIX_ARRAY(1);

when 9 =>
  
    NXT(1)<= MIX_ARRAY(0);

when 10 =>
  
    NXT(0)<= ADD_ARRAY(0);


when others => null;
  
end case;
end process;
  
 
OUT_PLAINTEXT(127 downto 0)<=NXT(0)(127 downto 0);

end AES_DECRYPTION_STR;

