" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
filetype off                  " required

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" My plugins!
Plugin 'leafgarland/typescript-vim'
Plugin 'Valloric/YouCompleteMe' "IDE-ish autocomplete
Plugin 'Shougo/vimproc'
Plugin 'Quramy/tsuquyomi'
Plugin 'tomasr/molokai'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-fugitive'
Plugin 'tmhedberg/matchit'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mattn/emmet-vim'
Plugin 'avakhov/vim-yaml' 
Plugin 'davidhalter/jedi-vim'
Plugin 'klen/python-mode'
Plugin 'tpope/vim-fireplace'
Plugin 'Chiel92/vim-autoformat'
Plugin 'altercation/vim-colors-solarized'

" Clojure Plugins
Plugin 'Paredit.vim'
Plugin 'guns/vim-clojure-static'

" PHP plugins
Plugin 'StanAngeloff/php.vim'
Plugin 'rayburgemeestre/phpfolding.vim'
Plugin 'nrocco/vim-phplint'

"JS Plugins
Plugin 'pangloss/vim-javascript'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Better highlighting. schweet.
:set background=dark
colorscheme solarized

" for delimitMate
let delimitMate_expand_cr = 1

" set line numbers
:set number

" Set non-sucky indent settings
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
"
" Set php-specific tabbing
autocmd FileType php setlocal shiftwidth=4 tabstop=4 noexpandtab

" cd macro - makes it easier to nav.
nnoremap ,cd :lcd %:p:h

" Make diffs go vertical
:set diffopt+=vertical
