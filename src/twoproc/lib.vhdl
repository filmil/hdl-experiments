library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Not really needed, but let's try it out.
package iface is
    type count_type is record
        val: integer;
        zero: boolean;
    end record;

    constant zero: count_type := (0, true);

end package;

-- I forgot this bit: you must re-declare the `library` and `use`.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.iface.all;
entity counter is
    port (
        clk: in std_logic;
        rst_n: in std_logic;
        output: out count_type
    );
end entity counter;

architecture rtl of counter is

    signal r, rin: count_type;

begin

    seq: process(clk)
    begin
        if rising_edge(clk) then r <= rin; end if;
    end process;

    comb: process(r)
        variable v: count_type;
    begin
        v := r; -- initialize

        v.val := (v.val + 1) mod 10; -- increment the counter
        v.zero := v.val = 0; -- compute the zero flag
        
        if rst_n = '1' then -- sync reset
            v := zero;
        end if;

        rin <= v; -- drive the sequential input
        output <= v; -- drive the output
    end process;

end architecture;

