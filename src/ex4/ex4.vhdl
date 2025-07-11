library ex4_lib1;
use ex4_lib1.lib1;

--! @package ex4
--! @brief A package that uses a constant from another library.
package ex4 is

    --! @constant ex4_const
    --! @brief An integer constant initialized with a value from lib1.
    constant ex4_const: integer := lib1.c;

end package ex4;
