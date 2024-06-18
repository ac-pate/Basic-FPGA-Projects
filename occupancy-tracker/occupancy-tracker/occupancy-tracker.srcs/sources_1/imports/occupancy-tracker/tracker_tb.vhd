library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity testbench is
begin
end testbench;

architecture top of testbench is

component occupancy_tracker is
	port(
		clk, reset: in std_logic;
		X,Y: in std_logic;
		max_occupancy: in std_logic_vector(5 downto 0);
		Z: out std_logic
	);
end component occupancy_tracker;

signal my_clk,my_reset	: std_logic;
signal my_X, my_Y	: std_logic;
signal my_max_occupancy	: std_logic_vector(5 downto 0);
signal my_Z		: std_logic;

constant clk_period : time := 10 ns;
constant max_simulation_time : time := 2000 ns;


-- components specification
for tracker_inst: occupancy_tracker use entity work.occupancy_tracker(arch);

begin

clk_gen: process
	variable sim_time : time;
begin
	sim_time := 0 ns;
	while sim_time <= max_simulation_time loop
		my_clk <= '0';
		wait for 5 ns;
		my_clk <= '1';
		wait for 5 ns;
		sim_time := sim_time + clk_period;
	end loop;
	wait;
end process;

tracker_inst: occupancy_tracker port map (
	my_clk,my_reset,my_X,my_Y,my_max_occupancy,my_Z
  );

--stimulus process
gen_stimuli: process
variable start: integer := 0;
variable fin: integer;
begin

--reset, set max occupancy to 5
wait until (my_clk'event and my_clk='0');
	my_reset <= '1';
	my_X <= '0';
	my_Y <= '0';
	my_max_occupancy <= "000101";

wait until (my_clk'event and my_clk='0');
	my_reset <= '0';

wait until (my_clk'event and my_clk='0');
	my_X <= '1';
	my_Y <= '0';

wait until (my_clk'event and my_clk='0');
	my_X <= '0';
	my_Y <= '0';

wait until (my_clk'event and my_clk='0');
	my_X <= '1';
	my_Y <= '0';

wait until (my_clk'event and my_clk='0');
	my_X <= '0';
	my_Y <= '0';

wait until (my_clk'event and my_clk='0');
	my_X <= '1';
	my_Y <= '1';

wait until (my_clk'event and my_clk='0');
	my_X <= '0';
	my_Y <= '0';

wait until (my_clk'event and my_clk='0');
	my_X <= '1';
	my_Y <= '0';

wait until (my_clk'event and my_clk='0');
	my_X <= '0';
	my_Y <= '0';

wait until (my_clk'event and my_clk='0');
	my_X <= '0';
	my_Y <= '1';

wait until (my_clk'event and my_clk='0');
	my_X <= '0';
	my_Y <= '0';

wait until (my_clk'event and my_clk='0');
	my_X <= '1';
	my_Y <= '0';

wait until (my_clk'event and my_clk='0');
	my_X <= '0';
	my_Y <= '0';

wait until (my_clk'event and my_clk='0');
	my_X <= '1';
	my_Y <= '0';

wait until (my_clk'event and my_clk='0');
	my_X <= '0';
	my_Y <= '0';

wait until (my_clk'event and my_clk='0');
	my_X <= '1';
	my_Y <= '0';

wait until (my_clk'event and my_clk='0');
	my_X <= '0';
	my_Y <= '0';

--reset, set max occupancy to 63
wait until (my_clk'event and my_clk='0');
	my_reset <= '1';
	my_X <= '0';
	my_Y <= '0';
	my_max_occupancy <= "111111";

wait until (my_clk'event and my_clk='0');
	my_reset <= '0';

fin := 55;

while start < fin loop

wait until (my_clk'event and my_clk='0');
	my_X <= '0';
	my_Y <= '0';

wait until (my_clk'event and my_clk='0');
	my_X <= '1';
	my_Y <= '0';

start := start + 1;

end loop;

fin:= 5;
start:= 0;
while start < fin loop
wait until (my_clk'event and my_clk='0');
	my_X <= '0';
	my_Y <= '0';

wait until (my_clk'event and my_clk='0');
	my_X <= '0';
	my_Y <= '1';
start := start + 1;
end loop;

start:= 0;
while start < fin loop
wait until (my_clk'event and my_clk='0');
	my_X <= '0';
	my_Y <= '0';

wait until (my_clk'event and my_clk='0');
	my_X <= '1';
	my_Y <= '1';

start := start + 1;
end loop;

start := 0;
fin := 13;
while start < fin loop

wait until (my_clk'event and my_clk='0');
	my_X <= '0';
	my_Y <= '0';

wait until (my_clk'event and my_clk='0');
	my_X <= '1';
	my_Y <= '0';

start := start + 1;

end loop;

wait until(my_clk'event and my_clk='0');
	my_reset <= '1';
	my_X <= '0';
	my_Y <= '0';

wait until(my_clk'event and my_clk='0');
	my_reset <= '0';



end process;
end top;