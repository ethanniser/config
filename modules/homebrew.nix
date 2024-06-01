{ pkgs, ... }: {
  homebrew = {
    enable = true;
    caskArgs.no_quarantine = true;
    global.brewfile = true;
    masApps = { };
    casks = [
      "arc"
      "1password"
      "discord"
      "livebook"
      "ollama"
      "slack"
      "steam"
      "visual-studio-code"
      "vlc"
      "zoom"
      "protonvpn"
      "affinity-photo"
      "affinity-designer"
      "affinity-publisher"
    ];
    taps = [ ];
    # CHECK NIX FIRST!
    brews = [
      "mailsy"
    ];
  };
}
