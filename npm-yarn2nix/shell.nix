{ pkgs ? import <nixpkgs> {} }:

let
  nodejs = pkgs.nodejs-16_x;
  yarn = pkgs.yarn.override { inherit nodejs; };
  yarn2nix-moretea = pkgs.yarn2nix-moretea.override { inherit nodejs yarn; };
  npm-packages = mkYarnPackage {
    name = "npm-packages";
    src = ./.;
    publishBinsFor = [
      "miniflare"
    ];
  };
in pkgs.mkShell {
  buildInputs = with pkgs; [
    nodejs
    yarn
    yarn2nix
    npm-packages
  ];
}
