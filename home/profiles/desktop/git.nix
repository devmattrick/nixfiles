{pkgs, ...}: {
  config = {
    programs.git.extraConfig = {
      # Sign commits using SSH Key in 1Password
      user.signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBJ7plqu/62IIaNdHf4QWn8zFM5sJAP0peftiheVOhI5";
      gpg.format = "ssh";
      "gpg \"ssh\"".program = "${pkgs._1password-gui}/share/1password/op-ssh-sign";
      commit.gpgsign = true;
    };
  };
}
