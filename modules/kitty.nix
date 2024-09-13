_: {
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    settings = {
      font_family = "MesloLGS Nerd Font";
      macos_option_as_alt = "yes";
    };
    extraConfig = ''
    '';
  };
}
