library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Not really needed, but let's try it out.
--! @package iface
--! @brief A package defining a counter type and its zero value.
package iface is
    --! @type count_type
    --! @brief A record type for the counter, containing its value and a zero flag.
    type count_type is record
        val: integer;
        zero: boolean;
    end record;

    --! @constant zero
    --! @brief The zero value for the count_type.
    constant zero: count_type := (0, true);

end package;

-- I forgot this bit: you must re-declare the `library` and `use`.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.iface.all;
--! @entity counter
--! @brief A simple counter entity.
entity counter is
    port (
        --! @in clk : std_logic
        --! @brief Clock input.
        clk: in std_logic;
        --! @in rst_n : std_logic
        --! @brief Asynchronous reset input (active low).
        rst_n: in std_logic;
        --! @out output : count_type
        --! @brief Counter output.
        output: out count_type
    );
end entity counter;

--! @architecture rtl of counter
--! @brief RTL architecture for the counter entity.
architecture rtl of counter is

    --! @signal r
    --! @brief Register for storing the current counter value.
    --! @signal rin
    --! @brief Input to the counter register.
    signal r, rin: count_type;

begin

    --! @process seq
    --! @brief Sequential process for updating the counter register.
    --! @sensitivity clk
    seq: process(clk)
    begin
        if rising_edge(clk) then r <= rin; end if;
    end process;

    --! @process comb
    --! @brief Combinational process for calculating the next counter value.
    --! @sensitivity r, rst_n
    comb: process(r, rst_n)
        --! @variable v
        --! @brief Variable to hold the next state of the counter.
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

