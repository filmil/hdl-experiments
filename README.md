# `hdl_examples`

This project provides examples of HDL (Hardware Description Language) code, including a D-type flip-flop (DFF) in SystemVerilog and several smaller examples in VHDL. It's intended as a learning exercise for understanding basic HDL concepts, syntax, and design patterns.

## Project Structure

The project is organized as follows:

- `dff/`: Contains the core DFF logic.
    - `dff.sv`: Implements the parameterized D-type flip-flop module.
    - `dff.svh`: Header file for the DFF module (currently seems unused).
    - `top.sv`: A top-level module that instantiates the DFF.
    - `README.md`: Contains notes about the learning goals for this specific module.
- `ex1/`: VHDL "Hello World" example demonstrating basic printing and package usage.
    - `package.vhdl`: Defines a simple package.
    - `test.vhdl`: Testbench that uses the package and prints messages.
- `ex2/`: VHDL example focusing on data types, constants, and package structure.
    - `ex2.vhdl`: Package declaration with various type and constant declarations.
    - `ex2_body.vhdl`: Package body defining the constants.
- `ex3/`: VHDL example of a simple thermostat controller.
    - `ex3.vhdl`: Implements the thermostat logic using a process.
- `ex4/`: VHDL example demonstrating library usage.
    - `ex4.vhdl`: Package that uses a constant from a library.
    - `lib1/lib1.vhdl`: Defines the library package `lib1`.
- `twoproc/`: VHDL example of a counter using the two-process methodology.
    - `lib.vhdl`: Implements the counter with separate sequential and combinational processes.
- `third_party/`: Contains external dependencies, such as Xilinx libraries.
- `tools/`: Contains utility scripts, like Bazel build tools.
- `BUILD.bazel`, `MODULE.bazel`, `WORKSPACE`: Bazel build system files.

## Purpose

The primary goal of this project is to serve as a hands-on example for understanding:
- Basic SystemVerilog syntax and concepts, illustrated by the DFF example.
- Basic VHDL syntax and concepts, illustrated by various small examples (`ex1` through `ex4`, `twoproc`).
- Common HDL design patterns and techniques (e.g., module instantiation, parameterization, two-process methodology).
- Simple digital logic design (e.g., D-type flip-flop, thermostat, counter).
- Using Bazel for building HDL projects involving both SystemVerilog and VHDL.

## Usage

This project uses Bazel as its build system.

To build all defined targets in the project, you can run:

```bash
bazel build //...
```

The project also uses formatting and dependency management tools:
- `buildifier`: For formatting Bazel files. Run with `bazel run //:buildifier`.
- `gazelle`: For managing Bazel dependencies. Run with `bazel run //:gazelle`.

## Learning Goals

A primary goal of this project is to facilitate learning SystemVerilog (sv) and VHDL. The examples provided (DFF for SystemVerilog, and `ex1`-`ex4`, `twoproc` for VHDL) serve as vehicles for exploring various HDL concepts, syntax, and design patterns. The project aims to provide a practical introduction to both languages for beginners.
