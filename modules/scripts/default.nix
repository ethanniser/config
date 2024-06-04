{pkgs, ...}: let
  createShellScript = scriptName:
    pkgs.writeShellScriptBin scriptName (builtins.readFile ./src/${scriptName});

  scriptNames = [
    "foo"
  ];

  shellScripts = map createShellScript scriptNames;
in {
  environment.systemPackages = shellScripts;
}
