function! s:autoload_css3()
  packadd css3
endfunction

augroup autoload-typescript
  autocmd!
  autocmd FileType css,scss call s:autoload_css3()
  autocmd FileType css,scss setlocal iskeyword+=-
augroup END
