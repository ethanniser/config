{...}: {
  home.file.".config/mpv/mpv.conf".text = builtins.readFile ./mpv.conf;
  home.file.".config/mpv/scripts/echosubs.lua".text = builtins.readFile ./echosubs.lua;
}
