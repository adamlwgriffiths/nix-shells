{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    bashInteractive
    nim
  ];

  shellHook = ''
    export NIMBLE_DIR="$PWD/.nimble"
  '';
}
