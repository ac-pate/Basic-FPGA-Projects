
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;  -- This library is not recommended. Use numeric_std instead.
use IEEE.numeric_std.all;

entity converter is
    port( sign_mag : in std_logic_vector(3 downto 0);
          twos_comp : out std_logic_vector(3 downto 0) );
end entity converter;

architecture arch of converter is
    signal sign   : std_logic;
    signal mag    : std_logic_vector(2 downto 0);
    signal notmag : std_logic_vector(2 downto 0);
    signal add1   : std_logic_vector(2 downto 0);
begin
    sign <= sign_mag(3);
    mag <= sign_mag(2 downto 0);
    notmag <= not mag;

    process(all)
    begin
        add1 <= std_logic_vector(unsigned(notmag) + 1);
        if (sign = '0') then
            twos_comp <= sign_mag;
        else
            twos_comp <= sign & add1;
        end if;
    end process;
end architecture arch;
