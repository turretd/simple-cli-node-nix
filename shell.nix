{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/ff96a0fa5635770390b184ae74debea75c3fd534.tar.gz") {}, ...}: pkgs.mkShell {
  buildInputs = with pkgs; [
    nodejs
    yarn
    nodePackages.node2nix
  ];
  DIRENV_LOG_FORMAT="";
}