{ pkgs, ... }: {

  imports = [
    ../nvim
    ../git.nix
    ../zsh.nix
  ];

  home = {
    stateVersion = "22.11";
    sessionVariables = {
      PAGER = "less";
      CLICLOLOR = 1;
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
    packages = with pkgs; [
      ripgrep
      fd
      curl
      less
      neovim
      rectangle
      gh
      yt-dlp
      bun
      git
      ffmpeg
      htop
      jq
      nodejs_20
      (pkgs.elixir_1_16.override { erlang = pkgs.erlang_26; })
      speedtest-cli
      python3
      ollama
      wifi-password
      mas
      imagemagick
    ];
  };

  programs = { };
}
