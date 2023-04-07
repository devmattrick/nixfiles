{pkgs, ...}: {
  config = {
    home.packages = with pkgs; [discord];

    # Change desktop entry to enable hardware acceleration
    xdg.desktopEntries.discord = {
      name = "Discord";
      exec = "discord --ignore-gpu-blocklist --disable-features=UseOzonePlatform --enable-features=VaapiVideoDecoder --use-gl=desktop --enable-gpu-rasterization --enable-zero-copy";
      icon = "discord";
      categories = ["Network" "InstantMessaging"];
      genericName = "All-in-one cross-platform voice and text chat for gamers";
      mimeType = ["x-scheme-handler/discord"];
      type = "Application";
    };
  };
}
