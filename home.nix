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
                name = "Claude";
                url = "https://claude.ai";
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

  # Scripts
  programs.bash = {
    enable = true;

    shellAliases = {
      rebuild = "cd /home/kaia/nix && sudo nix flake update && nix flake check && sudo nixos-rebuild switch --flake .";
      edit = "code /home/kaia/nix && exit";
    };
  };


}
