```
//] ## `nvc` bugreport
//]
//] It seems that having `logic` as output causes a compile error.
//] Consider the following module.

module mod (
    input logic clkin,
    //] Note the type.
    output reg clkout
);

    always_comb begin
        clkout = clkin;
    end

endmodule

//] This fails with the following message:
//]
//] ```
//] ** Error: 'clkout' cannot be assigned in a procedural block
//] > /home/filmil/code/hw/hdl-experiments/src/nvc_examples/inout/mod.sv:13
//] |
//] 13 |         clkout = clkin;
//] |         ^^^^^^
//] ```
//]
//] Verilator does not seem to have any issues with this.
//]
//] Changing the output declaration to be:
//] ```
//] output reg clkout
//] ```
//] compiles OK.
```
