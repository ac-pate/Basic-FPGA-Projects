library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity registers_min_max is
    port( 
        din     : in std_logic_vector(3 downto 0);
        reset   : in std_logic;
        clk     : in std_logic;
        sel     : in std_logic_vector(1 downto 0);
        max_out : out std_logic_vector(3 downto 0);
        min_out : out std_logic_vector(3 downto 0);
        reg_out : out std_logic_vector(3 downto 0)
    );
end registers_min_max;

architecture rtl of registers_min_max is
    
    signal R0, R1, R2, R3   : std_logic_vector(3 downto 0);
    signal max_val, min_val : std_logic_vector(3 downto 0);
    
begin

    -- Shift registers 
    process(clk, reset)
    begin
        if reset = '1' then
            R0 <= "1000";  -- Reset all registers to a specific value
            R1 <= "1000";
            R2 <= "1000";
            R3 <= "1000";
        elsif rising_edge(clk) then
            R0 <= din;            
            R1 <= R0;             
            R2 <= R1;             
            R3 <= R2;             
        end if;
    end process;

    -- Max/Min combinational logic
    process(R0, R1, R2, R3)
    begin
        max_val <= R0;
        min_val <= R0;
        
        if R1 > max_val then
            max_val <= R1;
        elsif R1 < min_val then
            min_val <= R1;
        end if;
        
        if R2 > max_val then
            max_val <= R2;
        elsif R2 < min_val then
            min_val <= R2;
        end if;
        
        if R3 > max_val then
            max_val <= R3;
        elsif R3 < min_val then
            min_val <= R3;
        end if;
    end process;

    -- Output multiplexer
    process(sel, R0, R1, R2, R3)
    begin
        case sel is
            when "00" => reg_out <= R0;
            when "01" => reg_out <= R1;
            when "10" => reg_out <= R2;
            when "11" => reg_out <= R3;
            when others => reg_out <= (others => '0');  
        end case;
    end process;

    -- Output registers
    process(clk, reset)
    begin
        if reset = '1' then
            max_out <= "0000";
            min_out <= "1111";
        elsif rising_edge(clk) then
            max_out <= max_val;  
            min_out <= min_val;
        end if;
    end process;

end rtl;

