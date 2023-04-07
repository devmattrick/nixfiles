{...}: {
  config = {
    xdg.desktopEntries = {
      xterm = {
        name = "XTerm";
        exec = "";
        noDisplay = true;
      };

      htop = {
        name = "htop";
        exec = "";
        noDisplay = true;
      };

      cups = {
        name = "Manage Printing";
        exec = "";
        noDisplay = true;
      };
    };
  };
}
