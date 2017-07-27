library ieee;
use ieee.std_logic_1164.all;

entity INV_SHIFT_ROW is
  port( IN_INVSROW: in std_logic_vector( 127 downto 0);
        OUT_INVSROW: out std_logic_vector ( 127 downto 0)
      );
end INV_SHIFT_ROW;

architecture SINV_ROW_STR of INV_SHIFT_ROW is 

type MATRIX_IND is array( 15 downto 0) of std_logic_vector (7 downto 0);
signal MATRIX1, MATRIX2: MATRIX_IND;

begin
    
    process(IN_INVSROW)
      begin
    for i in 15 downto 0 loop                   ----- loop for substuting inp 127 bits to 16 bytes
    MATRIX1(15-i)<= IN_INVSROW(127-8*i downto 120-8*i);
  end loop;
  
  
end process;


MATRIX2(15)<=MATRIX1(15);
MATRIX2(14)<=MATRIX1(2);
MATRIX2(13)<=MATRIX1(5);
MATRIX2(12)<=MATRIX1(8);
MATRIX2(11)<=MATRIX1(11);
MATRIX2(10)<=MATRIX1(14);
MATRIX2(9)<=MATRIX1(1);
MATRIX2(8)<=MATRIX1(4);
MATRIX2(7)<=MATRIX1(7);
MATRIX2(6)<=MATRIX1(10);
MATRIX2(5)<=MATRIX1(13);
MATRIX2(4)<=MATRIX1(0);
MATRIX2(3)<=MATRIX1(3);
MATRIX2(2)<=MATRIX1(6);
MATRIX2(1)<=MATRIX1(9);
MATRIX2(0)<=MATRIX1(12);


process(MATRIX2)
  begin
    for i in 15 downto 0 loop
      OUT_INVSROW(127-8*i downto 120-8*i)<=MATRIX2(15-i);
    end loop;
  end process;
  
end SINV_ROW_STR;
