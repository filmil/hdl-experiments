[![Bazel Build Status](https://github.com/filmil/hdl-experiments/actions/workflows/main.yml/badge.svg)](https://github.com/filmil/hdl-experiments/actions/workflows/main.yml)

# `hdl-examples`

This project provides examples of HDL (Hardware Description Language) code,
including a D-type flip-flop (DFF) in SystemVerilog and several smaller
examples in VHDL. It's intended as a learning exercise for understanding basic
HDL concepts, syntax, and design patterns.

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
