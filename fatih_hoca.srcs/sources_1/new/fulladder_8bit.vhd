library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fulladder_8bit is
    Port (
        A, B : in  STD_LOGIC_VECTOR(7 downto 0);
        Cin : in  STD_LOGIC;
        Sum : out STD_LOGIC_VECTOR(7 downto 0);
        Cout : out STD_LOGIC
    );
end fulladder_8bit;

architecture Behavioral of fulladder_8bit is
    signal carry : STD_LOGIC_VECTOR(7 downto 0);
begin
    -- Instantiate eight 1-bit full adders and connect them in series
    FA0 : entity work.fulladder_1bit port map (A => A(0), B => B(0), Cin => Cin, Sum => Sum(0), Cout => carry(0));
    FA1 : entity work.fulladder_1bit port map (A => A(1), B => B(1), Cin => carry(0), Sum => Sum(1), Cout => carry(1));
    FA2 : entity work.fulladder_1bit port map (A => A(2), B => B(2), Cin => carry(1), Sum => Sum(2), Cout => carry(2));
    FA3 : entity work.fulladder_1bit port map (A => A(3), B => B(3), Cin => carry(2), Sum => Sum(3), Cout => carry(3));
    FA4 : entity work.fulladder_1bit port map (A => A(4), B => B(4), Cin => carry(3), Sum => Sum(4), Cout => carry(4));
    FA5 : entity work.fulladder_1bit port map (A => A(5), B => B(5), Cin => carry(4), Sum => Sum(5), Cout => carry(5));
    FA6 : entity work.fulladder_1bit port map (A => A(6), B => B(6), Cin => carry(5), Sum => Sum(6), Cout => carry(6));
    FA7 : entity work.fulladder_1bit port map (A => A(7), B => B(7), Cin => carry(6), Sum => Sum(7), Cout => Cout);
end Behavioral;
