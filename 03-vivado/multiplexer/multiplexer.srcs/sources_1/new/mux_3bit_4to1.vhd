------------------------------------------------------------
--
-- Example of 2-bit binary comparator using the when/else
-- assignments.
-- EDA Playground
--
-- Copyright (c) 2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for 4-bit binary comparator
------------------------------------------------------------
entity comparator_4bit is
    port(
        d_i           : in  std_logic_vector(1 downto 0);
        c_i           : in  std_logic_vector(1 downto 0);
        b_i           : in  std_logic_vector(1 downto 0);
        a_i           : in  std_logic_vector(1 downto 0);
        
        sel_i : out std_logic;
        
        
    );
end entity comparator_4bit;

------------------------------------------------------------
-- Architecture body for 4-bit binary comparator
------------------------------------------------------------
architecture Behavioral of comparator_4bit is
begin
    sel_i   <= '1' when (b_i < a_i) else '0';
   

end architecture Behavioral;
