-- Testing some VHDL concepts.

-- Package declaration, but not a definition. See `ex2_body.vhdl` for that.
-- It doesn't need to be here.
package ex2 is

    constant c: integer;

    type input_level is range -10.0 to +10.0;

    type probablility is range 0.0 to 1.0;

    -- Here is a physical literal.
    type resistance is range 0 to 1e9
        units
            ohm;
            kohm = 1000 ohm;
        end units;

    constant r: resistance;

    type alu_function is (disable, pass, add, subtract, multiply, divide);

    type octal_digit is ('0', '1', '2', '3', '4', '5', '6', '7');

    constant b: boolean;

    constant q: octal_digit;

    subtype small_int is integer range -128 to 127;

end;  -- I think I prefer not having to repeat the name of the thing.

