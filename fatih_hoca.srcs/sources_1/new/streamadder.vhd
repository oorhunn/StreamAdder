library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity streamadder is
    Port (
        clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        data_in, data_in1, data_in2, data_in3, data_in4, data_in5 : in STD_LOGIC_VECTOR(7 downto 0);
        sum_out : out STD_LOGIC_VECTOR(7 downto 0)
    );
end streamadder;

architecture Behavioral of streamadder is
    signal sum_register, sum_register1, sum_register2, sum_register3, sum_register4, sum_register5, sum_register6, sum_register7 : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal carry_in, carry_in1, carry_in2, carry_in3, carry_in4, carry_in5 : STD_LOGIC := '0';
    signal d_ff_input, d_ff_input1, d_ff_input2 : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal temp_out : std_logic_vector(7 downto 0) := (others => '0');
    
    signal carry_in2_expanded : STD_LOGIC_VECTOR(7 downto 0);

begin
    -- Instantiate 8-bit full adder
    FA0 : entity work.fulladder_8bit port map (A => data_in, B => data_in3, Cin => '0', Sum => sum_register, Cout => carry_in);
    FA1 : entity work.fulladder_8bit port map (A => data_in1, B => data_in4, Cin => '0', Sum => sum_register1, Cout => carry_in1);
    FA2 : entity work.fulladder_8bit port map (A => data_in2, B => data_in5, Cin => '0', Sum => sum_register2, Cout => carry_in2);

    -- Instantiate the D flip-flop and connect it to the output of the full adder
    DFF0 : entity work.d_ff_8bit port map (D => sum_register, CLK => clk, CLR => rst, Q => d_ff_input);
    DFF1 : entity work.d_ff_8bit port map (D => sum_register1, CLK => clk, CLR => rst, Q => d_ff_input1);
    DFF2 : entity work.d_ff_8bit port map (D => sum_register2, CLK => clk, CLR => rst, Q => d_ff_input2);

    carry_in2_expanded <= (others => carry_in2);

    FA3 : entity work.fulladder_8bit port map (A => d_ff_input, B => d_ff_input1, Cin => carry_in, Sum => sum_register4, Cout => carry_in3);
    FA4 : entity work.fulladder_8bit port map (A => d_ff_input2, B => temp_out, Cin => carry_in1, Sum => sum_register5, Cout => carry_in4);

    DFF3 : entity work.d_ff_8bit port map (D => sum_register4, CLK => clk, CLR => rst, Q => sum_register6);
    DFF4 : entity work.d_ff_8bit port map (D => sum_register5, CLK => clk, CLR => rst, Q => sum_register7);
    
    FA5 : entity work.fulladder_8bit port map (A => sum_register6, B => sum_register7, Cin => carry_in3, Sum => temp_out, Cout => carry_in5);

    -- Output the sum from the register
    sum_out <= temp_out;

end Behavioral;
