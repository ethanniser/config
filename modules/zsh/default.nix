{...}: {
  home.file.".config/starship.toml".text = builtins.readFile ./starship.toml;
  # prompt is basically the shell...
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.zsh = {
    enable = true;

    dotDir = ".config/zsh"; # Already prepends $HOME

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "direnv"
        "eza"
        "fzf"
        "gh"
        "zoxide"
        "alias-finder"
        "aliases"
        "bun"
        "docker"
        "docker-compose"
        "extract"
        "git-auto-fetch"
        "macos"
        "ssh"
        "sudo"
        "tmux"
      ];
      theme = "robbyrussell";
    };

    enableCompletion = true;
    autosuggestion = {
      enable = true;
    };
    syntaxHighlighting = {
      enable = true;
    };
    shellAliases = {
      ls = "eza --oneline";
      lsa = "eza --all --oneline";
      lsl = "eza --long --header --total-size --time-style=long-iso";
      lsal = "eza --all --long --header --total-size --time-style=long-iso";
      lss = "eza --long --sort=size";
      lsd = "eza --only-dirs --oneline";
      lsf = "eza --only-files --oneline";
      lsab = "eza --absolute=on --oneline";
      gdmb = "git branch --merged | grep -Ev '(^\\*|main)' | xargs git branch -d";
      gbsc = "git branch --sort=-committerdate";
      reload = "source ~/.config/zsh/.zshrc";
      ghostty = "/Applications/Ghostty.app/Contents/MacOS/ghostty";
      lg = "lazygit";
      b = "bun run";
      serve = "python3 -m http.server";
      gssu = "gt s -su";
      gmas = "gt m -a && gt s";
      gts = "gt sync --no-restack";
      yt-mp3 = "yt-dlp -x --audio-format mp3";
      p = "pnpm";
      oc = "opencode";
      hades = "~/.hades/bin/hades";
    };

    initContent = ''

      lst() {
        if [[ -n $1 ]]; then
          eza -R --level="$1" --tree
        else
          eza -R --tree
        fi
      }

      case ":$PATH:" in
          *:"$HOME/.cabal/bin":*)
              ;;
          *)
              export PATH="$PATH:$HOME/.cabal/bin"
              ;;
      esac
      case ":$PATH:" in
          *:"/Users/ethan/.ghcup/bin":*)
              ;;
          *)
              export PATH="$PATH:/Users/ethan/.ghcup/bin"
              ;;
      esac

      if command -v wt >/dev/null 2>&1; then eval "$(command wt config shell init zsh)"; fi

    '';

    history = {
      # Expire duplicates first
      expireDuplicatesFirst = false;
      # Save timestamp into the history file
      extended = true;
      # If a new command line being added to the history list duplicates an older one, the older command is removed from the list (even if it is not the previous event)
      ignoreAllDups = false;
      # Do not enter command lines into the history list if they are duplicates of the previous event
      ignoreDups = false;
      # Do not enter command lines into the history list if they match any one of the given shell patterns
      ignorePatterns = [];
      # Do not enter command lines into the history list if the first character is a space
      ignoreSpace = false;
      # History file location	string
      path = "/Users/ethan/.zsh_history";
      # Number of history lines to save
      save = 50000;
      # Number of history lines to keep
      size = 10000;
      # Share command history between zsh sessions
      share = true;
    };
  };
}
