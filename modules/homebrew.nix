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
    ];
    taps = [ ];
    brews = [ ];
  };
}
