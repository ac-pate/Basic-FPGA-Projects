library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;


entity reg_swap_load is
   
    port( 
        din1, din2  : in std_logic_vector(3 downto 0);
        clk         : in std_logic;
        load, swap  : in std_logic;

        q1, q2      : out std_logic_vector(3 downto 0)
    );
end;

architecture behavioral of reg_swap_load is
    signal reg1, reg2 : std_logic_vector(3 downto 0);
begin
    process (clk)
    begin
        if clk'event and clk = '1' then
            if swap = '1' then
                reg1 <= reg2;
                reg2 <= reg1;
            elsif load = '1' then
                reg1 <= din1;
                reg2 <= din2;
            end if;
        end if;
    end process;

    q1 <= reg1;
    q2 <= reg2;

end architecture behavioral;


