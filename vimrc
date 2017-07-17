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
