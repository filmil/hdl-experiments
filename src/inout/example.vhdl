library ieee;
use ieee.std_logic_1164.all;

-- Example inout resolution.

package mypkg is

    type mytype is record
        field1, field2: std_logic;
    end record;

end package;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.mypkg;

entity tb is
end entity;

architecture sim of tb is
    signal resolve: mypkg.mytype;
begin

    resolve <= (field1 => '1', field2 => '1');
    resolve <= (field1 => 'Z', field2 => 'Z');

end architecture;

