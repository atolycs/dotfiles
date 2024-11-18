# My dotfiles

WIP...

# How to link?
```powershell
PS > New-Item -Type Junction -File ~/.config -Target ~/dotfiles/.config

```

# vimrc setup
```bash
$ ln -s <DOTFILES>/.config/vim ~/.vim
$ echo "runtime vimrc" >> ~/.vimrc
```
