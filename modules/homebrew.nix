{pkgs, ...}: {
  homebrew = {
    enable = true;
    caskArgs.no_quarantine = true;
    global.brewfile = true;
    masApps = {
      "Final Cut Pro" = 424389933;
      "Keynote" = 409183694;
      "iMovie" = 408981434;
      "MainStage" = 634159523;
      "Motion" = 434290957;
      "Dropover" = 1355679052;
      "Pages" = 409201541;
      "GarageBand" = 682658836;
      "Logic Pro" = 634148309;
      "Compressor" = 424390742;
      "Numbers" = 409203825;
      "Hand Mirror" = 1502839586;
      "One Thing" = 1604176982;
    };
    casks = [
      "arc"
      "1password"
      "discord"
      "livebook"
      "slack"
      "steam"
      "visual-studio-code"
      "vlc"
      "zoom"
      "protonvpn"
      "affinity-photo"
      "affinity-designer"
      "affinity-publisher"
      "cleanmymac"
      "raycast"
      "shottr"
      "imageoptim"
      "hiddenbar"
    ];
    taps = [];
    # CHECK NIX FIRST!
    brews = [
      "mailsy"
    ];
  };
}
