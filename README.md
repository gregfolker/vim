## Vim
---
### Overview
Personal configuration files for the Vim text-editor

### Plugins
Plugins are installed using `vim-plug` available [here](https://github.com/junegunn/vim-plug)

`vim-plug` should be installed automatically if it is not already from the code at the top of
`.vimrc`

| Plugin | Link | Description |
| :---: | :---: | :---: |
| Nerd Tree | [github.com/preservim/nerdtree](https://github.com/preservim/nerdtree) | File system explorer |
| Fuzzy Finder |  [github.com/junegunn/fzf](https://github.com/junegunn/fzf#as-vim-plugin) | File searcher |
| Fugitive | [github.com/tpope/vim-fugitive](https://github.com/tpope/vim-fugitive) | Wrapper for running Git commands in Vim|
| Vim-tmux Navigator | [github.com/christoomey/vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) | Offers seamless navigation between Vim windows and tmux panes |

### Custom Mappings
| Keystroke | Action |
| :---: | :---: |
| `<Ctrl-z>` | Toggle Nerd-Tree |
| `<Ctrl-f>` | Open Fuzzy-Finder |
| `<jk>` | Exit insert mode (`Esc`) |
