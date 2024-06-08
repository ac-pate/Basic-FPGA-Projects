library IEEE;
use IEEE.std_logic_1164.all;

entity sum_of_minterms is
port( a,b,c       : in std_logic;
output            : out std_logic);
end sum_of_minterms;

architecture structural of sum_of_minterms is 
-- declare a and3_gate component

component and3_gate
 port ( in_1, in_2, in_3 :	in std_logic;
	and_out:		out std_logic);
end component;

component or3_gate
 port ( in_1, in_2, in_3 :	in std_logic;
	or_out:		out std_logic);
end component;

-- declare internal signals used to "hook up" components


signal na, nb    	 : std_logic;
signal and_1, and_2, and_3  : std_logic;


begin

na <= not a;
nb <= not b;

-- component instantiation

and1: and3_gate port map(in_1 => na, in_2 => nb, in_3 => c,
			 and_out => and_1);

and2: and3_gate port map(in_1 => na, in_2 => b, in_3 => c,
			 and_out => and_2);

and3: and3_gate port map(in_1 => a, in_2 => b, in_3 => c,
			 and_out => and_3);

or1: or3_gate port map(in_1 => and_1, in_2 => and_2, in_3 => and_3,
			or_out => output);

end structural;
