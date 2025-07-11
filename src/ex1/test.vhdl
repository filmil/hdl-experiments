--! @entity hello_world
--! @brief An entity that prints a message to the console.
entity hello_world is
-- Empty entity has something in it.
end entity hello_world;

library STD;
library IEEE;
use IEEE.std_logic_1164.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;

-- This is the new package we're using.  The symbol name is `value`.
library pkg; use pkg.package_name.value;

--! @architecture test of hello_world
--! @brief The test architecture for the hello_world entity.
architecture test of hello_world is
  --! @subtype word_32
  --! @brief A 32-bit std_logic_vector.
  subtype word_32 is std_logic_vector(31 downto 0);
  --! @signal four_32
  --! @brief A 32-bit signal initialized to 4.
  signal four_32 : word_32 := x"00000004";
  --! @signal counter
  --! @brief An integer signal initialized to 1.
  signal counter : integer := 1;
begin  -- where parallel code is placed
  --! @process my_print
  --! @brief A process that prints the value of `value`, `four_32`, and `counter`.
  my_print : process is
               --! @variable my_line
               --! @brief A line variable for printing.
               variable my_line : line;
             begin
               write(my_line, value);
               write(my_line, string'(" "));
               write(my_line, four_32);
               write(my_line, string'(" "));
               write(my_line, counter);
               writeline(output, my_line); -- write to "output"
               wait;
             end process my_print;
end architecture test;

