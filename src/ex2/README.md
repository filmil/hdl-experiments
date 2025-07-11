# VHDL Example 2 (`src/ex2/`)

This directory contains a VHDL example that likely demonstrates the separation of entity declaration and architecture body.

## Files

- `ex2.vhdl`: This file probably contains the VHDL `entity` declaration for a design component. The entity defines the interface (ports) of the component.
- `ex2_body.vhdl`: This file likely contains the `architecture` body for the entity declared in `ex2.vhdl`. The architecture defines the internal behavior or structure of the component.
- `BUILD.bazel`: The Bazel build file for this example, defining how to compile and manage this VHDL module.

## Purpose

This example is likely intended to illustrate:
- Declaring a VHDL entity in one file and its architecture in another.
- A specific VHDL design pattern or concept that benefits from this separation.
- How Bazel handles VHDL designs split into multiple files.
