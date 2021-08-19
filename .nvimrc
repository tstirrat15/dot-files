" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
filetype off                  " required

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Tell ALE to chill and let coc do its thing
let g:ale_disable_lsp = 1

" set the runtime path to include Vundle and initialize
call plug#begin(stdpath('data') . '/plugged') " alternatively, pass a path where Vundle should install plugins

" My plugins!
Plug 'Shougo/vimproc'
Plug 'tomasr/molokai'
Plug 'Raimondi/delimitMate'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdcommenter'
Plug 'mattn/emmet-vim'
Plug 'Chiel92/vim-autoformat'
Plug 'chriskempson/base16-vim' " For pretty colors
Plug 'godlygeek/tabular'
Plug 'editorconfig/editorconfig-vim' " Makes vim respect .editorconfig files
Plug 'vim-scripts/splitjoin.vim' "Moves between single and multiline code quickly
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} "Highlighting and whatnot provided by treesitter

" Provides extra file commands
Plug 'tpope/vim-eunuch'

" coc and friends
Plug 'neoclide/coc.nvim', {'branch': 'release'} "IDE-ish autocomplete

" Provides the bit at the bottom
Plug 'vim-airline/vim-airline'

" Python plugins
Plug 'psf/black', { 'branch': 'stable', 'for': 'python' } " Add black as a plugin so that we can run on save

" Syntax checking
Plug 'dense-analysis/ale'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" PHP plugins
Plug 'nrocco/vim-phplint', { 'for': 'php' }

"JS Plugins
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascriptreact'] }
Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript', 'javascriptreact'] }

" TS Plugins
Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'typescriptreact', 'typescriptcommon'] }
Plug 'peitalin/vim-jsx-typescript', { 'for': ['typescript', 'typescriptreact', 'typescriptcommon'] }
Plug 'Quramy/tsuquyomi', { 'for': ['typescript', 'typescriptreact', 'typescriptcommon'] }

" pegjs
Plug 'alunny/pegjs-vim'

" Haskell plugins
" Plug 'eagletmt/ghcmod-vim'
" Plug 'eagletmt/neco-ghc'

" All of your Plugins must be added before the following line
call plug#end()            " required
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

" Set javascript folding and make its indentation less sucky
autocmd FileType javascript setlocal foldmethod=syntax shiftwidth=2

" Set json folding as well
autocmd FileType json setlocal foldmethod=syntax

" Set JSX highlighting to be used in js files
let g:jsx_ext_required = 0

" Set up airline to talk to ale
let g:airline#extensions#ale#enabled = 1

""" ALE settings
" This group of settings makes it look/behave like Syntastic did
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1

" Allow for jumping between ALE errors quickly
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" cd macro - makes it easier to nav.
nnoremap ,cd :lcd %:p:h

" Make diffs go vertical
:set diffopt+=vertical

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Set up netrw to suck less
" Found this here: https://shapeshed.com/vim-netrw/
let g:netrw_liststyle = 3 " go to tree mode first
let g:netrw_banner = 0 " banners are stupid
let g:netrw_browse_split = 3 " default to opening in new tab rather than same window

" Disable 'safe write' - makes things like Webpack HMR work
set backupcopy=yes

" coc-related settings
nmap <silent> gd <Plug>(coc-definition)

" Per default, netrw leaves unmodified buffers open. This autocommand
" deletes netrw's buffer once it's hidden (using ':q', for example)
" This fixes the annoying error where you can't :qa out of a bunch of open
" files because it keeps throwing "netrwsomething modified errors
autocmd FileType netrw setl bufhidden=delete

" Makes tab work for Coc autocompletion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Treesitter configuration
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = { enable = true },
}
EOF

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

let g:coc_snippet_next = '<tab>'
