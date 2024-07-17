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
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
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

" General lua things
Plug 'nvim-lua/plenary.nvim'
Plug 'neovim/nvim-lspconfig'

" Provides extra file commands
Plug 'tpope/vim-eunuch'

" coc and friends
Plug 'neoclide/coc.nvim', {'branch': 'release'} "IDE-ish autocomplete

" Provides the bit at the bottom
Plug 'vim-airline/vim-airline'

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

" Don't fsck with the mouse
set mouse=

" Per default, netrw leaves unmodified buffers open. This autocommand
" deletes netrw's buffer once it's hidden (using ':q', for example)
" This fixes the annoying error where you can't :qa out of a bunch of open
" files because it keeps throwing "netrwsomething modified errors
autocmd FileType netrw setl bufhidden=delete

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
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

-- hack to get authzed working until it's packaged
local parser_config = require'nvim-treesitter.parsers'.get_parser_configs()

parser_config.authzed = {
        install_info = {
                url = "https://github.com/mleonidas/tree-sitter-authzed", -- local path or git repo
                files = { "src/parser.c" },
                generate_requires_npm = false,
                requires_generate_from_grammar = false,
                -- optional entries:
                branch = "main", -- default branch in case of git repo if different from master
        },
        filetype = "zed", -- if filetype does not match the parser name
}
EOF

" Get zed highlighting working by default
augroup Authzed
  au!
  autocmd BufNewFile,BufRead *.authzed set ft=zed
  autocmd BufNewFile,BufRead *.zed set ft=zed
  autocmd BufNewFile,BufRead *.azd set ft=zed
augroup END

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

let g:coc_snippet_next = '<tab>'
