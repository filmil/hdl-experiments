--! @package package_name
--! @brief A simple package.
package package_name is
    --! @brief A function that returns a string.
    --! @return The string "Hello world".
    function value return string;
end package;

package body package_name is
    --! @brief A function that returns a string.
    --! @return The string "Hello world".
    function value return string is
    begin
        return string'("Hello world");
    end;
end package body;

