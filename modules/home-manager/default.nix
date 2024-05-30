{ pkgs, ... }: {

  imports = [
    ../nvim
    ../git.nix
    # ../zsh.nix  
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
      youtube-dl
      bun
      git
      ffmpeg
      htop
      jq
      nodejs_20
      (pkgs.elixir_1_16.override { erlang = pkgs.erlang_26; })
    ];
  };

  programs = { };
}
