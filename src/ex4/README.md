# VHDL Example 4 (`src/ex4/`)

This directory contains a VHDL example that demonstrates the use of a local VHDL library.

## Files and Structure

- `ex4.vhdl`: This file likely contains the main VHDL design component for this example. It probably instantiates or uses resources from the `lib1` library.
- `BUILD.bazel`: The Bazel build file for this top-level example module.
- `lib1/`: This subdirectory contains a VHDL library.
    - `lib1.vhdl`: The VHDL code for the library components (e.g., packages, entities, architectures).
    - `lib1/BUILD.bazel`: The Bazel build file specific to compiling and managing `lib1`.

## Purpose

This example is intended to illustrate:
- How to create and use VHDL libraries.
- Referencing components from a library within a VHDL design.
- Structuring a VHDL project with separate library modules.
- How Bazel can manage dependencies between different VHDL modules and libraries within the project.

It might showcase concepts like:
- Library declarations (`library lib1; use lib1.all;`).
- Component instantiation from a library.
- Package usage from a library.
