library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity converter
is
port( sign_mag : in std_logic_vector(3 downto 0) ;
      twos_comp : out std_logic_vector(3 downto 0) );
end;

architecture arch of converter is 

signal sign 			: std_logic;
signal add1, mag, notmag	: std_logic_vector(2 downto 0);

begin 
sign <= sign_mag(3);
mag <= sign_mag(2 downto 0);
notmag <= not mag;
add1 <= notmag + "001";


if (sign = '0') then
	twos_comp <= sign_mag;
else 
	twos_comp <= sign & add1;
end if;

end arch;

