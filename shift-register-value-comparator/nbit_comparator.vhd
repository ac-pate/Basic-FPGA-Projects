library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;

entity registers_min_max is
    generic (
        WIDTH   : integer := 4   -- width of the shift register
    );
    port( 
        din     : in std_logic_vector(WIDTH-1 downto 0);
        reset   : in std_logic;
        clk     : in std_logic;
        sel     : in std_logic_vector(integer(ceil(log2(real(WIDTH))))-1 downto 0);
        max_out : out std_logic_vector(WIDTH-1 downto 0);
        min_out : out std_logic_vector(WIDTH-1 downto 0);
        reg_out : out std_logic_vector(WIDTH-1 downto 0)
    );
end entity registers_min_max;

architecture behavioral of registers_min_max is
    type reg_array is array(0 to WIDTH-1) of std_logic_vector(WIDTH-1 downto 0);
    signal registers : reg_array;
    signal max_reg, min_reg : std_logic_vector(WIDTH-1 downto 0);
begin
    process (reset, clk)
    begin
        if reset = '1' then
            -- reset to "1000"
            registers <= (others => (others => '0'));
        elsif rising_edge(clk) then
            -- shift the registers
            for i in WIDTH-1 downto 1 loop
                registers(i) <= registers(i-1);
            end loop;
            registers(0) <= din;
        end if;
    end process;

    process (reset, clk)
    begin
        if reset = '1' then
            -- reset max and min values
            max_reg <= (others => '0');
            min_reg <= (others => '0');
        elsif rising_edge(clk) then
            -- determine max and min values
            max_reg <= registers(0);
            min_reg <= registers(0);
            for i in 1 to WIDTH-1 loop
                if registers(i) > max_reg then
                    max_reg <= registers(i);
                elsif registers(i) < min_reg then
                    min_reg <= registers(i);
                end if;
            end loop;
        end if;
    end process;

    process(clk)
    begin
        if rising_edge(clk) then
            -- Update output registers based on sel
            case to_integer(unsigned(sel)) is
                when 0 =>
                    reg_out <= registers(0);
                when 1 =>
                    reg_out <= registers(1);
		when 2 =>
                    reg_out <= registers(2);
		when 3 =>
                    reg_out <= registers(3);
                when others =>
                    reg_out <= registers(to_integer(unsigned(sel)));
            end case;
        end if;

    end process;
    
    max_out <= max_reg;
    min_out <= min_reg;
end architecture behavioral;

