[![Bazel Build Status](https://github.com/filmil/hdl-experiments/actions/workflows/main.yml/badge.svg)](https://github.com/filmil/hdl-experiments/actions/workflows/main.yml)

# `hdl-examples`

This project provides examples of HDL (Hardware Description Language) code, including a D-type flip-flop (DFF) in SystemVerilog and several smaller examples in VHDL. It's intended as a learning exercise for understanding basic HDL concepts, syntax, and design patterns.

## Project Structure

The project is organized as follows:

- `src/`: Contains all HDL source code.
    - `dff/`: A D-type flip-flop implemented in SystemVerilog.
    - `ex1/`: A simple VHDL example.
    - `ex2/`: Another VHDL example, demonstrating a different concept.
    - `ex3/`: A third VHDL example.
    - `ex4/`: A VHDL example with a library.
    - `twoproc/`: A VHDL example using a two-process design.
- `third_party/`: Contains external dependencies, such as Xilinx libraries and NVC.
- `tools/`: Contains utility scripts, like Bazel build tools.
- `BUILD.bazel`, `MODULE.bazel`, `WORKSPACE`: Bazel build system files.
- `.github/`: Contains GitHub Actions CI configuration.

## Purpose

The primary goal of this project is to serve as a hands-on example for understanding:
- Basic SystemVerilog and VHDL syntax and concepts.
- Module instantiation and parameterization in SystemVerilog.
- VHDL entity, architecture, and package concepts.
- Simple digital logic design.
- Using Bazel for building HDL projects.
- Continuous Integration (CI) with GitHub Actions.

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

This project aims to facilitate learning SystemVerilog and VHDL. The examples provided cover various fundamental concepts in both languages.
