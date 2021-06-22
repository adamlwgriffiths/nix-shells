# https://nixos.wiki/wiki/Python
with import <nixpkgs> {};
with pkgs.python38Packages;

stdenv.mkDerivation {
  name = "python";

  buildInputs = with pkgs; [
    bashInteractive
    python38Full
    python38Packages.setuptools
    python38Packages.pip
    python38Packages.virtualenv
    # installing python packsges from nix won't work here
    # as python path will be wrong
  ];

  shellHook = ''
    SOURCE_DATE_EPOCH=$(date +%s)  # so that we can use python wheels
    YELLOW='\033[1;33m'
    NC="$(printf '\033[0m')"

    echo -e "''${YELLOW}Creating python environment...''${NC}"
    virtualenv --no-setuptools venv > /dev/null
    export PATH=$PWD/venv/bin:$PATH > /dev/null
    export PYTHONPATH=$PWD/venv/lib/python38/site-packages > /dev/null

    # using requirements.txt
    # this doesn't always seeem to run
    # better to call it manually
    #pip install -r requirements.txt > /dev/null
  '';
}
