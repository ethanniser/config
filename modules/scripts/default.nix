{pkgs, ...}: let
  srcDir = ./src;
  scriptNames = builtins.attrNames (builtins.readDir srcDir);

  createShellScript = scriptName:
    pkgs.writeScriptBin scriptName (builtins.readFile "${srcDir}/${scriptName}");

  shellScripts = map createShellScript scriptNames;
in {
  environment.systemPackages = shellScripts;
}
