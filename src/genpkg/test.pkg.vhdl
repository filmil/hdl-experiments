library ieee;
use ieee.std_logic_1164.all;

package test is
    generic (value: natural := 0);

    subtype sometype is std_ulogic_vector(value-1 downto 0);

end package;

library ieee;
use ieee.std_logic_1164.all;
package test32 is new work.test generic map( value => 10);
