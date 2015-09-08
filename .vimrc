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

NeoBundle 'easymotion/vim-easymotion'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'haya14busa/incsearch.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'shougo/neocomplete.vim'
NeoBundle 'wavded/vim-stylus'
NeoBundle 'tpope/vim-sensible'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'godlygeek/tabular'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'nathanaelkane/vim-indent-guides'

" Prose
NeoBundleLazy 'tpope/vim-commentary', {'filetypes': 'tex'}
NeoBundleLazy 'reedes/vim-wordy', {'filetypes': 'tex'}
NeoBundleLazy 'junegunn/goyo.vim', {'filetypes': 'tex'}

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" UI
set relativenumber
set number
filetype off

filetype plugin on 
syntax on
autocmd FileType * setlocal nofoldenable
set nofoldenable

" Bindings
imap <C-s> <Esc>:update<CR>a
map <C-s> :update<CR>

nnoremap Y y$
nnoremap C c$
nnoremap D d$


" Configuration
set clipboard=unnamed
set autochdir
autocmd BufNewFile,BufRead *.coffee set filetype=coffee
set list

" size of a hard tabstop
set tabstop=4
"
" size of an "indent"
set shiftwidth=4
"
" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=4
" make "tab" insert indents instead of tabs at the beginning of a line
set smarttab

" always uses spaces instead of tab characters
set expandtab

colorscheme elflord
let g:indent_guides_enable_on_vim_startup = 1
set listchars=precedes:⠐
