{pkgs, ...}: {
  # we have neovim installed systemwide hence not installed here
  xdg.configFile."nvim".source = ./config;
}
