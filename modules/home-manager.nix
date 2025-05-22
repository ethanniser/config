{pkgs, ...}: {
  imports = [
    ./git.nix
    ./zsh
    ./tmux.nix
    ./karabiner
    ./ghostty.nix
    ./mpv
  ];

  home = {
    stateVersion = "22.11";
    sessionVariables = {
      PAGER = "less";
      CLICOLOR = 1;
      EDITOR = "nvim";
      VISUAL = "nvim";
      ENV = "/Users/ethan/.config/zsh/.zshrc";
      NPM_CONFIG_PREFIX = "~/.npm-global";
    };

    packages = with pkgs; [
      # FROM OVERLAYS

      # nvim
      configured-nvim
      configured-nvim-deps

      # FROM NIXPKGS
      ripgrep
      fd
      curl
      less
      gh
      yt-dlp
      bun
      git
      ffmpeg
      jq
      nodejs_22
      ollama
      mas
      fastfetch
      cowsay
      zsh-powerlevel10k
      corepack_latest
      zoxide
      btop
      lazygit
      stylua
      prettierd
      nodePackages.prettier
      wget
      just
      uv
      lldb
      graphite-cli
      ast-grep

      # a bit of fun :)
      cmatrix
      cowsay
      lolcat
      cbonsai
      deno
      redis
      radare2
      direnv
      # for bun temp
      cmake
      zig
      zls
    ];
  };

  programs = {
    eza = {
      enable = true;
      enableZshIntegration = true;
      icons = "auto";
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
