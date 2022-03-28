library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity datapath is
    port (
        clk     : in std_logic;
        rst     : in std_logic;
        tot_ld  : in std_logic;
        tot_clr : in std_logic;
        s       : in std_logic_vector(7 downto 0);
        a       : in std_logic_vector(7 downto 0);
        tot_lt_s: out std_logic
    );
end entity datapath;

architecture datapath_arch of datapath is
    
    signal tot: std_logic_vector(7 downto 0);
    signal sum: std_logic_vector(7 downto 0);

begin
    
   tot_reg: process(clk, rst)
   begin
       if rst = '1' then
           tot <= b"00000000";
       elsif rising_edge(clk) then
            if tot_clr = '1' then
                tot <= b"00000000";
            elsif tot_ld = '1' then
               tot <= sum;
           end if;
       end if;
   end process tot_reg;
    
   sum <= std_logic_vector(unsigned(tot) + unsigned(a));

   tot_lt_s <= '1' when unsigned(tot) < unsigned(s) else '0';

end architecture datapath_arch;