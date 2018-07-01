# Linux dotfiles

### Setup
- **OS**: Manjaro
- **DE**: KDE
- **WM**: i3-gaps

### Disabling the Plasma Desktop and the Plasma Wallpaper
The Plasma wallpaper is rendered at the top, hiding everything. Disable the autostart of `ksplashqml`:

```
sudo mv /usr/bin/ksplashqml /usr/bin/ksplashqml.old
```

Finally, in the i3 configuration we use `wmctrl` to kill the Plasma desktop view:
 
```
exec --no-startup-id wmctrl -c Plasma
for_window [title="Desktop — Plasma"] kill; floating enable; border none
```

### Wallpaper
The wallpaper is set with `feh` (delay this if you still notice problems) in `.config/i3/config`.

### Launcher
Rofi (themed in `.Xresources`), started in i3 with `$mod+d` for menu or `$mod+r` for run command.

#### _Credits to [avivace](https://github.com/avivace/dotfiles)_
