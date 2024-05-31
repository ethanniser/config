{ pkgs
, user
, ...
}: {

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
    shells = with pkgs; [ bash zsh ];
    loginShell = pkgs.zsh;
    systemPackages = with pkgs; [
      coreutils
      nixpkgs-fmt
    ];
    systemPath = [ "/opt/homebrew/bin" ];
    pathsToLink = [ "/Applications" ];
  };
  # system.keyboard.enableKeyMapping = true;
  # system.keyboard.remapCapsLockToEscape = true;
  fonts.fontDir.enable = false;
  fonts.fonts = [ (pkgs.nerdfonts.override { fonts = [ "Meslo" "IntelOneMono" "FiraCode" "JetBrainsMono" ]; }) ];

  # =================== MAIN STUFF HERE ====================

  system = {
    startup = {
      chime = false;
    };
    defaults = {
      finder = {
        AppleShowAllFiles = true;
        AppleShowAllExtensions = false;
        _FXShowPosixPathInTitle = true;
      };
      dock = {
        autohide = false;
        orientation = "left";
        show-recents = false;
        persistent-apps = [
          "/System/Applications/Messages.app"
          "/Applications/Visual Studio Code.app"
          "/Applications/Arc.app"
          "/Applications/Discord.app"
          "/System/Applications/System Settings.app"
          "/System/Applications/Utilities/Terminal.app"
        ];

      };
      NSGlobalDomain = {
        AppleShowAllFiles = true;
        AppleShowAllExtensions = false;
        AppleShowScrollBars = "Always";
        InitialKeyRepeat = 14;
        KeyRepeat = 6;
        NSAutomaticSpellingCorrectionEnabled = false;
      };
    };
  };
}
