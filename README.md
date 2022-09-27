# dotfiles

## Setup

### Clone .dotviles

```bash
git clone git@github.com:marcosvieirajr/dotfiles.git ~/.dotfiles
```

### Oh My ZSH

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
rm -rf ~/.zshrc

brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
```

### Simbolik links

```bash
git clone git@github.com:marcosvieirajr/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.p10k.zsh ~/.p10k.zsh
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.ideavimrc ~/.ideavimrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
```

### Home Brew

```bash
# install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# then pass in the Brewfile location
brew bundle --file ~/.dotfiles/Brewfile
```

### Post install

```bash
# TODO
```

### Extract current brew instelled files

```bash
cd ~/.dotfiles && brew bundle dump --force
```
