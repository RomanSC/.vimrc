" .vimrc ☠ Roman S. Collins ☠ Tue, Feb 20, 2018 | utf-8

" Vi compatibility
if &compatible | set nocompatible | set filetype=off | endif

" Color scheme
" set background=dark
" colorscheme solarized8_flat

" Not using a colorscheme and setting 256 colors in terminal
" for now

" In case of non-POSIX shell (like fish)
set shell=/bin/sh

" Plugins
call plug#begin('~/.vim/plugged')
    " tpope
    Plug 'tpope/vim-git'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'

    " NerdTree for folder view
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'

    " Favourite color schemes
    " Plug 'altervim-colors-solarized'
    Plug 'lifepillar/vim-solarized8'
    " Plug 'dracula/vim'
    " Plug 'tomasr/molokai'
    " Plug 'nightsense/simplify/simplify'
    
    " No respect for legacy
    Plug 'svermeulen/vim-easyclip' 

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

call plug#end()

" Command for quickly updating with vim-plug
command! PU PlugClean | PlugInstall | PlugUpgrade

" Tweaks

    " Numbered lines
    set number

    " No bell
    set noeb vb t_vb=

    " Automatic formatting
        " 4 tabs not spaces
        set tabstop=4 shiftwidth=4 softtabstop=4 expandtab smarttab
        set textwidth=80
        set fixeol

        " Remove whitespace on :w but only for specific files for safety
        " vim.wikia.com/wiki/Remove_unwanted_spaces
        autocmd FileType c,cpp,java,php,py,rs, autocmd BufWritePre <buffer> %s/\s\+$//e

        " Also set to utf-8
        if &encoding !=? 'utf-8' | let &encoding = 'utf-8' | endif

    " Show tabs and trailing whitespace
    " set list listchars=tab:,trail:

    " Search
    set showmatch
    set hlsearch
    set incsearch
    set ignorecase

    " Clipboard
    set clipboard=unnamed
    set clipboard+=unnamedplus

    " Don't move cursor when exiting insert mode
    inoremap <silent> <Esc> <Esc>`^

    " Leader key
    let mapleader = ","
    let g:mapleader = ","

    " Coherent deleting, i.e. x and dd is not but delete ,x ,d equals cut
    nnoremap x "_x
    nnoremap d "_d
    nnoremap D "_D
    vnoremap d "_d
    xnoremap p pgvy

    nnoremap <leader>d ""d
    nnoremap <leader>D ""D
    vnoremap <leader>d ""d

    " More natural splitting
    set splitbelow
    set splitright
    set diffopt+=vertical

    " \vt to :vsp and :term at once
    nnoremap <leader>vt :vsp<cr>:term $SHELL<cr>

    " \t to :sp and :term at once
    nnoremap <leader>t :sp<cr>:term $SHELL<cr>

    " Alt+hjkl and Alt+arrows window split navigation
    nmap <silent> <A-k> :wincmd k<CR>
    nmap <silent> <A-j> :wincmd j<CR>
    nmap <silent> <A-h> :wincmd h<CR>
    nmap <silent> <A-l> :wincmd l<CR>

    nmap <silent> <A-Up> :wincmd k<CR>
    nmap <silent> <A-Down> :wincmd j<CR>
    nmap <silent> <A-Left> :wincmd h<CR>
    nmap <silent> <A-Right> :wincmd l<CR>

    " Ctrl+hjkl and Ctrl+arrows tab navigation
    map <C-t><k> :tabr<cr>
    map <C-t><j> :tabl<cr>
    map <C-t><h> :tabp<cr>
    map <C-t><l> :tabn<cr>

    map <C-t><up> :tabr<cr>
    map <C-t><down> :tabl<cr>
    map <C-t><left> :tabp<cr>
    map <C-t><right> :tabn<cr>

    " Resizing with the same keybindings
    if bufwinnr(1)
        map <A-K> <C-W>+
        map <A-J> <C-W>-
        map <A-H> <c-w><
        map <A-L> <c-w>>
    endif

    " Treat long lines as new lines for j and k
    map j gj
    map k gk

    " Custom pane/tabs setup

    " Gvim
    if has("gui_running")
        " Remove GUI elements
        set guioptions-=m "remove menu bar
        set guioptions-=T "remove toolbar
        set guioptions-=r "remove right-hand scroll bar
        set guioptions-=L "remove left-hand scrollbar

        set termguicolors
    endif

    " Commands
    " Edit vim rc with :erc
    command! Vrc :e ~/.vimrc
    
    " Functions

        " Edit vim rc with :erc
        " function! erc

    " Required by or for plugins
        " NERDTree autoload on empty file
        autocmd StdinReadPre * let s:std_in=1
        autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

