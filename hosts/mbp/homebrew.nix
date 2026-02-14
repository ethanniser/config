{...}: {
  imports = [
    ../../modules/homebrew-common.nix
  ];

  homebrew = {
    casks = [
      "arc"
      "1password"
      "discord"
      "slack"
      "steam"
      "visual-studio-code"
      "zoom"
      "protonvpn"
      "affinity-photo"
      "affinity-designer"
      "affinity-publisher"
      "cleanmymac"
      "raycast"
      "obsidian"
      "rectangle"
      "stats"
      "bartender"
      "microsoft-outlook"
      "obs"
      "karabiner-elements"
      "scroll-reverser"
      "backblaze"
      "UTM"
      "anki"
      "cyberduck"
      "ghostty"
      "cursor"
      "cleanshot"
      "shottr"
      "orbstack"
    ];

    # CHECK NIX FIRST!
    brews = [
    ];

    masApps = {
    };
  };
}
