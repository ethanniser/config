_: {
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    settings = {
      font_family = "FiraCode Nerd Font";
      italic_font = "FiraCode Nerd Font Italic";
    };
    extraConfig = ''
    '';
  };
}
