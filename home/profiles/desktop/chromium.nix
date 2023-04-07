{pkgs, ...}: {
  config = {
    programs.chromium = {
      enable = true;
      extensions = [
        # uBlock Origin
        {
          id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";
        }
        # 1Password
        {
          id = "aeblfdkhhhdcdjpifhhbdiojplfjncoa";
        }
        # SponsorBlock
        {
          id = "mnjggcdmjocbbbhaepdhchncahnbgone";
        }
      ];
    };
  };
}
