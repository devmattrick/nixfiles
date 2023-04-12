# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{pkgs, ...}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    ./gdm.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.supportedFilesystems = ["btrfs"];

  time.timeZone = "America/Los_Angeles";

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm = {
    enable = true;
    wayland = true;
  };
  services.xserver.desktopManager.gnome.enable = true;

  # Mesa 23 is required for RDNA3
  # Disabled - this option won't work anymore; Mesa doesn't support swapping versions:
  # https://github.com/NixOS/nixpkgs/issues/223729
  # hardware.opengl.mesaPackage = pkgs.mesa_23;

  # Fix for bug with ASUS Mobo + Intel I225-V rev. 3 Ethernet Controller:
  # https://www.reddit.com/r/buildapc/comments/xypn1m/network_card_intel_ethernet_controller_i225v_igc/
  boot.kernelParams = ["pcie_port_pm=off" "pcie_aspm.policy=performance"];

  # Disable Pipewire suspension
  # https://wiki.archlinux.org/title/PipeWire#Noticeable_audio_delay_or_audible_pop/crack_when_starting_playback
  environment.etc."wireplumber/main.lua.d/51-disable-suspension.lua".text = ''
    table.insert (alsa_monitor.rules, {
      matches = {
        {
          -- Matches all sources.
          { "node.name", "matches", "alsa_input.*" },
        },
        {
          -- Matches all sinks.
          { "node.name", "matches", "alsa_output.*" },
        },
      },
      apply_properties = {
        ["session.suspend-timeout-seconds"] = 0,  -- 0 disables suspend
      },
    })
  '';


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?
}
