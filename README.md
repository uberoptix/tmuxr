# TmuxR - a Tmux session management tool

![GitHub Logo](https://github.com/uberoptix/tmuxr/blob/main/images/tmuxr.png)

## Overview

**TmuxR** is a simple Bash script designed to simplify your Tmux session management experience using a Whiptail UI. With Tmuxr, you can effortlessly create, manage, and navigate between Tmux sessions with intuitive text-based menus.

## Why Tmuxr?

Terminal multiplexers like Tmux can be immensely useful in managing multiple sessions and processes within a single terminal window. They provide a flexible and efficient way to organize your workflow. However, one common challenge users face with terminal multiplexers is the need to memorize various commands and options to create, manage, and navigate between sessions. This is where Tmuxr comes into play. Tmuxr simplifies the entire process by providing an intuitive, text-based menu interface. Whether you're a seasoned Tmux user or just getting started, Tmuxr makes it easy to manage your Tmux sessions.

![GitHub Logo](https://github.com/uberoptix/tmuxr/blob/main/images/screenshot001.png)

## Features

- **Create Sessions:** Easily create new Tmux sessions on the fly with custom names.
- **Manage Existing Sessions:** List and manage existing Tmux sessions, including attaching, renaming, and killing sessions.
- **Exit All Sessions:** Safely exit all Tmux sessions in one go, ensuring a clean exit.
- **Interactive User Interface:** Utilizes the Whiptail utility for an interactive and user-friendly text-based menu.
- **Robust Error Handling:** Provides clear error messages and guidance for common issues.

## How to Use

Tmuxr is designed to simplify the management of your Tmux sessions, making it ideal for both beginners and experienced users. Here's how you can get started:

1. Clone or download the Tmuxr script to your local machine.

2. Make the script executable: `chmod +x tmuxr.sh`

3. Run the script: `./tmuxr.sh`

4. Follow the on-screen menu to create, manage, or exit Tmux sessions.

## Global Use (Optional)

To make Tmuxr globally accessible from any directory, create a symbolic link (symlink) within your system's PATH (e.g., '/usr/local/bin').

1. Create a symlink; replace /path/to/tmuxr.sh with the actual path to your "tmuxr.sh" script):

   ```bash
      sudo ln -s /path/to/tmuxr.sh /usr/local/bin/tmuxr

Now you can use the **tmuxr** command from any directory to run the script.

## Prerequisites

- [Tmux](https://github.com/tmux/tmux): Ensure that you have Tmux installed on your system.

## Contributions

Contributions to Tmuxr are welcome! If you encounter any issues, have feature requests, or want to contribute to the project, please [submit an issue](https://github.com/uberoptix/tmuxr/issues) or create a pull request.

## License

This project is licensed under the [MIT License](LICENSE). Feel free to use, modify, and distribute it as per the terms of the license.
