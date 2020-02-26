function! s:autoload_typescript()
  let g:typescript_indent_disable = 1

  packadd typescript 
endfunction

augroup autoload-typescript
  autocmd!
  autocmd FileType typescript call s:autoload_typescript()
augroup END
