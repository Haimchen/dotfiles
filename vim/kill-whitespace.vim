" Removes trailing spaces
function! TrimWhiteSpace()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunction

if has("autocmd")
  autocmd FileWritePre    * :call TrimWhiteSpace()
  autocmd FileAppendPre   * :call TrimWhiteSpace()
  autocmd FilterWritePre  * :call TrimWhiteSpace()
  autocmd BufWritePre     * :call TrimWhiteSpace()
endif

