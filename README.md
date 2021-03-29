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
| Buffer Bye | [github.com/moll/vim-bbye](https://github.com/moll/vim-bbye) | Allows windows to remain open and in their position after closing an open buffer |

### Custom Mappings
| Keystroke | Action | Mode(s) |
| :---: | :---: | :---: |
| `<,>` | Leader Key | Normal/Visual |
| `<C-z>` | Toggle Nerd-Tree | Normal |
| `<C-f>` | Open Fuzzy-Finder | Normal |
| `C-j` | Move to the next window | Normal/Insert |
| `C-k` | Move to the previous window | Normal/Insert |
| `<leader>q` | Closes the open buffer and keeps Windows in their respective locations | All |
| `<jk>` | Exit insert mode (`Esc`) | Insert |
| `<H>` | Move the cursor to the beginning of the current line | Normal |
| `<L>` | Move the cursor to the end of the current line | Normal |
| `<b>` | Move the cursor to the previous word | Normal |
| `<C-d>`| Delete the current line | Normal |
| `<->` |  Move the current line down a line | Normal |
| `<_>` |  Move the current line up a line | Normal |
| `<=>` |  Create a copy the current line | Normal |
| `cin(`| Delete all text in the next set of `()` on the current line | Normal |
| `cln(`| Delete all text in the last set of `()` on the current line | Normal |
| `cin{`| Delete all text in the next set of `{}` on the current line | Normal |
| `cln{`| Delete all text in the last set of `{}` on the current line | Normal |
| `<leader><space>` | Clear the highlighting of search results | Normal |
| `<space>` | Open/Close a fold | Normal |
| `<cr>` | Add a blank line below the current line | Normal |
| `<leader>;`| Add a semicolon to the end of the current line | Normal |
| `<C-u>`| Capitalize all the characters in the word under the cursor | Insert |
| `<ss>` | Add a space character under the cursor | Normal |
| `<leader>ev` | Open `~/.vimrc` for editing in a horizontal split | Normal |
| `<leader>sv` | Reload `~/.vimrc` in the current Vim session | Normal |

