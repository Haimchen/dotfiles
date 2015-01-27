" encoding des terminal
set enc=utf-8
" encoding fuer dateien
set fileencoding=utf-8
scriptencoding=utf-8

" syntax highlighting
syn on
" allows filetype specific indent settings
filetype plugin indent on

" allows scrolling in iterm (value = modes)
set mouse=nicr

" display line numbers
set number

" allows switching between buffers with unwritten changes
set hidden

" use Pathogen to load plugins
execute pathogen#infect()
