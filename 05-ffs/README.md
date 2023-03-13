# Lab 5: Martin Poč

### D & T Flip-flops

1. Screenshot with simulated time waveforms. Try to simulate both D- and T-type flip-flops in a single testbench with a maximum duration of 200 ns, including reset. Always display all inputs and outputs (display the inputs at the top of the image, the outputs below them) at the appropriate time scale!

   ![sig_tq](https://user-images.githubusercontent.com/95315728/224822916-857b0688-e6fb-4ade-9b74-899101f7eee8.png)
### JK Flip-flop

1. Listing of VHDL architecture for JK-type flip-flop. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

```vhdl
architecture Behavioral of jk_ff_rst is
signal sig_q : std_logic;
begin
    p_jk_ff_rst : process (clk)
    begin
        if rising_edge(clk) then
            if (rst = '1') then
                sig_q <= '0';
            elsif (j = '0') and (k = '0') then
                  sig_q <= sig_q;  
            elsif (j = '0') and (k = '1') then
                  sig_q <= '0';
            elsif (j = '1') and (k = '0') then
                  sig_q <= '1';      
            else
                sig_q <=  not sig_q;
            end if; 
        end if;
    end process p_jk_ff_rst;

    -- Output ports are permanently connected to local signal
    q     <= sig_q;
    q_bar <= not sig_q;
end architecture Behavioral;
```

### Shift register

1. Image of `top` level schematic of the 4-bit shift register. Use four D-type flip-flops and connect them properly. The image can be drawn on a computer or by hand. Always name all inputs, outputs, components and internal signals!

   ![d_ff](https://user-images.githubusercontent.com/95315728/224828664-a23bfe34-1b6c-4b9d-b137-934b4e50c4db.jpg)
