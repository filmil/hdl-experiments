# VHDL Two-Process Example (`src/twoproc/`)

This directory contains a VHDL example demonstrating the two-process methodology for sequential logic design.

## Files

- `lib.vhdl`: This file contains the VHDL code, likely implementing a sequential circuit (like a flip-flop or register) using two distinct processes:
    - One process for the synchronous logic (clocked behavior).
    - Another process for the asynchronous logic (resets or other asynchronous controls) or for combinatorial logic that feeds the sequential process.
- `BUILD.bazel`: The Bazel build file for this example, used for compiling and managing this VHDL module.

## Purpose

This example is intended to illustrate:
- The two-process design pattern in VHDL, a common way to model sequential elements.
- How to separate synchronous and asynchronous behavior in VHDL code.
- Best practices for writing clear and synthesizable sequential logic.

This is a fundamental concept in VHDL for designing state machines and other clocked circuits.
