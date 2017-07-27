--- ADD ROUND KEY---

library ieee;
use ieee.std_logic_1164.all;

entity ADDROUNDKEY is 
  port( IN_ARKEY: in std_logic_vector( 127 downto 0 );
        SUB_ARKEY: in std_logic_vector( 127 downto 0 );
        OUT_ARKEY: out std_logic_vector ( 127 downto 0)
      );
end ADDROUNDKEY;

  architecture ADDROUNDKEY_STR of ADDROUNDKEY is
    begin
    
      OUT_ARKEY (127 downto 96)<= IN_ARKEY( 127 downto 96) xor SUB_ARKEY(127 downto 96);
      OUT_ARKEY (95 downto 64)<= IN_ARKEY( 95 downto 64) xor SUB_ARKEY(95 downto 64);
      OUT_ARKEY (63 downto 32)<= IN_ARKEY( 63 downto 32) xor SUB_ARKEY(63 downto 32);
      OUT_ARKEY (31 downto 0)<= IN_ARKEY( 31 downto 0) xor SUB_ARKEY(31 downto 0);
    
end ADDROUNDKEY_STR;

