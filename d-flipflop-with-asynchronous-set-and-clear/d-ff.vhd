library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity declaration
entity d_flipflop is
    port (
        D       : in  STD_LOGIC; 
        clk     : in  STD_LOGIC;  -- clk input
        clr     : in  STD_LOGIC;  -- asynchronous clear input
        set     : in  STD_LOGIC;  -- asynchronous set input
        Q       : out STD_LOGIC   
    );
end d_flipflop;

-- Architecture definition
architecture Behavioral of d_flipflop is
begin
    process (CLR, SET, CLK)
    begin
        if clr = '1' then
            Q <= '0';
        elsif set = '1' then
            Q <= '1';
        elsif (clk'event and clk = '1') then
            Q <= D;
        end if;
    end process;
end Behavioral;
