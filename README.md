# Now Clocking

*Made with :heart: by [@gamehelp16](https://github.com/gamehelp16),
[@Rayzr522](https://github.com/Rayzr522) and [@pierrot-lc](https://github.com/pierrot-lc).*

**Now Clocking** is a Conky widget which shows a Monstercat style
Now Playing when music is played or a clock when no music is playing.

<div align="center" style="display:inline">
<img alt="Screenshot of clock" src="res/now-clocking-clock.jpg" width="416px" />
<img alt="Screenshot of spotify" src="res/now-clocking-spotify.jpg" width="416px" />
</div>

This fork comes with the following modifications from the original repo:

- Only relies on `playerctl` to find information about the currently played song.
- Text is specified in relative size instead of absolute pixel size
(adapt to screen resolution).
- The conky configuration is easy to modify for your own needs.

## Table of contents

- [Requirements](#requirements)
  - [Packages](#packages)
  - [Fonts](#fonts)
  - [Supported Players](#supported-players)
- [Installation](#installation)
- [Credits](#credits)

## Requirements

### Packages

- [conky](https://github.com/brndnmtthws/conky/)
- [playerctl](https://github.com/altdesktop/playerctl)

### Fonts

- [Montserrat Light](https://fonts.google.com/specimen/Montserrat?selection.family=Montserrat:300)
- [Gotham Bold](https://www.fontmirror.com/gotham-bold)
- [Gotham Book](https://www.fontmirror.com/gotham-book)

## Supported Players

This fork actually support all players that talk to `playerctl`.
This has some downsides, as for example it will detect when
a standard Youtube video is played, which in this case would
be better if it was not detected.

## Installation

1. Install all required [packages](#packages):

```bash
# Ubuntu/Debian based
$ sudo apt install conky playerctl
```

2. Clone the repo:

```bash
git clone git@github.com:pierrot-lc/now-clocking.git
```

3. Ensure that all required [fonts](#fonts) are installed:

```bash
./scripts/download-fonts.sh
```

4. Run the `start.sh` script to start the widget (forks to background):

```bash
./now-clocking.sh
```

5. (Optional) Run the `autostart.sh` script to make it automatically run on startup:

```bash
./autostart.sh
```

## Credits

Huge props to the original creator, [@gamehelp16](https://github.com/gamehelp16).

Same huge props to the second fork [@Rayzr522](https://github.com/Rayzr522),
which is the implementation I used originally.

Finally, huge props to Hoefler & Frere-Jones for the wonderful Gotham fonts,
and Julieta Ulanovsky (and crew) for the slick Montserrat font.
