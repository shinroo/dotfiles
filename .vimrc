""""""""""""""""""""""""""""""""""""""""""""
"
" .vimrc - vim configuration file
"
" Version: 0.9.2 - mer  6 set 2017, 13.21.31
" Author: Brainfuck
"
""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""
" Load plugins with Pathogen
execute pathogen#infect()

" Enable filetype plugins
filetype on
filetype plugin on
filetype indent on


""""""""""""""""""""""""""""""""""""""""""""
" => VIM UI
""""""""""""""""""""""""""""""""""""""""""""
" Set ctermbg to none
highlight NonText ctermbg=none

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

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


""""""""""""""""""""""""""""""""""""""""""""
" => Colors and fonts
""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Colorscheme
set termguicolors
let ayucolor="dark"
colorscheme ayu

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
	set t_Co=256
    set guitablabel=%M\ %t
endif

" Extend background color to the whole screen (xfce4-terminal fix)
set t_ut=

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Fonts (if not set, use default terminal fonts)
"set gfn=Monospace\ 11

" Use Unix as the standard file type
set ffs=unix,dos,mac


""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups
""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, swap file off
set nobackup
set noswapfile


""""""""""""""""""""""""""""""""""""""""""""
" => Memory, CPU
""""""""""""""""""""""""""""""""""""""""""""
" Keep more info in memory to speed thing up
set hidden
set history=100


""""""""""""""""""""""""""""""""""""""""""""
" => Text, tabs, indent
""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
"set expandtab

" Smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" indentLine plugin: indent lines style
let g:indentLine_char = '|'

" neocomplete plugin settings:
" Enable autostart
let g:neocomplete#enable_at_startup = 1

" Use smartcase.
let g:neocomplete#enable_smart_case = 1

" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'


""""""""""""""""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" lightline plugin settings
set noshowmode

let g:lightline = {
      \ 'colorscheme': 'one',
      \ }


""""""""""""""""""""""""""""""""""""""""""""
" => Keymapping
""""""""""""""""""""""""""""""""""""""""""""
" Reload vim config without restart
map \r :source ~/.vimrc<CR>

" Cancel a search with Ctrl+l
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Don't use arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Fast saving
nnoremap <leader>s :w<cr>
inoremap <leader>s <C-c>:w<cr>

" Open NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>
