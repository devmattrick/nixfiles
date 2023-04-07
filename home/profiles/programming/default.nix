{pkgs, ...}: {
  config = {
    programs.vscode.enable = true;

    home.packages = with pkgs; [
      kubectl
      k9s
    ];
  };
}
