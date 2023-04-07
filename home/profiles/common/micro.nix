{...}: {
  config = {
    programs.micro = {
      enable = true;
      settings = {
        autosu = true;
        mkparents = true;
      };
    };

    # Hide Micro from launcher
    xdg.desktopEntries.micro = {
      name = "Micro";
      # exec is required, but we're hiding it anyway so it's okay
      exec = "";
      noDisplay = true;
    };
  };
}
