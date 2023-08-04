library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench_fulladder_1bit is
end testbench_fulladder_1bit;

architecture testbench of testbench_fulladder_1bit is
    signal A_tb, B_tb, Cin_tb : STD_LOGIC;
    signal Sum_tb, Cout_tb : STD_LOGIC;
begin
    -- Instantiate the 1-bit full adder
    uut : entity work.fulladder_1bit
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
        A_tb <= '0';
        B_tb <= '0';
        Cin_tb <= '0';
        wait for 10 ns;
        
        -- Test case 2
        A_tb <= '0';
        B_tb <= '1';
        Cin_tb <= '0';
        wait for 10 ns;
        
        -- Test case 3
        A_tb <= '1';
        B_tb <= '0';
        Cin_tb <= '0';
        wait for 10 ns;
        
        -- Test case 4
        A_tb <= '1';
        B_tb <= '1';
        Cin_tb <= '0';
        wait for 10 ns;
        
        -- Test case 5 (with carry-in)
        A_tb <= '0';
        B_tb <= '0';
        Cin_tb <= '1';
        wait for 10 ns;
        
        -- Test case 6 (with carry-in)
        A_tb <= '0';
        B_tb <= '1';
        Cin_tb <= '1';
        wait for 10 ns;
        
        -- Test case 7 (with carry-in)
        A_tb <= '1';
        B_tb <= '0';
        Cin_tb <= '1';
        wait for 10 ns;
        
        -- Test case 8 (with carry-in)
        A_tb <= '1';
        B_tb <= '1';
        Cin_tb <= '1';
        wait for 10 ns;
        
        -- End simulation
        wait;
    end process stim_proc;
end testbench;
