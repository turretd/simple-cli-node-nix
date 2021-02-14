{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  buildInputs = with pkgs; [
    nodejs
    yarn
    nodePackages.node2nix
  ];
  DIRENV_LOG_FORMAT="";
}