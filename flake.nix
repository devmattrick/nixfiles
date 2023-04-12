{
  description = "My personal NixOS and Home Manager configurations";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur.url = "github:nix-community/NUR";

    devenv.url = "github:cachix/devenv";
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    nur,
    devenv,
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
          ./nixos/profiles/gaming

          ./nixos/users/matt

          ./nixos/hosts/hydrogen
        ];

        specialArgs = inputs;
      };
    };

    homeConfigurations = {
      "matt@hydrogen" = homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./home/profiles/common
          ./home/profiles/desktop
          ./home/profiles/design
          ./home/profiles/gaming
          ./home/profiles/programming

          ./home/hosts/hydrogen
        ];
      };
    };

    devShell.x86_64-linux = devenv.lib.mkShell {
      inherit inputs pkgs;
      modules = [
        ({pkgs, ...}: {
          packages = with pkgs; [nil alejandra];
        })
      ];
    };
  };
}
