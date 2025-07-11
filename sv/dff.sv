package dffx;

    //interface one_ff (
        //input logic clk,
        //input logic reset_n
    //);
    //endinterface

    parameter dff_bits_count = 8;
endpackage

// Test
module dff #(
    BITS_COUNT = 8
)(
    input logic clk,
    input logic [BITS_COUNT-1:0] d,
    input logic rst_n,
    output logic q,
    output logic q_n
);

    logic [BITS_COUNT-1:0] d_s;

    // The sequential process bits.
    always_ff @(posedge clk) begin
        q <= d_s;
        q_n <= ~d_s; // d_s == d (as signal)
    end

    // The combinatorial process bits.
    always_comb begin
        d_s = d;
        if (~rst_n) begin
            d_s = 0;
        end
    end

endmodule

