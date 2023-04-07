{pkgs, ...}: {
  config = {
    programs.ssh = {
      enable = true;
      matchBlocks = {
        all = {
          host = "*";
          extraOptions = {
            "IdentityAgent" = "~/.1password/agent.sock";
          };
        };
      };
    };
  };
}
