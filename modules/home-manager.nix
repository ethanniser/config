{
  pkgs,
  config,
  lib,
  ...
}: {
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
      COREPACK_ENABLE_STRICT = "0";
    };
    sessionPath = [
      "\${HOME}/.luarocks/bin"
      "\${HOME}/.npm-global/bin"
    ];

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
      rustup
      jujutsu

      # EDGE NETWORK DEPENDENCIES
      # Docker & K8s tools
      docker-compose
      kubectl

      # Media processing
      imagemagick

      # Git tools
      git-lfs

      # AWS tools
      awscli2
      aws-iam-authenticator

      # Lua development
      lua5_4
      lua54Packages.luarocks

      # HTTP tools
      httpstat
      ngrok

      # a bit of fun :)
      cmatrix
      cowsay
      lolcat
      cbonsai
      deno
      redis
      radare2
      direnv
      mergiraf
      go
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

  # Enable corepack globally to avoid permission issues in git hooks
  home.activation.enableCorepack = lib.hm.dag.entryAfter ["writeBoundary"] ''
    export PATH="${pkgs.corepack_latest}/bin:$PATH"
    ${pkgs.corepack_latest}/bin/corepack enable --install-directory=$HOME/.npm-global/bin 2>/dev/null || true
  '';
}
