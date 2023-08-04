library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fulladder_1bit is
    Port (
        A, B, Cin : in  STD_LOGIC;
        Sum, Cout : out STD_LOGIC
    );
end fulladder_1bit;

architecture Behavioral of fulladder_1bit is
begin
    Sum <= A XOR B XOR Cin;
    Cout <= (A AND B) OR (Cin AND (A XOR B));
end Behavioral;
