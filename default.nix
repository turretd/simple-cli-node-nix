{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/ff96a0fa5635770390b184ae74debea75c3fd534.tar.gz") {}, ...}:
let
  nodeDependencies = (pkgs.callPackage ./packages/simple-cli/node2nix.nix {}).shell.nodeDependencies;
in
pkgs.stdenv.mkDerivation {
  name = "simple-cli";
  src = ./packages/simple-cli;
  buildInputs = with pkgs; [nodejs yarn];
  buildPhase = ''
    ln -s ${nodeDependencies}/lib/node_modules ./node_modules
    export PATH="${nodeDependencies}/bin:$PATH"
    # Build the distribution bundle in "dist"
    yarn build
  '';
  installPhase = ''
    mkdir -p $out/bin
    target=$out/bin/simple-cli
    >>$target echo '#!${pkgs.nodejs}/bin/node'
    >>$target echo "require('$src/dist/index.js')";
    chmod +x $target
  '';
}
