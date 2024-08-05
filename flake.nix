{
  description = "my minimal flake";
  inputs = {
    # Where we get most of our software. Giant mono repo with recipes
    # called derivations that say how to build software.
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable"; # nixos-22.11

    # Manages configs links things into your home directory
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Controls system level software and settings including fonts
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    fenix.url = "github:nix-community/fenix";
    fenix.inputs.nixpkgs.follows = "nixpkgs";

    # Local neovim flake
    nvim.url = "path:./nvim";
  };

  outputs = {
    self,
    darwin,
    nixpkgs,
    home-manager,
    fenix,
    nvim,
    ...
  }: {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Ethans-MacBook-Pro
    darwinConfigurations."Ethans-MacBook-Pro" = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      pkgs = import nixpkgs {
        system = "aarch64-darwin";
        overlays = [nvim.overlays.default];
      };
      modules = [
        ./modules/darwin
        ./modules/homebrew.nix
        home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.ethan.imports = [./modules/home-manager];
            extraSpecialArgs = {
              inherit fenix;
            };
          };

          system.configurationRevision = self.rev or self.dirtyRev or null;
        }
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."Ethans-MacBook-Pro".pkgs;
  };
}
