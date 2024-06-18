library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity testbench is
end testbench;

architecture top of testbench is

    component occupancy_tracker is
        port(
            clk, reset      : in std_logic;
            X, Y            : in std_logic;
            max_occupancy   : in std_logic_vector(5 downto 0);
            Z               : out std_logic
        );
    end component;

    signal my_clk, my_reset  : std_logic := '0';
    signal my_X, my_Y        : std_logic := '0';
    signal my_max_occupancy  : std_logic_vector(5 downto 0) := (others => '0');
    signal my_Z              : std_logic;

    constant clk_period : time := 10 ns;
    constant max_simulation_time : time := 2000 ns;

begin

    -- Clock generation process
    clk_gen: process
    begin
        while now < max_simulation_time loop
            my_clk <= '0';
            wait for clk_period / 2;
            my_clk <= '1';
            wait for clk_period / 2;
        end loop;
        wait;
    end process;

    -- Instantiate the occupancy_tracker
    tracker_inst: occupancy_tracker
        port map (
            clk => my_clk,
            reset => my_reset,
            X => my_X,
            Y => my_Y,
            max_occupancy => my_max_occupancy,
            Z => my_Z
        );

    -- Stimulus generation process
    gen_stimuli: process
    begin
        -- Apply reset, set max occupancy to 5
        my_reset <= '1';
        my_max_occupancy <= "000101";
        wait for clk_period;
        
        my_reset <= '0';

        -- Test sequence
        -- Person enters
        wait for clk_period;
        my_X <= '1';
        wait for clk_period;
        my_X <= '0';

        -- Person exits
        wait for clk_period;
        my_Y <= '1';
        wait for clk_period;
        my_Y <= '0';

        -- Multiple entries until max occupancy
        for i in 1 to 5 loop
            wait for clk_period;
            my_X <= '1';
            wait for clk_period;
            my_X <= '0';
        end loop;

        -- Reset, set max occupancy to 63
        wait for clk_period;
        my_reset <= '1';
        my_max_occupancy <= "111111";
        wait for clk_period;
        my_reset <= '0';

        -- Stress test: many entries
        for i in 1 to 55 loop
            wait for clk_period;
            my_X <= '1';
            wait for clk_period;
            my_X <= '0';
        end loop;

        -- Several exits
        for i in 1 to 5 loop
            wait for clk_period;
            my_Y <= '1';
            wait for clk_period;
            my_Y <= '0';
        end loop;

        -- Simultaneous entry and exit
        for i in 1 to 5 loop
            wait for clk_period;
            my_X <= '1';
            my_Y <= '1';
            wait for clk_period;
            my_X <= '0';
            my_Y <= '0';
        end loop;

        -- Final test sequence
        for i in 1 to 13 loop
            wait for clk_period;
            my_X <= '1';
            wait for clk_period;
            my_X <= '0';
        end loop;

        -- Final reset
        wait for clk_period;
        my_reset <= '1';
        wait for clk_period;
        my_reset <= '0';

        -- End of test
        wait;
    end process;

end top;
