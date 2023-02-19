# Lab 2: INSERT_YOUR_FIRSTNAME INSERT_YOUR_LASTNAME

### 2-bit comparator

1. Karnaugh maps for other two functions of 2-bit comparator:

   Greater than:

   ![greaterthan](https://user-images.githubusercontent.com/95315728/219974047-c96c1ce9-4b7d-4750-b0f5-d8d035d5e442.png)

   Less than:

   ![lessthan](https://user-images.githubusercontent.com/95315728/219974053-120835a1-a2ee-4302-a359-6832bf7ae49c.png)

2. Mark the largest possible implicants in the K-map and according to them, write the equations of simplified SoP (Sum of the Products) form of the "greater than" function and simplified PoS (Product of the Sums) form of the "less than" function.

   ![log_rov](https://user-images.githubusercontent.com/95315728/219975359-006d3686-610d-49b9-be4d-afd439170506.png)

### 4-bit comparator

1. Listing of VHDL stimulus process from testbench file (`testbench.vhd`) with at least one assert (use BCD codes of your student ID digits as input combinations). Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

   Last two digits of my student ID: **xxxx??**

```vhdl
    p_stimulus : process
    begin
        -- Report a note at the beginning of stimulus process
        report "Stimulus process started" severity note;

        -- First test case
        s_b <= "0000";        -- Such as "0000" if ID = xxxx05
        s_a <= "0101";        -- Such as "0101" if ID = xxxx05
        wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '1') and
                (s_B_equals_A  = '0') and
                (s_B_less_A    = '0'))
        -- If false, then report an error
        report "Input combination '0000' and '0101' FAILED" severity error;

        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
```

2. Link to your public EDA Playground example:

   https://www.edaplayground.com/x/gRuE
