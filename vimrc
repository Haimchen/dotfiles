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

" open Nerdtree file browser Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" for Airline
set laststatus=2
let g:airline_theme='powerlineish'
let g:airline#extensions#tabline#enabled=1
let g:airline_left_sep=' ›'  " Slightly fancier than '>'
let g:airline_right_sep='‹ ' " Slightly fancier than '<'

