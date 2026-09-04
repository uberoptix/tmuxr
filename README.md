# tmuxr

![tmuxr](images/tmuxr.png)

Interactive [`whiptail`](https://en.wikipedia.org/wiki/Newt_(programming_library)) menu for managing [`tmux`](https://github.com/tmux/tmux) sessions. List, create, attach, rename, and kill — all without remembering a single tmux command.

## Why

`tmux` is great. Its CLI is not memorable. `tmuxr` wraps the common workflows in a TUI menu so you can manage sessions on a server you SSH into occasionally without re-learning the keys every time.

## Install

`tmuxr` is a single Bash script. Drop it on your `$PATH`:

```sh
git clone https://github.com/uberoptix/tmuxr.git
sudo install -m 0755 tmuxr/tmuxr /usr/local/bin/tmuxr
```

Or just run it from the clone:

```sh
./tmuxr
```

### Dependencies

- `bash` 4+
- `tmux`
- `whiptail` (part of `newt`)

| OS | Install |
|---|---|
| Debian / Ubuntu | `sudo apt-get install tmux whiptail` |
| RHEL / Fedora | `sudo dnf install tmux newt` |
| macOS (Homebrew) | `brew install tmux newt` |
| Synology DSM | install via [Entware](https://github.com/Entware/Entware) (`opkg install tmux`); whiptail typically already present in DSM |

## Usage

```
tmuxr            launch the interactive menu (default)
tmuxr -l|--list  print current session names and exit
tmuxr -h|--help  show help
```

Inside the menu:

- **NEW** — prompt for a session name, create it detached, then auto-attach.
- **\<session>** — submenu: Attach / Kill / Rename.
- **KILL_ALL** — `tmux kill-server` (with confirmation).

Cancel/Esc anywhere returns up one level. From the top menu, Cancel exits.

## Notes

- Session names are validated against tmux's rules (no `:`, no `.`, non-empty).
- Cancel and "submitted empty" are now distinguished — empty Enter is treated as "no name", Cancel returns up the menu.
- `KILL_ALL` confirmation is required.

## History

`main` is the 2026 rewrite and the only maintained version. It is developed on
James's VPS and pushed here. The original 2023 `tmuxr.sh` and its README are kept
on the [`legacy-2023`](https://github.com/uberoptix/tmuxr/tree/legacy-2023) branch
(tag `v2023-legacy`) for reference only.

## License

MIT — see [LICENSE](LICENSE).
