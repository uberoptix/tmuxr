# AGENTS.md

Guidance for coding agents working in this repository.

If any instruction here conflicts with direct user requests or higher-priority runtime instructions, follow the higher-priority instructions.

## Repository Overview

- Project: **TmuxR**
- Primary code: `tmuxr.sh` (single Bash script)
- Docs: `README.md`
- License: `LICENSE`

This repo is intentionally small and script-focused. Most changes should be limited to `tmuxr.sh` and relevant documentation updates.

## Local Setup

From repository root:

```bash
chmod +x tmuxr.sh
./tmuxr.sh
```

Prerequisites:

- `tmux`
- `whiptail`
- Bash (script shebang is `#!/bin/bash`)

## Change Scope and Style

- Keep changes minimal and targeted.
- Preserve Bash compatibility and existing script behavior unless the task asks for behavior changes.
- Prefer clear, portable shell patterns.
- Quote variable expansions unless unquoted behavior is required.
- Avoid introducing dependencies beyond common shell utilities without explicit need.

## Validation Checklist

Run these checks after editing:

```bash
bash -n tmuxr.sh
```

If available, also run:

```bash
shellcheck tmuxr.sh
```

Because the script is interactive (`whiptail` + `tmux`), include manual verification notes in your summary when behavior changes:

- Launch script and confirm menu renders.
- Create a session and verify attach flow.
- Rename a session and verify it appears in the list.
- Kill a session and verify removal.
- Run close-all flow and verify tmux server exits.

## Documentation Expectations

When user-facing behavior changes, update `README.md` to match new usage or features.

## Commit Guidance

- Use concise, descriptive commit messages.
- Keep one logical change per commit.
