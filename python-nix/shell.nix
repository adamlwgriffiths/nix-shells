# https://nixos.wiki/wiki/Python
{ pkgs ? import <nixpkgs> {} }:

let
    python-deps = import ./nix/python-deps.nix { pkgs = pkgs; };
    custom-python = python-deps.python;
in pkgs.mkShell {
  buildInputs = with pkgs; [
    bashInteractive
    custom-python
  ];

  shellHook = ''
    # python
    # allow the use of wheels
    SOURCE_DATE_EPOCH=$(date +%s)
    echo -e "Creating python environment..."
    export PYTHONDONTWRITEBYTECODE="True"
    #virtualenv .venv > /dev/null

    #export PATH=$PWD/.venv/bin:$PATH > /dev/null
    #export PYTHONPATH=$PWD/.venv/lib/python38/site-packages > /dev/null
    #export PYTHONPATH=$PWD:$PYTHONPATH > /dev/null
  '';
}
