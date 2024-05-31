library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity converter
is
port( sign_mag : in std_logic_vector(3 downto 0) ;
      twos_comp : out std_logic_vector(3 downto 0) );
end;

architecture arch of converter is 
begin
	process (sign_mag)
	variable temp : std_logic_vector(2 downto 0);
	begin
	if sign_mag(3) = '0' then
	twos_comp <= sign_mag;
	else
	temp := (not sign_mag(2 downto 0));
	temp := temp + "001";
	twos_comp <= sign_mag(3) & temp;
end if;
end process;
end architecture;
