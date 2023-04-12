{pkgs, ...}: {
  config = {
    programs.vscode.enable = true;

    programs.direnv.enable = true;
    programs.direnv.nix-direnv.enable = true;

    home.packages = with pkgs; [
      kubectl
      k9s
      # This shouldn't necessarily be installed globally but I can't get it to work with VSCode unless I do
      nil
    ];
  };
}
