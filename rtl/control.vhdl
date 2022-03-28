library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity control is
    port (
        clk      : in std_logic;
        rst      : in std_logic;
        c        : in std_logic;
        tot_lt_s : in std_logic;
        d        : out std_logic;
        tot_ld   : out std_logic;
        tot_clr  : out std_logic
    );
end entity control;

architecture control_arch of control is
    
    type state is (START, WAITING, SUM, GIVE);

    signal curr_state: state;
    signal next_state: state;

begin
    
    fsm: process(clk, rst)
    begin
        if rst = '1' then
            curr_state <= START;
        elsif rising_edge(clk) then
            curr_state <= next_state;
        end if;
    end process fsm;

    fsm_next_state: process(curr_state, c, tot_lt_s)
    begin
        
        case curr_state is
            when START =>
                next_state <= WAITING;
        
            when WAITING =>
                if c = '1' then
                    next_state <= SUM;
                elsif c = '0' and tot_lt_s = '0' then
                    next_state <= GIVE;
                else
                    next_state <= WAITING;
                end if;

            when SUM =>
                next_state <= WAITING;
            when GIVE =>
                next_state <= START;

        end case;

    end process fsm_next_state;

    d <= '1' when curr_state = GIVE else '0';
    tot_ld <= '1' when curr_state = SUM else '0';
    tot_clr <= '1' when curr_state = START else '0';

end architecture control_arch;