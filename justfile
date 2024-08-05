default:
  just format
  just diff
  just switch-quiet
  just commit

format:
    alejandra --quiet .

diff:
    #!/usr/bin/env bash
    set -euo pipefail

    if ! git diff --quiet || ! git diff --quiet --cached; then
        git diff -U0
        git diff --cached -U0
    else
        echo "No changes detected."
    fi

switch-quiet:
    #!/usr/bin/env bash
    set -euo pipefail

    darwin-rebuild switch --flake '.?submodules=1' &>nix-switch.log || (
        cat nix-switch.log | grep --color error && false)

switch-loud:
    darwin-rebuild switch --flake '.?submodules=1'

commit:
    #!/usr/bin/env bash
    set -euo pipefail

    if ! git diff --quiet || ! git diff --quiet --cached; then
        gen=$(darwin-rebuild --list-generations | grep current)
        git commit -am "$gen"
        git push --quiet
    else
        echo "No changes to commit."
    fi

update:
    nix flake update