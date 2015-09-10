" Note: Skip initialization for vim-tiny or vim-small.  if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.nvim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.nvim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

NeoBundle 'tpope/vim-sensible'
NeoBundle 'easymotion/vim-easymotion'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'haya14busa/incsearch.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'wavded/vim-stylus'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'godlygeek/tabular'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'azumakuniyuki/vim-colorschemes'
NeoBundle 'junegunn/goyo.vim'
NeoBundle 'chikatoike/sourcemap.vim'
NeoBundle 'amix/vim-zenroom2'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'ajh17/VimCompletesMe'
NeoBundle 'junegunn/seoul256.vim'
NeoBundle 'powerline/powerline'
NeoBundle 'jnurmine/Zenburn'
NeoBundle 'jscappini/material.vim'
NeoBundle 'altercation/solarized'


call neobundle#end()
" cosmetics
set background=dark
colorscheme seoul256

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" UI
set relativenumber
set number
filetype off



" colorschemes not recognized by indent guides, so color them manually
" let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=none ctermbg=30
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=none ctermbg=0

" syntax stuff
filetype plugin on 
syntax on
autocmd FileType * setlocal nofoldenable
set nofoldenable

" Bindings
imap <C-s> <Esc>:update<CR>a
map <C-s> :update<CR>

" Uppercase to EOL
nnoremap Y y$
nnoremap C c$
nnoremap D d$

" Defuse unnerving keybindings
nnoremap K k
nnoremap Q q


" Configuration
set clipboard=unnamed
set autochdir
autocmd BufNewFile,BufRead *.coffee set filetype=coffee

" size of a hard tabstop
set tabstop=4
" size of an "indent"
set shiftwidth=4
" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=4
" make "tab" insert indents instead of tabs at the beginning of a line
set smarttab

" always uses spaces instead of tab characters
set expandtab

let g:indent_guides_enable_on_vim_startup = 1
set listchars=precedes:⠐



" backups & swaps
set backupdir=~/.vim/backups//
set directory=~/.vim/swaps//

" Ignore case in searches excepted if an uppercase letter is used
set smartcase
if has('nvim')
    echo 'yay'
else
    echo 'nay'
endif
