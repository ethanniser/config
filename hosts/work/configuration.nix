{
  inputs,
  self,
  ...
}: {
  imports = [
    ../../modules/darwin.nix
    ./homebrew.nix
    ./dock.nix
    inputs.home-manager.darwinModules.home-manager
  ];

  nixpkgs = {
    overlays = [
      inputs.nvim.overlays.default
    ];
    # config = {
    #    allowUnfree = true; # Uncomment if this host needs unfree packages
    #  };
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.ethan.imports = [../../modules/home-manager.nix]; # This brings in your shared HM config
    extraSpecialArgs = {
      inherit inputs self;
    };
  };
  # idk what this does
  ids.gids.nixbld = 350;

  # TODO: Customize hostname and other work-laptop specific settings
  networking.hostName = "work";

  system.configurationRevision = self.rev or self.dirtyRev or null;
  system.stateVersion = 4; # Or match your other machine's stateVersion
}
