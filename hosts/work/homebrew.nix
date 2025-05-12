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
      "shottr"
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
    ];

    # CHECK NIX FIRST!
    brews = [
    ];

    masApps = {
    };
  };
}
