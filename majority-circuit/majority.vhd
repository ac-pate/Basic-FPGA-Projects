library IEEE;
use IEEE.std_logic_1164.all;

entity majority is
port( a,b,c,d      : in std_logic;
      output       : out std_logic);
end majority;

architecture structural of majority is 

begin
output <= ((b and c and d) or (a and c and d) or (a and b and d) or (a and b and c));

end structural;
