{pkgs ? import <nixpkgs> {}, ...}:

let
  nodeDependencies = (pkgs.callPackage ./node2nix.nix {}).shell.nodeDependencies;
in
pkgs.stdenv.mkDerivation {
  name = "simple-cli";
  src = ./.;
  buildInputs = with pkgs; [nodejs yarn];
  buildPhase = ''
    ln -s ${nodeDependencies}/lib/node_modules ./node_modules
    export PATH="${nodeDependencies}/bin:$PATH"
    # Build the distribution bundle in "dist"
    yarn build
  '';
  installPhase = ''
    cp -r dist $out/
  '';
}