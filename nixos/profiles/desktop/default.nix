# The desktop profiles applies to any desktop-y devices that a user will primarily be interacting with through a GUI
{pkgs, ...}: {
  imports = [
    ../common

    ./gnome.nix
  ];

  config = {
    # For desktops, I prefer to use the latest kernel
    boot.kernelPackages = pkgs.linuxPackages_latest;

    boot.supportedFilesystems = ["ntfs"];

    security.rtkit.enable = true;

    networking.networkmanager.enable = true;

    # Use PipeWire for audio
    sound.enable = true;
    hardware.pulseaudio.enable = false;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    hardware.bluetooth.enable = true;

    security.polkit.enable = true;

    services.printing = {
      enable = true;
      webInterface = false;
    };

    hardware.opengl = {
      enable = true;
      driSupport32Bit = true;
    };

    # Enable 1Password GUI
    programs._1password-gui.enable = true;

    # Enable Tailscale
    services.tailscale = {
      enable = true;
      useRoutingFeatures = "client";
    };

    documentation.nixos.enable = false;

    programs.noisetorch.enable = true;
  };
}
