library ieee;
use ieee.std_logic_1164.all;

entity TOPLEVEL is                                   ------TOP LEVEL
  port( PLAINTEXT0: in std_logic_vector( 127 downto 0);   ---- INPUT 
        KEY0: in std_logic_vector( 127 downto 0);      ---- INPUT KEY
        ROUND_MAIN0: in integer range 0 to 10;
        CONT: in integer range 0 to 1;
        OUT_CIPHER0: out std_logic_vector( 127 downto 0));
  end TOPLEVEL;
    
       
    architecture TOPLEVEL_STR of TOPLEVEL is
      
      component AES_ENCRYPTION is                                   ------TOP LEVEL
  port( PLAINTEXT: in std_logic_vector( 127 downto 0);   ---- INPUT 
        KEY: in std_logic_vector( 127 downto 0);      ---- INPUT KEY
        ROUND_MAIN: in integer range 0 to 10;
        OUT_CIPHER: out std_logic_vector( 127 downto 0);
        EXP_KEY: out std_logic_vector(1407 downto 0));
  end component;
  
  component AES_DECRYPTION is 
  port( IN_CIPHER: in std_logic_vector( 127 downto 0);
        kEY1: in std_logic_vector( 1407 downto 0);
        ROUND_MAIN1: in integer range 0 to 10;
        OUT_PLAINTEXT: out std_logic_vector( 127 downto 0));
        
      end component;
   
   signal OUT_ENCRY, OUT_DECRY: std_logic_vector(127 downto 0); 
   signal EXP_KEY0, INV_KEY: std_logic_vector(1407 downto 0);
     
      begin
        
        ENCRYPTION: AES_ENCRYPTION port map( PLAINTEXT0(127 downto 0), KEY0, ROUND_MAIN0, OUT_ENCRY(127 downto 0), EXP_KEY0(1407 downto 0));
        
        INV_KEY( 127 downto 0)<= EXP_KEY0(1407 downto 1280);  
        INV_KEY( 255 downto 128)<= EXP_KEY0(1279 downto 1152);
        INV_KEY( 383 downto 256)<= EXP_KEY0(1151 downto 1024);
        INV_KEY( 511 downto 384)<= EXP_KEY0(1023 downto 896);
        INV_KEY( 639 downto 512)<= EXP_KEY0(895 downto 768);
        INV_KEY( 767 downto 640)<= EXP_KEY0(767 downto 640);
        INV_KEY( 895 downto 768)<= EXP_KEY0(639 downto 512);
        INV_KEY( 1023 downto 896)<= EXP_KEY0(511 downto 384);
        INV_KEY( 1151 downto 1024)<= EXP_KEY0(383 downto 256);
        INV_KEY( 1279 downto 1152)<= EXP_KEY0(255 downto 128);
        INV_KEY( 1407 downto 1280)<= EXP_KEY0(127 downto 0);
        
        DECRYPTION: AES_DECRYPTION port map( OUT_ENCRY(127 downto 0), INV_KEY(1407 downto 0), ROUND_MAIN0, OUT_DECRY(127 downto 0));  
        
        process(CONT, OUT_ENCRY, OUT_DECRY)
          begin
            
            case CONT is
              
            when 0 =>
              
              OUT_CIPHER0(127 downto 0)<= OUT_ENCRY(127 downto 0);
              
          when 1 =>
            
            OUT_CIPHER0(127 downto 0)<= OUT_DECRY(127 downto 0);
            
         when others => null;
          
          end case;
        end process;
        
      end TOPLEVEL_STR;
              
        
        
         
    

