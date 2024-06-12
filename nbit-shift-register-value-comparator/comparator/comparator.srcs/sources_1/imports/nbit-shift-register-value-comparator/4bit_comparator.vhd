library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity lab4 is 
    port(
            din : in std_logic_vector(3 downto 0);
            reset : in std_logic;
            clk : in std_logic;
            sel: in std_logic_vector(1 downto 0);
            max_out : out std_logic_vector(3 downto 0);
            min_out : out std_logic_vector(3 downto 0);
            reg_out : out std_logic_vector(3 downto 0)
    );
end lab4;

architecture lab4 of lab4 is
    -- Declare signals for shift registers
    signal shift_registers_0 : std_logic_vector(3 downto 0) := "1000";
    signal shift_registers_1 : std_logic_vector(3 downto 0) := "1000";
    signal shift_registers_2 : std_logic_vector(3 downto 0) := "1000";
    signal shift_registers_3 : std_logic_vector(3 downto 0) := "1000";
    signal current_max       : std_logic_vector(3 downto 0);
    signal current_min       : std_logic_vector(3 downto 0);
begin
    -- Shift Register Process
    process(clk, reset)
    begin 
        if reset = '1' then
            shift_registers_0 <= "1000";
            shift_registers_1 <= "1000";
            shift_registers_2 <= "1000";
            shift_registers_3 <= "1000";
        elsif rising_edge(clk) then 
            shift_registers_3 <= shift_registers_2;
            shift_registers_2 <= shift_registers_1;
            shift_registers_1 <= shift_registers_0;
            shift_registers_0 <= din;
        end if;
    end process;

    -- Max/Min Combinational Logic
    process(shift_registers_0, shift_registers_1, shift_registers_2, shift_registers_3)
        variable max_val : std_logic_vector(3 downto 0);
        variable min_val : std_logic_vector(3 downto 0);
    begin
        max_val := shift_registers_0;
        min_val := shift_registers_0;

        -- Check shift_registers_1
        if shift_registers_1 > max_val then
            max_val := shift_registers_1;
        end if;
        if shift_registers_1 < min_val then
            min_val := shift_registers_1;
        end if;

        -- Check shift_registers_2
        if shift_registers_2 > max_val then
            max_val := shift_registers_2;
        end if;
        if shift_registers_2 < min_val then
            min_val := shift_registers_2;
        end if;

        -- Check shift_registers_3
        if shift_registers_3 > max_val then
            max_val := shift_registers_3;
        end if;
        if shift_registers_3 < min_val then
            min_val := shift_registers_3;
        end if;

        current_max <= max_val;
        current_min <= min_val;
    end process;

    -- Max Output Register Process
    process(clk, reset)
    begin
        if reset = '1' then
            max_out <= "0000";
        elsif rising_edge(clk) then
            --if current_max > max_out then
             max_out <= current_max;
            --end if;
        end if;
    end process;

    -- Min Output Register Process
    process(clk, reset)
    begin
        if reset = '1' then
            min_out <= "1111";
        elsif rising_edge(clk) then
            --if current_min < min_out then
              min_out <= current_min;
            --end if;
        end if;
    end process;

    -- 4-to-1 Multiplexer for the output
    process(sel, shift_registers_0, shift_registers_1, shift_registers_2, shift_registers_3)
    begin
        case sel is
            when "00" => reg_out <= shift_registers_0;
            when "01" => reg_out <= shift_registers_1;
            when "10" => reg_out <= shift_registers_2;
            when "11" => reg_out <= shift_registers_3;
            when others => reg_out <= (others => '0'); -- Default case
        end case;
    end process;

end lab4;