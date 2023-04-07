{
  description = "My personal NixOS and Home Manager configurations";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur.url = "github:nix-community/NUR";
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    nur,
    ...
  }: let
    system = "x86_64-linux";

    nixosSystem = nixpkgs.lib.nixosSystem;
    homeManagerConfiguration = home-manager.lib.homeManagerConfiguration;

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
      overlays = [
        nur.overlay
      ];
    };
  in {
    nixosConfigurations = {
      hydrogen = nixosSystem {
        inherit pkgs system;

        modules = [
          ./nixos/profiles/common
          ./nixos/profiles/desktop

          ./nixos/users/matt

          ./nixos/hosts/hydrogen
        ];

        specialArgs = inputs;
      };
    };

    homeConfigurations = {
      "matt@hydrogen" = homeManagerConfiguration {
        "matt@hydrogen" = {
          inherit pkgs;

          modules = [
            ./home/profiles/common
            ./home/profiles/desktop

            ./home/hosts/hydrogen
          ];
        };
      };
    };
  };
}
