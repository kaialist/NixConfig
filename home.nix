{ pkgs, ... }:
{
  programs.home-manager.enable = true;

  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    fastfetch
    discord
    btop
    qbittorrent
    heroic
  ];

  programs.plasma = {
    enable = true;

    workspace = {
      # clickItemTo = "open";If you liked the click-to-open default from plasma 5
      lookAndFeel = "org.kde.breezedark.desktop";
      theme = "We10XOS-dark";
      cursor.theme = "We10XOS-cursors";
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
                "applications:org.kde.kate.desktop"
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
}
