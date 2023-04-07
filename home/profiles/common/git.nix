{...}: {
  config = {
    programs.git = {
      enable = true;
      userName = "Matthew McCune";
      userEmail = "matt@mattrick.org";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };
}
