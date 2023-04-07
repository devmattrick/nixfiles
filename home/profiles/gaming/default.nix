{pkgs, ...}: {
  config = {
    home.packages = with pkgs; [
      (lutris.override {
        extraLibraries = pkgs: [
          vulkan-tools
          vulkan-loader
        ];
      })
      prismlauncher
      temurin-jre-bin-17
    ];
  };
}
