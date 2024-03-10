# Dotfiles 2023

Just my dotfiles, taking into consideration win/linux.

## Start

### Essentials (Stow)

```shell
sudo pacman -S git stow neovim zsh alacritty zellij starship
```

### Terminal

```shell
sudo pacman -S neofetch vim eza fd bat ncdu btop htop ncspot ripgrep lazygit zoxide lf fzf zip unzip
```

### Wayland

```shell
sudo pacman -S wl-clipboard grim swappy slurp wf-recorder waybar hyprpaper mako swayidle
```

### Node (Mason needs it)

```shell
sudo pacman -S nodejs-lts-hydrogen npm
```

## Paru

```shell
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

## Apps

```shell
sudo pacman -S pavucontrol peek scrcpy chromium
```

## Fonts

```shell
sudo pacman -S ttf-firacode-nerd ttf-hack-nerd ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-common ttf-nerd-fonts-symbols-mono ttf-noto-nerd ttf-font-awesome
```

## Thunar

```shell
sudo pacman -S thunar gvfs thunar-archive-plugin thunar-volman
```

## Zsh Plugins

[zsh autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

`git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions`

[zsh syntax highlight](https://github.com/zsh-users/zsh-syntax-highlighting)

`git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting`

### Rustup

`curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`
