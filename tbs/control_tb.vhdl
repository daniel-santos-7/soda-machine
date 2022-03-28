library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity control_tb is
end entity control_tb;

architecture control_tb_arch of control_tb is
    
    component control is
        port (
            clk      : in std_logic;
            rst      : in std_logic;
            c        : in std_logic;
            tot_lt_s : in std_logic;
            d        : out std_logic;
            tot_ld   : out std_logic;
            tot_clr  : out std_logic
        );
    end component control;

    signal clk      : std_logic;
    signal rst      : std_logic;
    signal c        : std_logic;
    signal tot_lt_s : std_logic;
    signal d        : std_logic;
    signal tot_ld   : std_logic;
    signal tot_clr  : std_logic;

begin
    
    uut: control port map(
        clk      => clk,
        rst      => rst,
        c        => c,
        tot_lt_s => tot_lt_s,
        d        => d,
        tot_ld   => tot_ld,
        tot_clr  => tot_clr
    );

    test: process
    begin

        rst      <= '1';
        clk      <= '0';
        c        <= '0';
        tot_lt_s <= '1';

        wait for 10 ns;

        rst <= '0';
        clk <= '0';

        wait for 10 ns;

        clk <= not clk;

        wait for 20 ns;

        clk <= not clk;

        c <= '1';

        wait for 20 ns;

        clk <= not clk;

        wait for 20 ns;

        assert tot_ld = '1' report "erro: tot_ld diferente de 1" severity error;

        wait;

    end process test;
    
end architecture control_tb_arch;