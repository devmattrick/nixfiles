# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/530f0df3-4730-4af8-a164-0afb0dfe8bab";
      fsType = "btrfs";
      options = [ "subvol=@root" "compress=zstd" ];
    };

  boot.initrd.luks.devices."root".device = "/dev/disk/by-uuid/ac0ce3cf-36d2-48eb-9cc5-0c90b8c4e103";

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/530f0df3-4730-4af8-a164-0afb0dfe8bab";
      fsType = "btrfs";
      options = [ "subvol=@home" "compress=zstd" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/530f0df3-4730-4af8-a164-0afb0dfe8bab";
      fsType = "btrfs";
      options = [ "subvol=@nix" "compress=zstd" "noatime" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/2FA3-CF85";
      fsType = "vfat";
    };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.eno1.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
