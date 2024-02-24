# Dotfiles 2023

Just my dotfiles, taking into consideration win/linux.

## Start

### Essentials (Stow)

```
sudo pacman -S git stow neovim zsh alacritty zellij starship
```

### Terminal

```
sudo pacman -S neofetch vim xsel eza fd bat ncdu btop htop ncspot ripgrep lazygit zoxide ranger fzf zip unzip
```

### Distro (Stow)

```
sudo pacman -S polybar picom nitrogen rofi
```

### Node (Mason needs it)

```
sudo pacman -S nodejs-lts-hydrogen npm
```

## Yay

```
pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si
```

```
yay -S visual-studio-code-bin pnpm
```

## Apps

```
sudo pacman -Spavucontrol obsidian peek simplescreenrecorder flameshot filezilla thunar gvfs thunar-archive-plugin thunar-volman transmission-qt solaar scrcpy lutris chromium
```

### Steam

Uncomment [multilib] and [Include mirror]

```
sudoedit /etc/pacman.conf
sudo pacman -Syu && sudo pacman -S steam
```

## Icons and Settings

```
sudo pacman -S lxappearance qt5ct kvantum
```

## Zsh Plugins

[zsh autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

`git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions`

[zsh syntax highlight](https://github.com/zsh-users/zsh-syntax-highlighting)

`git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting`

### Starship

`curl -sS https://starship.rs/install.sh | sh`

Add this to .zshrc: `eval "$(starship init zsh)"`

### Zoxide

`eval "$(zoxide init zsh)"`

### Rustup

`curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`
