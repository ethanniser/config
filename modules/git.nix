_: {
  programs.git = {
    enable = true;
    userName = "Ethan Niser";
    userEmail = "ethan@niser.com";

    delta = {
      enable = true;
      options = {
        syntax-theme = "TwoDark";
        side-by-side = true;
      };
    };

    lfs.enable = true;

    ignores = ["**/.DS_STORE"];

    extraConfig = {
      user = {
        signingkey = "AE29E3B18C7136AC";
      };
      column = {
        ui = "auto";
      };
      github = {
        user = "ethanniser";
      };
      init = {
        defaultBranch = "main";
      };
      pull = {
        rebase = true;
      };
      push = {
        autoSetupRemote = true;
        default = "simple";
      };
      branch = {
        sort = "-committerdate";
      };
      tag = {
        sort = "version:refname";
      };
      diff = {
        algorithm = "histogram";
        colorMoved = "plain";
        mnemonicPrefix = true;
        renames = true;
      };
      help = {
        autocorrect = "prompt";
      };
      commit = {
        verbose = true;
      };
      rerere = {
        enabled = true;
        autoupdate = true;
      };
      core = {
        editor = "nvim";
        fileMode = false;
        ignorecase = false;
        attributesfile = "~/.gitattributes";
      };
      rebase = {
        autoSquash = true;
        autoStash = true;
        updateRefs = true;
      };
      merge = {
        conflictstyle = "zdiff3";
      };
      "merge \"mergiraf\"" = {
        name = "mergiraf";
        driver = "mergiraf merge --git %O %A %B -s %S -x %X -y %Y -p %P -l %L";
      };
    };
  };
}
