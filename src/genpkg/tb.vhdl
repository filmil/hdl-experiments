library ieee;
use ieee.std_logic_1164.all;

library work;
use work.test;

entity tb is
end entity;


architecture sim of tb is
    signal foo: work.test32.sometype := (others => '0');

begin

end architecture;
