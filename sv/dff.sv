module dff #(
    BITS_COUNT = 7
)
(
    input logic clk,
    input logic [BITS_COUNT-1:0] d,
    input logic rst_n,
    output logic q,
    output logic q_n
);

    logic [BITS_COUNT-1:0] d_s;

    always_ff @(posedge clk) begin
        // Synchronous reset here.
        q <= d_s;
        q_n <= ~d_s;
    end

    always_comb begin
        d_s = d;
        if (~rst_n) begin
            d_s = 0;
        end
    end

endmodule

