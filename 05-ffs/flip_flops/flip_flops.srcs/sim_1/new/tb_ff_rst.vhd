library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------
entity tb_ff_rst is
    -- Entity of testbench is always empty
end entity tb_ff_rst;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------
architecture testbench of tb_ff_rst is

    constant c_CLK_100MHZ_PERIOD : time := 10 ns;

    --Local signals
    signal s_clk_100MHz : std_logic;
    signal s_rst        : std_logic;
    signal s_data       : std_logic;
    signal s_d_q        : std_logic;
    signal s_d_q_bar    : std_logic;

begin
    -- Connecting testbench signals with d_ff_rst entity
    -- (Unit Under Test)
    uut_d_ff_rst : entity work.d_ff_rst
        port map(
            clk   => sig_clk_100MHz,
            rst   => sig_rst,
            d     => sig_data,
            q     => sig_dq,
            q_bar => sig_dq_bar
        );


 -- Connecting testbench signals with d_ff_rst entity
    -- (Unit Under Test)
    uut_t_ff_rst : entity work.t_ff_rst
        port map(
            clk   => sig_clk_100MHz,
            rst   => sig_rst,
            t     => sig_data,
            q     => sig_tq,
            q_bar => sig_tq_bar
        );
    --------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------
    p_clk_gen : process
    begin
        while now < 200 ns loop -- 20 periods of 100MHz clock
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;                -- Process is suspended forever
    end process p_clk_gen;

    --------------------------------------------------------
    -- Reset generation process
    --------------------------------------------------------
    p_reset_gen : process
    begin
        s_rst <= '0';
        
        wait for 30 ns;
        s_rst <= '1';
        
        wait for 50 ns;
        s_rst <= '1';
        
        wait for 80 ns;
        s_rst <= '0';
        
        wait for 100 ns;
        s_rst <= '0';
        
        wait for 150 ns;
        s_rst <= '1';
        
        wait for 280 ns;
        s_rst <= '0';
        
        wait for 330 ns;
        s_rst <= '1';
        
        wait for 450 ns;
        s_rst <= '0';
        
        wait for 580 ns;
        s_rst <= '1';

        -- ACTIVATE AND DEACTIVATE RESET HERE
        -- wait for XXX ns;
        -- s_rst <= XXX;
        -- wait for XXX ns;
        -- s_rst <= XXX;

        wait;
    end process p_reset_gen;

    --------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------
    p_stimulus : process
    begin
        report "Stimulus process started";
        s_data <='0'; wait for 13 ns;
        
        s_data <='1'; wait for 30 ns;
        s_data <='0'; wait for 53 ns;
        s_data <='1'; wait for 73 ns;
        s_data <='0'; wait for 103 ns;
           

        -- DEFINE YOUR INPUT DATA HERE

        report "Stimulus process finished";
        wait;
    end process p_stimulus;

end architecture testbench;