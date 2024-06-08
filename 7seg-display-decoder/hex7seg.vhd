library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity declaration for Hex to 7-segment decoder
entity hex7seg is
    port(
        x 	: in std_logic_vector(3 downto 0);
        a_to_g  : out std_logic_vector(6 downto 0)
    );
end hex7seg;


architecture behavioral of hex7seg is
begin

    process(x)
    begin
        case x is
            when "0000" => a_to_g <= "0000001"; -- 0
            when "0001" => a_to_g <= "1001111"; -- 1
            when "0010" => a_to_g <= "0010010"; -- 2
            when "0011" => a_to_g <= "0000110"; -- 3
            when "0100" => a_to_g <= "1001100"; -- 4
            when "0101" => a_to_g <= "0100100"; -- 5
            when "0110" => a_to_g <= "0100000"; -- 6
            when "0111" => a_to_g <= "0001111"; -- 7
            when "1000" => a_to_g <= "0000000"; -- 8
            when "1001" => a_to_g <= "0000100"; -- 9
            when "1010" => a_to_g <= "0001000"; -- A
            when "1011" => a_to_g <= "1100000"; -- B
            when "1100" => a_to_g <= "0110001"; -- C
            when "1101" => a_to_g <= "1000010"; -- D
            when "1110" => a_to_g <= "0110000"; -- E
            when "1111" => a_to_g <= "0111000"; -- F
            when others => a_to_g <= "0111000"; -- Default case
        end case;
    end process;
end behavioral;

