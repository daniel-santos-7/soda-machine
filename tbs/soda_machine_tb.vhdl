library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity soda_machine_tb is
end entity soda_machine_tb;

architecture soda_machine_tb_arch of soda_machine_tb is
    
    component soda_machine is
        port (
            clk: in std_logic;
            rst: in std_logic;
            c:   in std_logic;
            s:  in std_logic_vector(7 downto 0);
            a: in std_logic_vector(7 downto 0);
            d: out std_logic
        );
    end component soda_machine;

    signal clk      : std_logic;
    signal rst      : std_logic;
    signal c        : std_logic;
    signal s        : std_logic_vector(7 downto 0);
    signal a        : std_logic_vector(7 downto 0);
    signal d        : std_logic;

begin
    
    uut: soda_machine port map(
        clk      => clk,
        rst      => rst,
        c        => c,
        s        => s,
        a        => a,
        d        => d
    );

    test: process
    begin

        rst <= '1';
        clk <= '0';
        c   <= '0';
        s   <= b"00000010";
        a   <= b"00000000";

        wait for 10 ns;

        rst <= '0';
        clk <= '0';

        wait for 10 ns;

        clk <= not clk;

        wait for 20 ns;

        clk <= not clk;

        c <= '1';
        a <= b"00000001";

        wait for 20 ns;
        clk <= not clk;
        wait for 20 ns;
        clk <= not clk;

        wait for 20 ns;
        clk <= not clk;
        wait for 20 ns;
        clk <= not clk;

        wait for 20 ns;
        clk <= not clk;
        wait for 20 ns;
        clk <= not clk;

        wait for 20 ns;
        clk <= not clk;
        wait for 20 ns;
        clk <= not clk;

        c <= '0';
        a <= b"00000000";

        wait for 20 ns;
        clk <= not clk;
        wait for 20 ns;
        clk <= not clk;

        wait for 20 ns;
        clk <= not clk;
        wait for 20 ns;
        clk <= not clk;

        wait;

    end process test;
    
end architecture soda_machine_tb_arch;