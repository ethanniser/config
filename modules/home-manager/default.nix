{pkgs, ...}: {
  imports = [
    ../nvim
    ../git.nix
    ../zsh
    ../tmux.nix
    ../kitty.nix
  ];

  home = {
    stateVersion = "22.11";
    sessionVariables = {
      PAGER = "less";
      CLICLOLOR = 1;
      EDITOR = "nvim";
      VISUAL = "nvim";
      ENV = "/Users/ethan/.config/zsh/.zshrc";
      NPM_CONFIG_PREFIX = "~/.npm-global";
    };
    packages = with pkgs; [
      ripgrep
      fd
      curl
      less
      neovim
      gh
      yt-dlp
      bun
      git
      ffmpeg
      htop
      jq
      nodejs_22
      (pkgs.elixir_1_16.override {erlang = pkgs.erlang_26;})
      speedtest-cli
      python3
      ollama
      wifi-password
      mas
      imagemagick
      alejandra
      neofetch
      nil
      cowsay
      (nerdfonts.override {
        fonts = [
          "Meslo"
          "IntelOneMono"
          "FiraCode"
          "JetBrainsMono"
        ];
      })
      zsh-powerlevel10k
      corepack_latest
      #     porsmo
      ripgrep
      gitui
      docker_26
      zoxide
      # TODO: how to add global npm packages?
    ];
  };

  programs = {
    eza = {
      enable = true;
      enableZshIntegration = true;
      icons = true;
      git = true;
    };
    bat = {
      enable = true;
    };
    fzf = {
      enable = true;
    };
  };
}
