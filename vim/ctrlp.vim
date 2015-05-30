" use the silver search to populate file list
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

nnoremap <leader>b :CtrlPBuffer<cr>

" additional root marker: Gemfile.lock
let g:ctrlp_root_markers = ['Gemfile.lock']

" use pymatcher plugin to match/sort files by priority
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

