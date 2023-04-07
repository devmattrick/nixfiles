# The common profile configures basic utilities that most hosts will need
{pkgs, ...}: {
  config = {
    nix.settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
    };

    nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };

    # Use zsh as the default user shell
    programs.zsh.enable = true;
    users.defaultUserShell = pkgs.zsh;

    # Enable zsh shell completion for system packages
    environment.pathsToLink = ["/share/zsh"];

    # Enable git
    programs.git.enable = true;

    # Install a handful of useful system utilities
    environment.systemPackages = with pkgs; [
      home-manager
      htop
      ldns
      micro
    ];

    # Enable SSH server
    services.openssh = {
      enable = true;

      settings = {
        PasswordAuthentication = false;
        PermitRootLogin = "no";
        KbdInteractiveAuthentication = false;
      };
    };

    # Enable 1Password CLI
    programs._1password-gui.enable = true;
  };
}
