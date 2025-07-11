-- Testing some VHDL concepts.

-- Package declaration, but not a definition. See `ex2_body.vhdl` for that.
-- It doesn't need to be here.
--! @package ex2
--! @brief A package demonstrating various VHDL types and constants.
package ex2 is

    --! @constant c
    --! @brief An integer constant.
    constant c: integer;

    --! @type input_level
    --! @brief A floating-point type representing an input level.
    type input_level is range -10.0 to +10.0;

    --! @type probablility
    --! @brief A floating-point type representing a probability.
    type probablility is range 0.0 to 1.0;

    -- Here is a physical literal.
    --! @type resistance
    --! @brief A physical type representing electrical resistance.
    type resistance is range 0 to 1e9
        units
            ohm;
            kohm = 1000 ohm;
        end units;

    --! @constant r
    --! @brief A constant of type resistance.
    constant r: resistance;

    --! @type alu_function
    --! @brief An enumerated type representing ALU functions.
    type alu_function is (disable, pass, add, subtract, multiply, divide);

    --! @type octal_digit
    --! @brief An enumerated type representing octal digits.
    type octal_digit is ('0', '1', '2', '3', '4', '5', '6', '7');

    --! @constant b
    --! @brief A boolean constant.
    constant b: boolean;

    --! @constant q
    --! @brief A constant of type octal_digit.
    constant q: octal_digit;

    --! @subtype small_int
    --! @brief An integer subtype with a reduced range.
    subtype small_int is integer range -128 to 127;

end;  -- I think I prefer not having to repeat the name of the thing.

