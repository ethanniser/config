{...}: {
  imports = [
    ../../modules/homebrew-common.nix
  ];

  homebrew = {
    casks = [
      "arc"
      "1password"
      "discord"
      "livebook"
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
      "imageoptim"
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
      "alt-tab"
      "anki"
      "wireshark"
      # "mpv" # always breaks for some weird reason
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
