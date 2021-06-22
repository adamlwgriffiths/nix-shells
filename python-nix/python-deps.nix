{ nixpkgs ? <nixpkgs>, pkgs }:

let
  custom-python-packages = python-packages: with pkgs; [
    python3Packages.ipython
    python3Packages.numpy
  ];
  python = with pkgs; python38.withPackages custom-python-packages;
in rec {
  inherit python;
}
