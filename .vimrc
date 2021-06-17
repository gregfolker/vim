" File Info {{{
"  File:     ~/.vimrc
"  Author:   Greg Folker
" }}}
" Install vim-plug (if required) {{{
if empty(glob('~/.vim/autoload/plug.vim'))
   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" }}}
" Plugins {{{
call plug#begin('$HOME/.vim/plugged')
   " Fuzzy Finder {{{
   Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
   Plug 'junegunn/fzf.vim'
   " }}}
   " Nerd Tree {{{
   Plug 'preservim/nerdtree'
   " }}}
   " Fugitive {{{
   Plug 'tpope/vim-fugitive'
   " }}}
   " {{{ vim-tmux-navigator
   Plug 'christoomey/vim-tmux-navigator'
   " }}}
   " Buffer Bye {{{
   Plug 'moll/vim-bbye'
   " }}}
   " Winresizer {{{
   Plug 'simeji/winresizer'
   " }}}
call plug#end()
" }}}
" Global Settings {{{
   " Tabs and Spaces {{{
   set autoindent
   set expandtab
   set ts=3 sw=3 sts=3
   " }}}
   " Window Management {{{
   "
   " Vim Definitions
   "     Buffer - An open file in memory. Can be active, hidden, or inactive
   "     Window - A space in which you can view the contents of a buffer
   "     Tab - A container for a bunch of windows
   "
   set splitbelow    " New windows opened horizontally will appear below the current window
   set splitright    " New windows opened vertically will appear to the right of the current window
   " }}}
   " Generic Options {{{
   " {{{ Status Bar
   set statusline=%f    " Path to the open file
   set statusline+=%=   " Move to the right side of the bar
   set statusline+=%l   " Show the current line of the cursor
   set statusline+=/    " Separator
   set statusline+=%L   " Show the total number of lines in the file
   set showmode         " Shows the current mode in the status bar
   " }}}
   set foldenable
   set noswapfile
   set number
   set showcmd       " Shows the last command run
   set showmatch     " Highlight matching brackets/braces
   set nowrap
   set wildmenu      " Auto-complete menu for commands (Cycle options with <tab>)
   set incsearch     " Start searching as soon as a character is typed
   set hlsearch      " Highlights search results
   set ignorecase    " Searches are not case sensitive
   set autowrite     " Autowrite the buffer when changes have been made to it
   set background=dark
   " }}}
" }}}
" Filetype Settings {{{
" Go {{{
   " Syntax Highlighting {{{
   let g:go_highlight_fields = 1
   let g:go_highlight_functions = 1
   let g:go_highlight_function_calls = 1
   let g:go_highlight_extra_types = 1
   let g:go_highlight_operators = 1
   " }}}
   " Autoformatting and Importing {{{
   let g:go_fmt_autosave = 1
   let g:go_fmt_command = "go imports"
   " }}}
   " Status Line {{{
   let g:go_auto_type_info = 1
   " }}}
" }}}
" }}}
" Key Remaps {{{
   " Non-Modal {{{
   " Leader Key {{{
   let mapleader=","
   " }}}
   " fzf {{{
   noremap <C-f> :Files<CR>
   " }}}
   " Nerd Tree {{{
   noremap <C-z> :NERDTreeToggle<CR>
   " }}}
   " Basic Movement {{{
   noremap H ^
   noremap b B
   noremap L $
   " }}}
   " Line Manipulation {{{
   noremap <C-d> dd
   noremap - ddp
   noremap _ ddkP
   noremap = yyp
   noremap + yykp
   " }}}
   " Searching {{{
   noremap <silent> <leader><space> :nohlsearch<CR>
   " }}}
   " Unmaps {{{
   noremap ^ <nop>
   noremap $ <nop>
   noremap 0 <nop>
   noremap <Up> <nop>
   noremap <Down> <nop>
   noremap <Left> <nop>
   noremap <Right> <nop>
   " }}}
   " }}}
   " Normal Mode {{{
   " Folding {{{
   nnoremap <space> za
   nnoremap <Return> o<esc>
   " }}}
   " Edit/Re-Load ~/.vimrc {{{
   nnoremap <leader>ev :split $MYVIMRC<CR>
   nnoremap <leader>sv :source $MYVIMRC<CR>
   " }}}
   " Line Manipulation {{{
   nnoremap <leader>; ]pA;<esc>
   " }}}
   " Text Manipulation {{{
   nnoremap <C-u> viwU
   nnoremap ss i<space><esc>
   " }}}
   " Window Manipulation {{{
   nnoremap <Leader>q :Bdelete<cr>
   let g:winresizer_start_key = "<leader>w"
   " }}}
   " {{{ Operator-Pending Mappings
   onoremap in( :<c-u>normal! f(vi(<cr>
   onoremap il( :<c-u>normal! F)vi(<cr>
   onoremap in{ :<c-u>normal! f{vi{<cr>
   onoremap il{ :<c-u>normal! F}vi{<cr>
   onoremap il" :<c-u>normal! F"vi"<cr>
   onoremap il' :<c-u>normal! F'vi'<cr>
   " }}}
   " }}}
   " Insert Mode {{{
   " <Esc> Key {{{
   inoremap jk <Esc>
   inoremap <Esc> <nop>
   " }}}
   " Text Manipulation {{{
   inoremap <C-u> <esc>viwU
   " }}}
   " }}}
" }}}
" Autocommands {{{
  " {{{ Set Custom Filetypes
  augroup filetype_set
     autocmd!
     autocmd BufNewFile,BufRead *.log set filetype=log
     autocmd BufNewFile,BufRead *.bin set filetype=bin
  augroup END
  " }}}
  " Global {{{
  augroup filetype_all
     autocmd!
     " Always delete trailing white space when writing to a file
     autocmd BufWritePre * :%s/\s\+$//e
     " Exit Vim if NERDTree is the only Window left open
     autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
         \ quit | endif
  augroup END
  " }}}
  " Vim {{{
  augroup filetype_vim
     autocmd!
     autocmd FileType vim setlocal foldlevel=0
     autocmd FileType vim setlocal foldmethod=marker
  augroup END
  " }}}
  " Binary {{{
  augroup filetype_bin
     autocmd!
     autocmd FileType bin setlocal binary
     autocmd FileType bin %!xxd
  augroup END
  " }}}
  " C {{{
  augroup filetype_c
     autocmd!
     autocmd FileType c,cpp ia <buffer> cb /*<CR><CR>/<Up><Up>
     autocmd FileType c,cpp ia <buffer> #i #include
     autocmd FileType c,cpp ia <buffer> #d #define
     autocmd FileType c,cpp nnoremap <buffer> <leader>c I/*<space><esc>A<space>*/<esc>
     autocmd FileType c setlocal foldmethod=syntax
     autocmd FileType c setlocal foldlevel=99
  augroup END
  " }}}
  " Shell {{{
  augroup filetype_sh
     autocmd!
     autocmd FileType sh nnoremap <buffer> <leader>c I#<esc>
  augroup END
  " }}}
  " Go {{{
  augroup filetype_go
     autocmd!
     autocmd FileType go nnoremap <buffer> <leader>c I//<esc>
  augroup END
  " }}}
  " Logs {{{
  augroup filetype_log
     autocmd!
     autocmd FileType log,txt setlocal foldmethod=marker
  augroup END
  " }}}
  " Markdown {{{
  augroup filetype_md
     " Make markdown files compatible with latex equation syntax
     " https://stackoverflow.com/questions/32865744/vim-syntax-and-latex-math-inside-markdown
     syn region match start=/\\$\\$/ end=/\\$\\$/
     syn match math '\\$[^$].\{-}\$'
  augroup END
   " }}}
" }}}
" Custom Commands {{{
  " {{{ :Rg
  " rip-grep for an expression inside the current buffer
  " syntax: :Rg [expression]
  command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
  " }}}
  " {{{ :Find
  " rip-grep for the word under the cursor inside the current buffer
  " syntax: :Find
  command! -bang -nargs=* Find
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(expand('<cword>')), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
  " }}}
  " {{{ :Files
  " Core utility of fzf-vim - Opens a list of files present in the ${PWD} and subdirectories of the buffer
  " :Files is mapped to <C-f> in the Mappings section above
  " syntax: :Files
  command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
  " }}}
" }}}
" Vim Functions {{{
   " Utility {{{
   " Abbreviations in Vim are expanded after <space> is pressed
   " This means the <space> character is put into the input queue and
   " VIM sees it as the next character input for the line after
   " the abbreviation has been completely expanded
   "
   " So, even with moving the relative position of the cursor
   " to where you want to input text, you will end up with an extra
   " space before your cursor as a result of the abbreviation expansion
   "
   " e.g. 'ia if if ()<Left>' would expand into 'if ( )<cursor>'
   "
   " This function removes the specified character under the cursor after
   " the expansion is complete
   "
   " Example usage:
   "
   " ia <buffer> if if ()<Left><C-R>=Eatchar('\s')<CR>
   "
   " The 'extra' <space> will be deleted and when the expansion is complete the
   " <space> present in the input queue will be inserted, replacing the first
   " space that was deleted
   "
   " https://stackoverflow.com/questions/3320182/cursor-position-in-vim-abbreviation
   silent function! Eatchar(pat)
      let c = nr2char(getchar(0))
      return (c =~ a:pat) ? '' : c
   endfunc
   " }}}
" }}}
