{pkgs, ...}: {
  imports = [
    ./micro.nix
    ./git.nix
    ./zsh.nix
  ];

  config = {
    home = {
      stateVersion = "22.11";

      username = "matt";
      homeDirectory = "/home/matt";
    };
  };
}
