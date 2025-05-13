switch host:
    just format
    just diff
    just switch-loud {{ host }}
    just commit

format:
    alejandra --quiet .

diff:
    #!/usr/bin/env bash
    set -euo pipefail

    if ! git diff --quiet || ! git diff --quiet --cached; then
        git --no-pager diff -U0 
        git --no-pager diff --cached -U0
    else
        echo "No changes detected."
    fi

switch-quiet host:
    #!/usr/bin/env bash
    set -euo pipefail

    nix flake update nvim
    darwin-rebuild switch --flake .#{{ host }} &>nix-switch.log || (
        cat nix-switch.log | grep --color error && false)

switch-loud host:
    nix flake update nvim
    darwin-rebuild switch --flake .#{{ host }}

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
