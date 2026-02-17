{...}: {
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      upgrade = true;
      cleanup = "zap";
    };

    caskArgs.no_quarantine = true;
    global.brewfile = true;

    casks = [
      "claude-code"
    ];
    # CHECK NIX FIRST!
    brews = [];
    taps = [];
  };
}
