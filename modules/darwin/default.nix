{pkgs, ...}: {
  imports = [
    ../scripts
  ];

  # defaults I dont understand:
  # ==================== DONT TOUCH ========================
  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;
  # backwards compat; don't change
  system.stateVersion = 4;
  nix.settings.experimental-features = "nix-command flakes";
  services.nix-daemon.enable = true;
  users.users.ethan = {
    home = "/Users/ethan";
    shell = pkgs.zsh;
  };

  # ============== OK YOU CAN CHANGE =====================

  # here go the darwin preferences and config items
  programs.zsh.enable = true;
  environment = {
    shells = with pkgs; [bash zsh];
    loginShell = pkgs.zsh;
    systemPackages = with pkgs; [
      coreutils
      vim
      tmux
    ];
    systemPath = ["/opt/homebrew/bin" "/Users/ethan/.npm-global/bin"];
    pathsToLink = ["/Applications"];
  };
  # system.keyboard.enableKeyMapping = true;
  # system.keyboard.remapCapsLockToEscape = true;
  fonts = {
    fontDir.enable = false;
    fonts = with pkgs; [
      (nerdfonts.override {
        fonts = [
          "Meslo"
          "IntelOneMono"
          "FiraCode"
          "JetBrainsMono"
        ];
      })
    ];
  };

  # =================== MAIN STUFF HERE ====================

  system = {
    startup = {
      chime = false;
    };
    defaults = {
      loginwindow = {
        GuestEnabled = false;
        DisableConsoleAccess = true;
      };
      finder = {
        AppleShowAllFiles = true;
        AppleShowAllExtensions = true;
        _FXShowPosixPathInTitle = true;
        ShowPathbar = true;
        ShowStatusBar = true;
      };
      dock = {
        showhidden = true;
        autohide = true;
        autohide-delay = 0.0;
        autohide-time-modifier = 0.0;
        orientation = "left";
        show-recents = false;
        persistent-apps = [
          "/System/Applications/Messages.app"
          "/Applications/Visual Studio Code.app"
          "/Applications/Arc.app"
          "/Applications/Discord.app"
          "/Applications/Slack.app"
          "/System/Applications/System Settings.app"
          "/Users/ethan/Applications/Home Manager Apps/kitty.app"
          "/Applications/Obsidian.app"
          "/Applications/Microsoft Outlook.app"
        ];
        mineffect = "scale";
        minimize-to-application = true;
        wvous-br-corner = 4; # desktop
        wvous-bl-corner = 3; # application windows
        wvous-tr-corner = 12; # notification center
        wvous-tl-corner = 2; # mission control
      };
      NSGlobalDomain = {
        AppleShowAllFiles = false;
        AppleShowAllExtensions = false;
        AppleShowScrollBars = "Always";
        InitialKeyRepeat = 14;
        KeyRepeat = 3;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
      };
      screencapture = {
        type = "jpg";
      };
    };
  };
}
