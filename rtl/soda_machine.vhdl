library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity soda_machine is
    port (
        clk: in std_logic;
        rst: in std_logic;
        c:   in std_logic;
        s:  in std_logic_vector(7 downto 0);
        a: in std_logic_vector(7 downto 0);
        d: out std_logic
    );
end entity soda_machine;

architecture soda_machine of soda_machine is
    
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

    component datapath is
        port (
            clk     : in std_logic;
            rst     : in std_logic;
            tot_ld  : in std_logic;
            tot_clr : in std_logic;
            s       : in std_logic_vector(7 downto 0);
            a       : in std_logic_vector(7 downto 0);
            tot_lt_s: out std_logic
        );
    end component datapath;

    signal tot_ld:   std_logic;
    signal tot_clr:  std_logic;
    signal tot_lt_s: std_logic;

begin
    
    machine_control: control port map(
        clk      => clk,
        rst      => rst,
        c        => c,
        tot_lt_s => tot_lt_s,
        d        => d,
        tot_ld   => tot_ld,
        tot_clr  => tot_clr
    );

    machine_datapath: datapath port map(
        clk      => clk,
        rst      => rst,
        tot_ld   => tot_ld,
        tot_clr  => tot_clr,
        s        => s,
        a        => a,
        tot_lt_s => tot_lt_s
    );
    
end architecture soda_machine;