{pkgs, ...}: let
  createShellScript = scriptName:
    pkgs.writeScriptBin scriptName (builtins.readFile ./src/${scriptName});

  scriptNames = [
    "nixswitch"
    "nixup"
    "mas-to-nix"
  ];

  shellScripts = map createShellScript scriptNames;
in {
  environment.systemPackages = shellScripts;
}
