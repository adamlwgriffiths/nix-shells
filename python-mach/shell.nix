# https://github.com/DavHau/mach-nix
# https://github.com/DavHau/mach-nix/blob/master/examples.md
# https://nixos.wiki/wiki/Python
# https://discourse.nixos.org/t/pygobject-gtkwindow-doesnt-support-property-title/14715/7

let
  pypiDataRev="7f28322aa7baec80e261002076e7b322f153e12f";
  pypiDataSha256="1dj7dg4j0qn9a47aw9fqq4wy9as9f86xbms90mpyyqs0i8g1awjz"; ## commit: master # 2021-08-29T07:53:42Z # DavHau/pypi-deps-db
  mach-nix = import (builtins.fetchGit {
    url = "https://github.com/DavHau/mach-nix/";
    ref = "3.3.0";
  }) {
    inherit pypiDataRev pypiDataSha256;
  };
  pkgs =  mach-nix.nixpkgs;
  cottonmouth = mach-nix.buildPythonPackage {
    name = "cottonmouth";
    src = builtins.fetchGit {
      url = "https://github.com/adamlwgriffiths/cottonmouth";
      ref = "master";
      rev = "34b20827200b41208b2e5a90b4d9c713a74e4939";
    };
  };
  custom-python = mach-nix.mkPython {
    python = "python38";
    requirements = builtins.readFile ./requirements.txt;
    packagesExtra = [
      cottonmouth
    ];
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
