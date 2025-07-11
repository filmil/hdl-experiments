-- Note that the package body is in this file, while the package declaration
-- is in `ex2.vhdl`.

package body ex2 is

    -- This is some constant declared in a package.
    constant c: integer := -10;

    constant r: resistance := 1 ohm;

    constant b: boolean := false;

    constant q: octal_digit := '1';
end;
