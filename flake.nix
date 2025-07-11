{
  description = "C++ environment using Nix flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };

      in
      {
        devShells.default = with pkgs; (
          mkShell.override { stdenv = gcc14Stdenv; }) {
          name = "flake-example-shell";
          packages = [ 
            nix gnumake flex bison zstd gcc14
            llvm_18 libdwarf elfutils
            libffi pkg-config gawk
            libgcc libgccjit
            gtkwave
          ];
        };
      });
}

