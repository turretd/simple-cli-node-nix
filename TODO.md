#`pressing questions`

How do I leverage a derivation that is sitting in my binary cache at cachix?
When I nix-build my package, I would like to have the derivation available for upstream projects, is this possible?

How can I use it in other projects without having to build it again?
Building node projects seems costly as I have to node2nix and transfer the nix files to where ever I want to use that package in order to build it correctly.

What is the right way to do this? Is it an antipattern to leverage the binary cache to access built code?

How do I discover a derivation in the binary cache? Is it pinned by sha and rev? Or how?