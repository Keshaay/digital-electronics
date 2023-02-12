# Lab 1: Martin Poč

### De Morgan's laws

1. Equations of all three versions of logic function f(c,b,a):

   ![vzorec](https://user-images.githubusercontent.com/95315728/218336609-e80e04b7-ebe5-426c-98eb-48d169311ae2.png)


2. Listing of VHDL architecture from design file (`design.vhd`) for all three functions. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

```vhdl
architecture dataflow of gates is
begin
    f_orig_o <= (not(b_i) and a_i) or (c_i and not(b_i or not(a_i)));
    f_nand_o <= not(not(not b_i and a_i) and not(c_i and (not b_i and a_i)));
    f_nor_o  <= not(b_i or not a_i) or not(not c_i or b_i or not a_i);
end architecture dataflow;
```

3. Complete table with logic functions' values:

   | **c** | **b** |**a** | **f_ORIG** | **f_(N)AND** | **f_(N)OR** |
   | :-: | :-: | :-: | :-: | :-: | :-: |
   | 0 | 0 | 0 | 0 | 0 | 0 |
   | 0 | 0 | 1 | 1 | 1 | 1 |
   | 0 | 1 | 0 | 0 | 0 | 0 |
   | 0 | 1 | 1 | 0 | 0 | 0 |
   | 1 | 0 | 0 | 0 | 0 | 0 |
   | 1 | 0 | 1 | 1 | 1 | 1 |
   | 1 | 1 | 0 | 0 | 0 | 0 |
   | 1 | 1 | 1 | 0 | 0 | 0 |

### Distributive laws

1. Screenshot with simulated time waveforms. Always display all inputs and outputs (display the inputs at the top of the image, the outputs below them) at the appropriate time scale!

   ![tb_gates](https://user-images.githubusercontent.com/95315728/218339984-b1896c88-b8c6-4385-9ef9-ae152cf510be.png)


2. Link to your public EDA Playground example:

  [(https://www.edaplayground.com/...)](https://www.edaplayground.com/x/Ldki)
