{pkgs, ...}: {
  imports = [
    ./scripts
    ./dock-common.nix
  ];

  # defaults I dont understand:
  # ==================== DONT TOUCH ========================
  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;
  # backwards compat; don't change
  system.stateVersion = 4;
  nix.settings.experimental-features = "nix-command flakes";
  nix.enable = true;
  users.users.ethan = {
    home = "/Users/ethan";
    shell = pkgs.zsh;
  };

  # ============== OK YOU CAN CHANGE =====================

  # here go the darwin preferences and config items
  programs.zsh.enable = true;
  environment = {
    shells = with pkgs; [bash zsh];
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
    packages = with pkgs; [
      nerd-fonts.meslo-lg
      nerd-fonts.intone-mono
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
    ];
  };
  # use touch id for sudo
  security = {
    pam.services.sudo_local = {
      enable = true;
      touchIdAuth = true;
    };
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
      NSGlobalDomain = {
        AppleShowAllFiles = false;
        AppleShowAllExtensions = false;
        AppleShowScrollBars = "Always";
        InitialKeyRepeat = 14;
        KeyRepeat = 3;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticWindowAnimationsEnabled = false;
      };
      screencapture = {
        type = "jpg";
      };
    };
  };
}
