_: {
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    settings = {
      font_family = "MesloLGM Nerd Font";
      italic_font = "MesloLGM Nerd Font Italic";
      bold_font = "MesloLGM Nerd Font Bold";
    };
    extraConfig = ''
    '';
  };
}
