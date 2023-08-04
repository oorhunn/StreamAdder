library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity streamadder_tb is
end streamadder_tb;

architecture Behavioral of streamadder_tb is
    -- Constants
    constant CLOCK_PERIOD : time := 10 ns;

    -- Signals
    signal clk : STD_LOGIC := '0';
    signal rst : STD_LOGIC := '1'; -- Initialize with reset asserted
    signal data_in, data_in1, data_in2, data_in3, data_in4, data_in5 : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal sum_out : STD_LOGIC_VECTOR(7 downto 0);

begin
    -- Instantiate the streamadder entity
    DUT : entity work.streamadder
        port map (
            clk => clk,
            rst => rst,
            data_in => data_in,
            data_in1 => data_in1,
            data_in2 => data_in2,
            data_in3 => data_in3,
            data_in4 => data_in4,
            data_in5 => data_in5,
            sum_out => sum_out
        );

    -- Clock process
    process
    begin
        for i in 1 to 500 loop  -- 500 clock cycles (now < 5000 ns) as an example
            clk <= '0';
            wait for CLOCK_PERIOD / 2;
            clk <= '1';
            wait for CLOCK_PERIOD / 2;
        end loop;
        wait;
    end process;

    -- Stimulus process
    process
    begin
        -- Wait for a few clock cycles after reset to ensure stability
        wait for 10 ns;

        -- Test case 1: 8-bit numbers
        data_in <= "00000001";
        data_in1 <= "00000001";
        data_in2 <= "00000001";
        data_in3 <= "00000001";
        data_in4 <= "00000001";
        data_in5 <= "00000001";
        rst <= '0'; -- Release reset
        
        wait for 10 ns;
        data_in  <= "00000010";
        data_in1 <= "00000010";
        data_in2 <= "00000010";
        data_in3 <= "00000010";
        data_in4 <= "00000010";
        data_in5 <= "00000010";

        wait for 10 ns;
        data_in  <= "00000011";
        data_in1 <= "00000011";
        data_in2 <= "00000011";
        data_in3 <= "00000011";
        data_in4 <= "00000011";
        data_in5 <= "00000011";
   
        wait for 10 ns;
        data_in  <= "00000100";
        data_in1 <= "00000100";
        data_in2 <= "00000100";
        data_in3 <= "00000100";
        data_in4 <= "00000100";
        data_in5 <= "00000100";
    -- Add more test cases as needed
        wait for 10 ns;
        data_in  <= "00000101";
        data_in1 <= "00000101";
        data_in2 <= "00000101";
        data_in3 <= "00000101";
        data_in4 <= "00000101";
        data_in5 <= "00000101";
        -- Stop simulation
        
        wait for 10 ns;
        data_in  <= "00000000";
        data_in1 <= "00000000";
        data_in2 <= "00000000";
        data_in3 <= "00000000";
        data_in4 <= "00000000";
        data_in5 <= "00000000";
        wait;
    end process;

end Behavioral;
