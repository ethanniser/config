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

    ignores = ["**/.DS_STORE"];

    extraConfig = {
      github = {
        user = "ethanniser";
      };
      init = {
        defaultBranch = "main";
      };
      pull = {
        rebase = false;
      };
      push = {
        autoSetupRemote = true;
      };
      core = {
        editor = "nvim";
        fileMode = false;
        ignorecase = false;
      };
      rerere.enabled = true;
    };
  };
}
