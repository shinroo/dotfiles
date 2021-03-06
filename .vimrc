""""""""""""""""""""""""""""""""""""""""""""""
"
" ##     ## #### ##     ## ########   ######
" ##     ##  ##  ###   ### ##     ## ##    ##
" ##     ##  ##  #### #### ##     ## ##
" ##     ##  ##  ## ### ## ########  ##
"  ##   ##   ##  ##     ## ##   ##   ##
"   ## ##    ##  ##     ## ##    ##  ##    ##
"    ###    #### ##     ## ##     ##  ######
"
""""""""""""""""""""""""""""""""""""""""""""""
"
" vim configuration file
"
" Version: 1.0 - 2018/11/04 12:11:56
" Author: Brainfuck
"
" https://github.com/brainfucksec/dotfiles
"
""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""

" Don't try to be vi compatible
set nocompatible

" Enable filetype detection
filetype on

" Enable filetype-specific plugins then indent
filetype plugin indent on

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before plugin manager starts loading all
" the plugins.
let mapleader = ","


""""""""""""""""""""""""""""""""""""""""""""""
" => VIM UI
""""""""""""""""""""""""""""""""""""""""""""""

" Turn on syntax highlighting
syntax on

" Set ctermbg to none
highlight NonText ctermbg=none

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" No flashing or beeping at all
set noerrorbells
set visualbell
set t_vb=

" Add a bit extra margin to the left
"set foldcolumn=1

" Show line number
set number

" Highlight current line
"set cursorline

" Highlight matching parenthesis
set showmatch

" Show command in bottom bar
set showcmd

" Remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Line lenght marker at 80 columns
set colorcolumn=80

" Remove line lenght marker for selected filetypes
autocmd FileType xml,html,xhtml,javascript setlocal colorcolumn=0
autocmd BufRead,BufNew *.txt setlocal colorcolumn=0


""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and fonts
""""""""""""""""""""""""""""""""""""""""""""""

" Terminal options
set t_Co=256
"set termguicolors

" Colorscheme
"let ayucolor="dark"
colorscheme wal

" Set utf8 as standard encoding
set encoding=utf8


""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups
""""""""""""""""""""""""""""""""""""""""""""""

" Use Unix for new files and autodetect the rest
set ffs=unix,dos,mac

" Force Markdown syntax
autocmd BufRead,BufNew *.md set filetype=markdown

" Turn backup off, swap file off
set nobackup
set noswapfile


""""""""""""""""""""""""""""""""""""""""""""""
" => Memory, CPU
""""""""""""""""""""""""""""""""""""""""""""""

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Sets how many lines of history VIM has to remember
set history=100


""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tabs, indent
""""""""""""""""""""""""""""""""""""""""""""""

" Use spaces instead of tabs
set expandtab

" Insert spaces for tabs according to shiftwidth
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" 1 tab == 2 spaces for selected filetypes
autocmd FileType xml,html,xhtml setlocal shiftwidth=2 tabstop=2
autocmd BufRead,BufNew *.css setlocal shiftwidth=2 tabstop=2

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" indentLine: indent lines style
let g:indentLine_char = '│'
"let g:indentLine_setColors = 0


""""""""""""""""""""""""""""""""""""""""""""""
" => Autocompletion, linting
""""""""""""""""""""""""""""""""""""""""""""""

" Completion popup settings (:help 'completeopt')
set completeopt+=menuone,noselect,noinsert

" Shut off completion messages
set shortmess+=c


" MUcomplete
let g:mucomplete#enable_auto_at_startup = 1

" endwise compatibility
imap <Plug>MyCR <Plug>(MUcompleteCR)


" ALE (Linter)
let g:ale_enabled = 1

" Run linter only after save the file
let g:ale_lint_on_text_changed = 'never'

" Don't run linter after open a file
let g:ale_lint_on_enter = 0

" Navigate between errors
nmap <silent> <C-k> <Plug>
nmap <silent> <C-j> <Plug>


" Omnicompletion languages plugins:
" Python
" - jedi-vim
let g:jedi#show_call_signatures = "0"

" C/C++
" - clang-complete
" path of clang library file
let g:clang_library_path = '/usr/lib/libclang.so.7'
let g:clang_complete_auto = 1
" workaround for auto-pairs issue with clang_complete
let g:AutoPairsMapCR = 0
imap <silent><CR> <CR><Plug>AutoPairsReturn

" JavaScript
" - vim-javascript
let g:javascript_plugin_flow = 1

" HTML/CSS
" - vim-closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'


""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""""""""""""""""""

" Always show the status line
set laststatus=2

" lightline
" Disable mode information under status line
set noshowmode

" Set colorscheme
let g:lightline = {
      \ 'colorscheme': '16color',
      \ }


""""""""""""""""""""""""""""""""""""""""""""""
" => Keymapping
""""""""""""""""""""""""""""""""""""""""""""""

" Reload vim config with Ctrl+r without restart
map \r :source ~/.vimrc<CR>

" Cancel a search with Ctrl+l
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Make kk do esc
inoremap kk <Esc>

" Don't use arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Fast saving
nnoremap <leader>s :w<cr>
inoremap <leader>s <C-c>:w<cr>

" NerdTree
" Open NerdTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>
