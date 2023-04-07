{pkgs, ...}: {
  config = {
    services.xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };

    services.dbus.enable = true;
    programs.dconf.enable = true;

    xdg.portal.enable = true;

    # Remove some of the GNOME default apps
    environment.gnome.excludePackages = with pkgs.gnome; [
      baobab # disk usage analyzer
      cheese # photo booth
      epiphany # web browser
      gedit # text editor
      simple-scan # document scanner
      totem # video player
      yelp # help viewer
      file-roller # archive manager
      geary # email client
      seahorse # password manager

      # these should be self explanatory
      gnome-calculator
      gnome-calendar
      gnome-clocks
      gnome-contacts
      gnome-font-viewer
      gnome-logs
      gnome-maps
      gnome-music
      gnome-screenshot
      gnome-weather

      # These aren't included under the GNOME packageset for some reason
      pkgs.gnome-photos
      pkgs.gnome-text-editor
      pkgs.gnome-tour
      pkgs.gnome-connections
    ];

    # Install GNOME Tweaks
    environment.systemPackages = with pkgs; [
      gnome.gnome-tweaks
    ];
  };
}
