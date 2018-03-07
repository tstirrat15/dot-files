" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
filetype off                  " required

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle') " alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" My plugins!
Plugin 'Valloric/YouCompleteMe' "IDE-ish autocomplete
Plugin 'Shougo/vimproc'
Plugin 'tomasr/molokai'
Plugin 'Raimondi/delimitMate'
Plugin 'tmhedberg/matchit'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mattn/emmet-vim'
Plugin 'stephpy/vim-yaml' 
Plugin 'tpope/vim-fireplace'
Plugin 'Chiel92/vim-autoformat'
Plugin 'chriskempson/base16-vim'
Plugin 'godlygeek/tabular'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'splitjoin.vim' "Moves between single and multiline code quickly

" Python plugins
Plugin 'davidhalter/jedi-vim'
Plugin 'klen/python-mode'

" Syntax checking
Plugin 'vim-syntastic/syntastic'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'

" Clojure Plugins
Plugin 'Paredit.vim'
Plugin 'guns/vim-clojure-static'

" PHP plugins
Plugin 'StanAngeloff/php.vim'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'rayburgemeestre/phpfolding.vim'
Plugin 'nrocco/vim-phplint'

"JS Plugins
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" Haskell plugins
Plugin 'eagletmt/ghcmod-vim'
Plugin 'eagletmt/neco-ghc'

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
set background=dark
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" for delimitMate
let delimitMate_expand_cr = 1

" set line numbers
:set number

" Set non-sucky indent settings
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" Set javascript folding
autocmd FileType javascript setlocal foldmethod=syntax

" Set JSX highlighting to be used in js files
let g:jsx_ext_required = 0

" cd macro - makes it easier to nav.
nnoremap ,cd :lcd %:p:h

" Make diffs go vertical
:set diffopt+=vertical

" Set python-mode python version
let g:pymode_python = 'python3'
let g:python3_host_prog = '/usr/bin/python3'

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

"Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Get yavascript linting working
let g:syntastic_javascript_checkers = ['eslint']

" Disable 'safe write' - makes things like Webpack HMR work
set backupcopy=yes
