library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench_fulladder_8bit is
end testbench_fulladder_8bit;

architecture testbench of testbench_fulladder_8bit is
    signal A_tb, B_tb : STD_LOGIC_VECTOR(7 downto 0);
    signal Cin_tb : STD_LOGIC;
    signal Sum_tb : STD_LOGIC_VECTOR(7 downto 0);
    signal Cout_tb : STD_LOGIC;
begin
    -- Instantiate the 8-bit full adder
    uut : entity work.fulladder_8bit
        port map (
            A => A_tb,
            B => B_tb,
            Cin => Cin_tb,
            Sum => Sum_tb,
            Cout => Cout_tb
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- Test case 1
        A_tb <= "00000001";
        B_tb <= "00000001";
        Cin_tb <= '0';
        wait for 10 ns;
        
        -- Test case 2
        A_tb <= "11111111";
        B_tb <= "00000001";
        Cin_tb <= '0';
        wait for 10 ns;
        
        -- Test case 3 (with carry-in)
        A_tb <= "00001111";
        B_tb <= "00001111";
        Cin_tb <= '1';
        wait for 10 ns;
        
        -- Test case 4 (with carry-in)
        A_tb <= "11111111";
        B_tb <= "11111111";
        Cin_tb <= '1';
        wait for 10 ns;
        
        -- End simulation
        wait;
    end process stim_proc;
end testbench;
