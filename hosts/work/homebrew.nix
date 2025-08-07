{...}: {
  imports = [
    ../../modules/homebrew-common.nix
  ];

  homebrew = {
    casks = [
      "arc"
      "1password"
      "cursor"
      "slack"
      "visual-studio-code"
      "raycast"
      "rectangle"
      "stats"
      "bartender"
      "microsoft-outlook"
      "obs"
      "docker"
      "karabiner-elements"
      "scroll-reverser"
      "neovide"
      "ghostty"
      "alt-tab"
      "notion"
      "yaak"
      "cleanshot"
      "shottr"
    ];

    # CHECK NIX FIRST!
    brews = [
    ];

    masApps = {
    };
  };
}
