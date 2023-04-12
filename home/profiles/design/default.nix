{pkgs, ...}: {
  config = {
    home.packages = with pkgs; [figma-linux];
  };
}
