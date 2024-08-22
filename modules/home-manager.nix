{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./git.nix
    ./zsh
    ./tmux.nix
    ./kitty.nix
    ./karabiner
    ./ghostty.nix
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

      # fenix
      (fenix.complete.withComponents [
        "cargo"
        "clippy"
        "rust-src"
        "rustc"
        "rustfmt"
      ])

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
      htop
      jq
      nodejs_22
      (pkgs.elixir_1_16.override {erlang = pkgs.erlang_26;})
      speedtest-cli
      (python312.withPackages
        (python-pkgs: with python-pkgs; [pip ipykernel]))
      ollama
      wifi-password
      mas
      imagemagick
      alejandra
      fastfetch
      cowsay
      zsh-powerlevel10k
      corepack_latest
      ripgrep
      gitui
      docker_26
      zoxide
      btop
      tig
      lazygit
      zig
      bacon
      stylua
      prettierd
      nodePackages.prettier
      wget
      just
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
