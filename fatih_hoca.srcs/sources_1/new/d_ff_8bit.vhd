library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity d_ff_8bit is
    Port (
        D : in  STD_LOGIC_VECTOR(7 downto 0);
        CLK : in  STD_LOGIC;
        CLR : in  STD_LOGIC;
        Q : out STD_LOGIC_VECTOR(7 downto 0)
    );
end d_ff_8bit;

architecture Behavioral of d_ff_8bit is
    signal Q_reg : STD_LOGIC_VECTOR(7 downto 0);
begin
    process (CLK, CLR)
    begin
        if CLR = '1' then
            Q_reg <= (others => '0'); -- Reset to all zeros
        elsif rising_edge(CLK) then
            Q_reg <= D; -- Transfer input D to Q on positive clock edge
        end if;
    end process;

    Q <= Q_reg;
end Behavioral;
