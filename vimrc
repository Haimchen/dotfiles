set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Shougo/neocomplete'
Plugin 'mileszs/ack.vim'
Plugin 'lilydjwg/colorizer'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'qpkorr/vim-bufkill'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-rails'
Plugin 'fatih/vim-go'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" encoding des terminal
set enc=utf-8
" encoding fuer dateien
set fileencoding=utf-8
scriptencoding=utf-8

" color scheme
colorscheme molokai
" syntax highlighting
syn on
" allows filetype specific indent settings
filetype plugin indent on
" set defaults to 2 spaces, no tabs
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
source ~/.vim/kill-whitespace.vim
source ~/.vim/tmux-integration.vim
source ~/.vim/ctrlp.vim

" remap indenting commands so that visual selection is kept
vnoremap > >gv
vnoremap < <gv
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" in insert mode, <S-Tab> should unindent
inoremap <S-Tab> <C-D>

" in normal mode, too
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_

" map L to search in all files
nnoremap L :Ack!<SPACE>

" map K to search word under cursor in all files
nnoremap K :Ack! "\b<C-R><C-W>\b"<CR>
" search selection in visual mode
vnoremap K "ky :Ack! "\b<C-R>k\b"<CR>

" configure invisibles
set listchars=tab:▸\ ,nbsp:_,trail:·
set list!

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" allows scrolling in iterm (value = modes)
set mouse=nicr

" display line numbers
set number

" allows switching between buffers with unwritten changes
set hidden

" use Pathogen to load plugins
execute pathogen#infect()

" use Shift-w/q to switch buffer
nmap <silent> <S-w> :bn<cr>
nmap <silent> <S-q> :bp<cr>

" set leader to ,
let mapleader = ","

" close all buffers
nmap <leader>Q :1,200bd<CR>
" close current buffer, keeping splits
nnoremap <leader>q :BD<cr>

" copy to clipboard and paste in all modes
noremap <leader>yy "*Y
noremap <leader>y "*y
noremap <leader>p :set paste <CR> :put *<CR> :set nopaste <CR>

" open Nerdtree file browser Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" Syntastic Settings --------------------------------------------
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_javascript_eslint_exec = '/bin/ls'
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'
" let g:syntastic_javascript_eslint_exe='npm run lint --'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_eslint_generic = 1

" NERDcommenter settings ----------------------------------------
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" for Airline
set laststatus=2
let g:airline_theme='powerlineish'
let g:airline#extensions#tabline#enabled=1
let g:airline_left_sep=' ›'  " Slightly fancier than '>'
let g:airline_right_sep='‹ ' " Slightly fancier than '<'

"use ag instead of Ack
let g:ackprg='ag --vimgrep'

"config for neocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 4
"disable annoying message
set shortmess+=c

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" Enable omni completion.
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
" if !exists('g:neocomplete#sources#omni#input_patterns')
"   let g:neocomplete#sources#omni#input_patterns = {}
" endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
" let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif

set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.
