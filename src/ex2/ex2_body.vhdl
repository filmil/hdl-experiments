-- Note that the package body is in this file, while the package declaration
-- is in `ex2.vhdl`.

package body ex2 is

    -- This is some constant declared in a package.
    --! @constant c
    --! @brief An integer constant initialized to -10.
    constant c: integer := -10;

    --! @constant r
    --! @brief A resistance constant initialized to 1 ohm.
    constant r: resistance := 1 ohm;

    --! @constant b
    --! @brief A boolean constant initialized to false.
    constant b: boolean := false;

    --! @constant q
    --! @brief An octal_digit constant initialized to '1'.
    constant q: octal_digit := '1';
end;
