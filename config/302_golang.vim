function! s:autoload_golang()
  packadd golang
endfunction

augroup autoload-golang
  autocmd!
  autocmd FileType go call s:autoload_golang()
augroup END
