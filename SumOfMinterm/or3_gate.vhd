library IEEE; use IEEE.std_logic_1164.all;

entity or3_gate  is
port( in_1, in_2, in_3: in std_logic;
      or_out : out std_logic);
end;


architecture example of or3_gate is begin
  or_out <= in_1 or in_2 or in_3; 
end;



