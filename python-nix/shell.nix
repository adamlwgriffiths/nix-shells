{ pkgs ? import <nixpkgs> {} }:

let
  cottonmouth = pkgs.python3Packages.buildPythonPackage {
    name = "cottonmouth";
    src = builtins.fetchGit {
      url = "https://github.com/adamlwgriffiths/cottonmouth";
      ref = "master";
      rev = "34b20827200b41208b2e5a90b4d9c713a74e4939";
    };
  };
in pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    gobject-introspection
  ];
  buildInputs = with pkgs; [
    (python38.withPackages (ps: with ps; [
      pywebview
      pygobject3
      flask
      flask-socketio
      eventlet
      cottonmouth

      flask-sockets
      gevent
      gevent-websocket
      python-socketio
    ]))
    glib
    gtk3
    webkitgtk
    pkgconfig
    bashInteractive
  ];
}
