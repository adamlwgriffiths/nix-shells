{ pkgs ? import <nixpkgs> {} }:

# https://github.com/DavHau/mach-nix
# https://github.com/DavHau/mach-nix/blob/master/examples.md
# https://nixos.wiki/wiki/Python

let
  mach-nix = import (builtins.fetchGit {
    url = "https://github.com/DavHau/mach-nix/";
    ref = "3.3.0";
  }) {};
  custom-python = mach-nix.mkPython {
    python = "python38";
    requirements = builtins.readFile ./requirements.txt;
    providers = {
      _default = "nixpkgs,wheel,sdist";
      # fix for pyopengl not working from pypi
      # https://github.com/NixOS/nixpkgs/issues/76822
      PyOpenGL = "nixpkgs";
      PyOpenGL_accelerate = "nixpkgs";
    };
  };
in pkgs.mkShell {
  buildInputs = with pkgs; [
    glfw
    custom-python
  ];
}
