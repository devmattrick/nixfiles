{pkgs, ...}: {
  config = {
    programs.firefox = {
      enable = true;

      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        fediact
        onepassword-password-manager
        react-devtools
        return-youtube-dislikes
        sponsorblock
        ublock-origin
      ];

      profiles.default = {
        id = 0;

        name = "Default";

        search = {
          force = true;
          default = "Google";

          engines = {
            "Amazon.com".metaData.hidden = true;
            "Bing".metaData.hidden = true;
            "DuckDuckGo".metaData.hidden = true;
            "eBay".metaData.hidden = true;
            "Wikipedia (en)".metaData.hidden = true;
          };
        };

        settings = {
          # Disable "first run" page
          "trailhead.firstrun.didSeeAboutWelcome" = true;

          # Disable Alt key causing toolbar to pop up
          "ui.key.menuAccessKeyFocuses" = false;

          # Disable sponsored stuff
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          "browser.urlbar.suggest.quicksuggest.sponsored" = false;
          "browser.newtabpage.activity-stream.feeds.section.topstories" = false;

          # Disable telemetry stuff
          "app.shield.optoutstudies.enabled" = false;
          "toolkit.telemetry.enabled" = false;
          "toolkit.telemetry.archive.enabled" = false;
          "toolkit.telemetry.bhrPing.enabled" = false;
          "toolkit.telemetry.unified" = false;
          "toolkit.telemetry.pioneer-new-studies-available" = false;
          "toolkit.telemetry.coverage.opt-out" = true;
          "experiments.enabled" = false;
          "network.allow-experiments" = false;

          # UI Customization
          "browser.uiCustomization.state" = ''
            {
              "placements":{
                "widget-overflow-fixed-list":[
                  "sponsorblocker_ajay_app-browser-action"
                ],
                "nav-bar":[
                  "back-button",
                  "forward-button",
                  "stop-reload-button",
                  "urlbar-container",
                  "downloads-button",
                  "ublock0_raymondhill_net-browser-action",
                  "_d634138d-c276-4fc8-924b-40a0ea21d284_-browser-action"
                ],
                "toolbar-menubar":[
                  "menubar-items"
                ],
                "TabsToolbar":[
                  "tabbrowser-tabs",
                  "new-tab-button",
                  "alltabs-button"
                ],
                "PersonalToolbar":[
                  "personal-bookmarks"
                ]
              },
              "seen":[
                "save-to-pocket-button",
                "developer-button",
                "ublock0_raymondhill_net-browser-action",
                "_d634138d-c276-4fc8-924b-40a0ea21d284_-browser-action",
                "sponsorblocker_ajay_app-browser-action"
              ],
              "dirtyAreaCache":[
                "nav-bar",
                "PersonalToolbar",
                "toolbar-menubar",
                "TabsToolbar",
                "widget-overflow-fixed-list"
              ],
              "currentVersion":18,
              "newElementCount":4
            }
          '';
        };
      };
    };
  };
}
