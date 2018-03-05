" .vimrc ☠ Roman S. Collins ☠ Tue, Feb 20, 2018 | utf-8

" Vi compatibility
if &compatible | set nocompatible | set filetype=off | endif

" TODO:
" Figure out if set filetype=off and set filetype plugin on are compatible
" set filetype plugin on

" TODO:
" Fix using :term &shell
" In case of non-POSIX shell (like fish)
set shell=/usr/bin/bash

" Plugins
call plug#begin('~/.vim/plugged')
    " tpope
    Plug 'tpope/vim-git'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-repeat'
    " Plug 'tpope/vim-surround'

    " NerdTree for folder view
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'

    " Neat, indent guides
    Plug 'nathanaelkane/vim-indent-guides'

    " TODO
    " Lint
    Plug 'w0rp/ale'

    " Autoclose
    Plug 'raimondi/delimitmate'

    " TODO:
    " For some reason escape doesn't return to normal mode
    " Multlple cursors
    Plug 'terryma/vim-multiple-cursors'

    " Backspace/Del/Enter in normal mode to save keystrokes
    Plug 'dahu/insertlessly'

    " Favourite color schemes
    " Plug 'tomasr/molokai'
    Plug 'roosta/srcery'
    " Plug 'nightsense/vimspectr'
    " Plug 'dracula/vim'
    " Plug 'nightsense/simplify/simplify'
    " Plug 'altervim-colors-solarized'
    " Plug 'lifepillar/vim-solarized8'

    " No respect for the buffers
    " Plug 'svermeulen/vim-easyclip'

    " Error checking

    " Code completion
    Plug 'Valloric/YouCompleteMe'

    " Programming Languages

        " C

        " C++

        " Rust

        " Go

        " Python

        " Ruby

        " Bash

    " Markup

    " LaTeX

    " Just so everyone knows I use vim to write school papers


call plug#end()

" Command(s) for quickly updating with vim-plug
command! PC PlugClean
command! PI PlugInstall
command! PU PlugUpgrade
" Just :w | so % | PA
" ???
" profet.
command! PA PlugClean | PlugInstall | PlugUpgrade

" Tweaks

    " Numbered lines
    set number

    " No bell
    set noeb vb t_vb=

    " Automatic formatting
        " 4 tabs not spaces
        set tabstop=4 shiftwidth=4 softtabstop=4 expandtab smarttab
        set textwidth=80
        " set fixeol

        " Remove whitespace on :w but only for specific files for safety
        " vim.wikia.com/wiki/Remove_unwanted_spaces
        autocmd FileType c,cpp,java,php,py,rs, autocmd BufWritePre <buffer> %s/\s\+$//e

        " Also set to utf-8
        if &encoding !=? 'utf-8' | let &encoding = 'utf-8' | endif

    " Static window height and width
    set winminheight=0
    set winwidth=80
    set winminwidth=60

    " Search
    set showmatch
    set hlsearch
    set incsearch
    " Don't need this in vim, use ? and / appropriately
    " set ignorecase

    " Clipboard
    set clipboard+=unnamedplus
    set guioptions+=aA
    vmap "+y :!xclip -f -selection clip-board
    map "+p :r!xclip -o -selection clip-board

    " Don't move cursor when exiting insert mode
    inoremap <silent> <Esc> <Esc>`^

    " Keep column position with cursor movement
    nnoremap j gj
    nnoremap k gk
    vnoremap j gj
    vnoremap k gk
    nnoremap <Down> gj
    nnoremap <Up> gk
    vnoremap <Down> gj
    vnoremap <Up> gk
    inoremap <Down> <C-o>gj
    inoremap <Up> <C-o>gk

    " Custom pane/tabs setup

    " GUI vim
    if has("gui_running")
        " Remove GUI elements
        " echo "TEST"
        set guioptions-=m "remove menu bar
        set guioptions-=T "remove toolbar
        set guioptions-=r "remove right-hand scroll bar
        set guioptions-=L "remove left-hand scrollbar
        set termguicolors

    endif

    " Commands
        " Edit vim rc with :erc
        command! Vrc :e ~/.vimrc
        command! IDE :NERDTree | :sp<CR> | :term bash<CR>

    " Required by or for plugins

        " NERDTree autoload on empty file
        autocmd StdinReadPre * let s:std_in=1
        autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

    "  nmap gm m
    set clipboard+=unnamedplus

    " Leader key
    " let mapleader = ","
    " let g:mapleader = ","

    " Coherent deleting, i.e. x and dd is not but delete ,x ,d equals cut
    " nmap x "_x
    " nmap d "_d
    " nmap D "_D
    " vnoremap d "_d
    " xnoremap p pgvy

    " nmap <leader>d ""d
    " nmap <leader>D ""D
    " vnoremap <leader>d ""d
    " vnoremap <leader>dd ""dd

    " More natural splitting
    set splitbelow
    set splitright

    " Split panes horizontally
    " <leader>vt to :vsp and :term $SHELL at once
    nmap <leader>vt :vsp<CR>:term term zsh<CR>

    " Split panes vertically
    " <leader>t to :sp and :term $SHELL at once
    nmap <leader>t :sp<CR>:term term zsh<CR>

    " Alt + hjkl/ and Shift+Alt+hjkl/arrows pane navigation
    " Also when entering a pane, go the the last
    " cursor location in that pane
    map <silent>  h <C-W>h<C-W>_
    map <silent> j <C-W>j<C-W>_
    map <silent> k <C-W>k<C-W>_
    map <silent> l <C-W>l<C-W>_

    map <silent>  left <C-W>h<C-W>_
    map <silent> down <C-W>j<C-W>_
    map <silent> up <C-W>k<C-W>_
    map <silent> right <C-W>l<C-W>_

    " TODO: BORKED
    " Resize panes
    " map <silent> ^[H <C-W>< :echo "h"
    " map <silent> ^[J <C-W>- :echo "j"
    " map <silent> ^[K <C-W>+ :echo "k"
    " map <silent> ^[L <C-W>> :echo "l"

    " Allow wincmds in insert mode without deleting
    " any characters
    " imap <A-w>

    " keypress timeout
    set timeoutlen=1

" Color scheme
" set background=dark
set termguicolors " Colorscheme last for regex ;)
colorscheme rupza
