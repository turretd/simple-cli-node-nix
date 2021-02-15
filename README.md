# `simple-cli-node-nix`

A fun playground to test out building node packages

""Non code change to trigger ci""

## One way to leverage this simple cli somewhere else

### `shell.nix
```
let 
  pkgs = import <nixpkgs> {};
  sources = import ./nix/sources.nix; 
  simple-cli = (import sources.simple-cli { }); 
in 
pkgs.mkShell { 
  buildInputs = [ 
      simple-cli 
  ];  
} 
```

You have to add it with `niv` beforehand
