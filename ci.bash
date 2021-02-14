#!/usr/bin/env nix-shell
#!nix-shell shell.nix -i bash

set -euo pipefail

yarn test
yarn build