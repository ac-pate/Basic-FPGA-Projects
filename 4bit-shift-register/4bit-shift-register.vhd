library IEEE;
use IEEE.std_logic_1164.all;

entity shift_reg is
	port(
		clk : in std_logic;
		clr : in std_logic;
		data_in : in std_logic;
		q : out std_logic_vector (3 downto 0)
	 );
end shift_reg;

architecture shiftreg of shift_reg is 
signal qs: std_logic_vector(3 downto 0);
begin 

	process (clk, clr)
	begin 
		if clr = '1' then
			qs <= "0000";
		elsif clk'event and clk = '1' then
			qs(3) <= data_in;
			qs(2 downto 0) <= qs(3 downto 1);
		end if;
	end process;
	q <= qs;
end shiftreg;
