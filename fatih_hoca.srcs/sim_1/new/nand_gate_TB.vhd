library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_nand_gate is
end tb_nand_gate;

architecture testbench of tb_nand_gate is

    -- Component Declaration for the DUT (Design Under Test)
    component nand_gate
        Port ( A : in STD_LOGIC;
               B : in STD_LOGIC;
               C : out STD_LOGIC);
    end component;

    -- Signal declarations
    signal A_tb, B_tb, C_tb : STD_LOGIC;

begin

    -- Instantiation of the DUT
    uut_nand_gate: nand_gate
        port map (A => A_tb, B => B_tb, C => C_tb);

    -- Stimulus process
    stim_proc: process
    begin
        -- Test case 1: A = 0, B = 0
        A_tb <= '0';
        B_tb <= '0';
        wait for 10 ns;

        -- Test case 2: A = 0, B = 1
        A_tb <= '0';
        B_tb <= '1';
        wait for 10 ns;

        -- Test case 3: A = 1, B = 0
        A_tb <= '1';
        B_tb <= '0';
        wait for 10 ns;

        -- Test case 4: A = 1, B = 1
        A_tb <= '1';
        B_tb <= '1';
        wait for 10 ns;

        -- Add more test cases as needed

        -- End the simulation
        wait;
    end process;

end testbench;
