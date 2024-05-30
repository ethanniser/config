{
  pkgs,
  user,
  ...
}: {
  # defaults I dont understand:
  nixpkgs.hostPlatform = "aarch64-darwin";
  # system.configurationRevision = self.rev or self.dirtyRev or null;
  # backwards compat; don't change
  system.stateVersion = 4;
  nix.settings.experimental-features = "nix-command flakes";
  services.nix-daemon.enable = true;

  # users.users.${user.handle}.home = "/Users/${user.handle}";
  users.users.ethan.home = "/Users/ethan";

  # here go the darwin preferences and config items
  programs.zsh.enable = true;
  environment = {
    shells = with pkgs; [bash zsh];
    loginShell = pkgs.zsh;
    systemPackages = with pkgs; [
    coreutils
    nixpkgs-fmt
    ];
    systemPath = ["/opt/homebrew/bin"];
    pathsToLink = ["/Applications"];
  };
  # system.keyboard.enableKeyMapping = true;
  # system.keyboard.remapCapsLockToEscape = true;
  fonts.fontDir.enable = false;
  fonts.fonts = [(pkgs.nerdfonts.override {fonts = ["Meslo"];})];
  system.defaults = {
    finder.AppleShowAllExtensions = true;
    finder._FXShowPosixPathInTitle = true;
    dock.autohide = true;
    NSGlobalDomain.AppleShowAllExtensions = true;
    NSGlobalDomain.InitialKeyRepeat = 14;
    NSGlobalDomain.KeyRepeat = 1;
  };
  homebrew = {
    enable = true;
    caskArgs.no_quarantine = true;
    global.brewfile = true;
    masApps = {};
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

    ];
    taps = [];
    brews = [];
  };
}
