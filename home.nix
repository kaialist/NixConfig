{ pkgs, inputs, ... }:
{
  # Enable
  programs.home-manager.enable = true;

  # State Version - dont change unless it maches configuration.nix
  home.stateVersion = "24.05";

  # Packages in Home
  home.packages = with pkgs; [
    fastfetch
    discord
    btop
    qbittorrent
    heroic
    protontricks
  ];

  # Firefox
  programs.firefox = {
    enable = true;
    policies = {
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      SearchSuggestEnabled = false;
      OfferToSaveLogins = false;
      OverrideFirstRunPage = "";
    };
    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;
        

        bookmarks = [
          {
            name = "Nix sites";
            toolbar = true;
            bookmarks = [
              {
                name = "YouTube";
                url = "https://www.youtube.com";
              }
              {
                name = "Music";
                url = "https://music.youtube.com";
              }
              {
                name = "Outlook";
                url = "https://outlook.live.com/mail";
              }
              {
                name = "Gmail";
                url = "https://mail.google.com/mail/";
              }
              {
                name = "Photopea";
                url = "https://www.photopea.com/";
              }
              {
                name = "GitHub";
                url = "https://github.com/";
              }
              {
                name = "ChatGPT";
                url = "https://chatgpt.com/";
              }
              {
                name = "character.ai";
                url = "https://character.ai/";
              }
              {
                name = "Packages";
                url = "https://search.nixos.org/packages";
              }
              {
                name = "MyNixOS";
                url = "https://mynixos.com/";
              }
              {
                name = "Reddit";
                url = "https://www.reddit.com/";
              }
            ];
          }
        ];

        extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
            ublock-origin
            refined-github
            violentmonkey
            privacy-badger
            return-youtube-dislikes

        ];

        settings = {

            # Dark mode
            "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
            # Mozilla telemetry
            "toolkit.telemetry.enabled" = true;
            # Homepage settings
            # 0 = blank, 1 = home, 2 = last visited page, 3 = resume previous session
            "browser.startup.page" = 3;
            "browser.startup.homepage" = "about:home";
            "browser.newtabpage.enabled" = false;
            
            # Activity Stream
            "browser.newtab.preload" = false;

            # Addon recomendations
            "browser.discovery.enabled" = false;
            "extensions.getAddons.showPane" = false;
            "extensions.htmlaboutaddons.recommendations.enabled" = false;

            # Auto-decline cookies
            "cookiebanners.service.mode" = 2;
            "cookiebanners.service.mode.privateBrowsing" = 2;

            # Disable autoplay
            "media.autoplay.default" = 5;

            # Prefer dark theme
            "layout.css.prefers-color-scheme.content-override" = 0; # 0: Dark, 1: Light, 2: Auto

            # Trusted DNS (TRR)
            "network.trr.mode" = 2;
            "network.trr.uri" = "https://mozilla.cloudflare-dns.com/dns-query";

            # ECH - prevent TLS connections leaking request hostname
            "network.dns.echconfig.enabled" = true;
            "network.dns.http3_echconfig.enabled" = true;

            # Tracking
            "browser.contentblocking.category" = "strict";
            "privacy.trackingprotection.enabled" = true;
            "privacy.trackingprotection.pbmode.enabled" = true;
            "privacy.trackingprotection.emailtracking.enabled" = true;
            "privacy.trackingprotection.socialtracking.enabled" = true;
            "privacy.trackingprotection.cryptomining.enabled" = true;
            "privacy.trackingprotection.fingerprinting.enabled" = true;

            # Fingerprinting
            "privacy.fingerprintingProtection" = true;
            "privacy.firstparty.isolate" = true;

            # URL query tracking
            "privacy.query_stripping.enabled" = true;
            "privacy.query_stripping.enabled.pbmode" = true;

            # Prevent WebRTC leaking IP address
            "media.peerconnection.ice.default_address_only" = true;

            # Disable password manager   TODO Transition to 1password
            # "signon.rememberSignons" = false;
            # "signon.autofillForms" = false;
            # "signon.formlessCapture.enabled" = false;

            # Hardens against potential credentials phishing:
            # 0 = don’t allow sub-resources to open HTTP authentication credentials dialogs
            # 1 = don’t allow cross-origin sub-resources to open HTTP authentication credentials dialogs
            # 2 = allow sub-resources to open HTTP authentication credentials dialogs (default)
            "network.auth.subresource-http-auth-allow" = 1;
        };
      };
    };
  };

  # Git
  programs.git = {
    enable = true;
    userEmail = "kaia.gonza@outlook.com";
    userName = "kaialist";
  };


  # Plasma
  programs.plasma = {
    enable = true;
    overrideConfig = true;
    kwin.effects.shakeCursor.enable = false;
    input.mice = [
      {
        accelerationProfile = "none";
        enable = true;
        name = "Compx VXE NordicMouse 1K Dongle";
        productId = "f58a";
        vendorId = "3554";
      }
    ];

    workspace = {
      # clickItemTo = "open";If you liked the click-to-open default from plasma 5
      lookAndFeel = "org.kde.breezedark.desktop";
      theme = "We10XOS-dark";
      cursor.theme = "We10XOS-cursors";
      wallpaper = "/home/kaia/Documents/Wallpapers/wallpaper.jpg";
    };

    hotkeys.commands."launch-konsole" = {
      name = "Launch Konsole";
      key = "Meta+Return";
      command = "konsole";
    };

    panels = [
      # Windows-like panel at the bottom
      {
        location = "bottom";
        height = 36;
        floating = false;
        screen = "all";
        widgets = [
          # We can configure the widgets by adding the name and config
          # attributes. For example to add the the kickoff widget and set the
          # icon to "nix-snowflake-white" use the below configuration. This will
          # add the "icon" key to the "General" group for the widget in
          # ~/.config/plasma-org.kde.plasma.desktop-appletsrc.
          {
            name = "org.kde.plasma.kickoff";
            config = {
              General = {
                icon = "nix-snowflake-white";
                alphaSort = true;
                favorites = [

                ];
              };
            };
          }
          # Adding configuration to the widgets can also for example be used to
          # pin apps to the task-manager, which this example illustrates by
          # pinning dolphin and konsole to the task-manager by default with widget-specific options.
          {
            iconTasks = {
              launchers = [
                "applications:firefox.desktop"
                "applications:systemsettings.desktop"
                "applications:org.kde.dolphin.desktop"
                "applications:org.kde.konsole.desktop"
                "applications:code.desktop"
                "applications:discord.desktop"
                "applications:steam.desktop"
                "applications:com.heroicgameslauncher.hgl.desktop"
                "applications:org.qbittorrent.qBittorrent.desktop"

              ];
            };
          }
          # Or you can do it manually, for example:
          # If no configuration is needed, specifying only the name of the
          # widget will add them with the default configuration.
          "org.kde.plasma.marginsseparator"
          # If you need configuration for your widget, instead of specifying the
          # the keys and values directly using the config attribute as shown
          # above, plasma-manager also provides some higher-level interfaces for
          # configuring the widgets. See modules/widgets for supported widgets
          # and options for these widgets. The widgets below shows two examples
          # of usage, one where we add a digital clock, setting 12h time and
          # first day of the week to Sunday and another adding a systray with
          # some modifications in which entries to show.

          {
            systemTray.items = {
              # We explicitly show bluetooth and battery
              shown = [
                "org.kde.plasma.volume"
                "org.kde.plasma.notifications"
                "org.kde.plasma.networkmanagement"

              ];
              # And explicitly hide networkmanagement and volume
              hidden = [
                "org.kde.plasma.battery"
                "org.kde.plasma.bluetooth"
                "org.kde.plasma.clipboard"
                "org.kde.plasma.mediacontroller"
                "org.kde.plasma.brightness"

              ];
            };
          }
          {
            digitalClock = {
              calendar.firstDayOfWeek = "monday";
              time.format = "24h";
            };
          }
          "org.kde.plasma.showdesktop"
        ];
      }
      ];

      powerdevil = {
        AC = {
          powerButtonAction = "shutDown";
          autoSuspend = {
            action = "nothing";
            idleTimeout = null;
          };
          turnOffDisplay = {
            idleTimeout = "never";
          };
        };
      };

  };


  # Scripts
  programs.bash = {
    enable = true;

    shellAliases = {
      rebuild = "cd /home/kaia/nix && sudo nix flake update && nix flake check && sudo nixos-rebuild switch --flake .";
      edit = "code /home/kaia/nix && exit";
    };
  };


}
