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
