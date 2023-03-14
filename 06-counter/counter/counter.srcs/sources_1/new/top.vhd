library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for top-level design
------------------------------------------------------------
entity top is
    port (
        CLK100MHZ : in std_logic; 
        SW        : in std_logic;
        CA        : out std_logic; 
        CB        : out std_logic; 
        CC        : out std_logic; 
        CD        : out std_logic; 
        CE        : out std_logic; 
        CF        : out std_logic; 
        CG        : out std_logic; 
        AN        : out std_logic_vector(7 downto 0); 
        BTNC      : in std_logic 
    );
end entity top;

------------------------------------------------------------------------
-- Architecture body for top level
------------------------------------------------------------------------
architecture Behavioral of top is

  -- Internal clock enable
  signal sig_en_250ms : std_logic;
  -- Internal counter
  signal sig_cnt_4bit : std_logic_vector(4 - 1 downto 0);

begin

  --------------------------------------------------------------------
  -- Instance (copy) of clock_enable entity
  clk_en0 : entity work.clock_enable
      generic map(
          g_MAX => 25000000
      )
      port map(
          clk   => CLK100MHZ,
          rst => BTNC,
          ce  => sig_en_250ms
      );

  --------------------------------------------------------------------
  -- Instance (copy) of cnt_up_down entity
  bin_cnt0 : entity work.cnt_up_down
     generic map(
          g_CNT_WIDTH => 4
      )
      port map(
          clk       => CLK100MHZ,
          rst       => BTNC,
          en        => sig_en_250ms,
          cnt_up    => SW,
          cnt       => sig_cnt_4bit
      );

  --------------------------------------------------------------------
  -- Instance (copy) of hex_7seg entity
  hex2seg : entity work.hex_7seg
      port map(
          blank  => BTNC,
          hex    => sig_cnt_4bit,
          seg (6) => CA,
          seg (5) => CB,
          seg (4) => CC,
          seg (3) => CD,
          seg (2) => CE,
          seg (1) => CF,
          seg (0) => CG
      );

  AN <= b"1111_1110";

end architecture Behavioral;