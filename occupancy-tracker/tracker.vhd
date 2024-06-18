library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity occupancy_tracker is
    port(
        X: in std_logic;
        Y: in std_logic;
        reset: in std_logic;
        clk: in std_logic;
        max_occupancy: in std_logic_vector(5 downto 0);
        Z: out std_logic
    );
end occupancy_tracker;

architecture arch of occupancy_tracker is
    signal occupancy: unsigned(5 downto 0);
    signal max_occupancy_reg: unsigned(5 downto 0);
begin
    process(clk, reset)
    begin
        if reset = '1' then
            max_occupancy_reg <= (others => '0');
        elsif rising_edge(clk) then
            max_occupancy_reg <= unsigned(max_occupancy);
        end if;
    end process;

    process(clk, reset)
    begin
        if reset = '1' then
            occupancy <= (others => '0');
        elsif rising_edge(clk) then
            if (X = '1' and Y = '1') then
                occupancy <= occupancy;
            elsif (X = '1') then
                occupancy <= occupancy + 1;
            elsif (Y = '1') then
                occupancy <= occupancy - 1;
            end if;
        end if;
    end process;

    Z <= '1' when (occupancy >= max_occupancy_reg) else '0';

end arch;

