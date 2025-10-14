## Overview

This repo stores my portable configuration ("dotfiles")

## Installation

1. Clone the repository:

```bash
git clone https://github.com/def1de/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

2. Symlink using `stow`

```
cd ~/dotfiles
stow --target="$HOME/.config" .config
stow --target="$HOME/wallpaper" wallpaper
```

## Safety

Never commit secrets or machine-specific tokens. Use separate, ignored files for credentials.

## License

Personal configuration. Reuse freely at your own risk.
