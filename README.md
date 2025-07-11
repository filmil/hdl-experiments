[![Bazel Build Status](https://github.com/filmil/hdl-experiments/actions/workflows/main.yml/badge.svg)](https://github.com/filmil/hdl-experiments/actions/workflows/main.yml)

# `hdl-examples`

This project provides examples of HDL (Hardware Description Language) code, including a D-type flip-flop (DFF) in SystemVerilog and several smaller examples in VHDL. It's intended as a learning exercise for understanding basic HDL concepts, syntax, and design patterns.

## Project Structure

The project is organized as follows:

- `dff/`: Contains the core DFF logic.
    - `dff.sv`: Implements the parameterized D-type flip-flop module.
    - `dff.svh`: Header file for the DFF module (currently seems unused).
    - `top.sv`: A top-level module that instantiates the DFF.
    - `README.md`: Contains notes about the learning goals for this specific module.
- `third_party/`: Contains external dependencies, such as Xilinx libraries.
- `tools/`: Contains utility scripts, like Bazel build tools.
- `BUILD.bazel`, `MODULE.bazel`, `WORKSPACE`: Bazel build system files.

## Purpose

The primary goal of this project is to serve as a hands-on example for understanding:
- Basic SystemVerilog syntax and concepts.
- Module instantiation and parameterization.
- Simple digital logic design (D-type flip-flop).
- Using Bazel for building HDL projects.

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

As noted in `dff/README.md`, a primary goal of this project is to facilitate learning SystemVerilog (sv). The DFF example is a vehicle for exploring HDL concepts.
