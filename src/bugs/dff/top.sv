// Here's how to get to a constant from a package.
import dffx::dff_bits_count;

module top(
    input logic clk,
    input logic reset_n,

    // This is imported from the module above.
    input logic [dff_bits_count-1:0] input_data,

    // No need to import if referring to full library.
    output logic [dffx::dff_bits_count-1:0] output_data
    );

    logic [7:0] internal_data;

    dff #(
        .BITS_COUNT(dff_bits_count)
    ) dff_i (
        .clk(clk),
        .rst_n(reset_n),
        .d(input_data),
        .q(output_data)
    );

    assign output_data = internal_data;

endmodule
