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

  # Configure the nixpkgs instance that nix-darwin will build.
  # This is where overlays and nixpkgs configurations go.
  nixpkgs = {
    overlays = [
      inputs.nvim.overlays.default
      # You can add other overlays here if needed for this host
    ];
    # Example: If you need to allow unfree packages for this host:
    # config = {
    #   allowUnfree = true;
    # };
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.ethan.imports = [../../modules/home-manager.nix];
    extraSpecialArgs = {
      inherit inputs self;
    };
  };

  # TODO: Move other system-specific settings here from your original flake.nix
  # For example, if you have specific system.stateVersion for this machine
  system.stateVersion = 4; # Example, adjust as needed

  # Expose the package set, including overlays, for convenience.
  # This might be better handled at the top level flake if it's truly global
  # or if each host might have different overlay needs.
  # For now, keeping it similar to your original structure.
  # nixpkgs = import inputs.nixpkgs {
  #   system = "aarch64-darwin";
  #   overlays = [
  #     inputs.nvim.overlays.default # Ensure nvim is available in inputs if you use this
  #   ];
  # };

  system.configurationRevision = self.rev or self.dirtyRev or null;
}
