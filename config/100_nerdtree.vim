function! s:lazyload_nerdtree()
  let g:loaded_netrw       = 1
  let g:loaded_netrwPlugin = 1

  let g:webdevisons_enable_nerdtree = 1
  let g:webdevisons_cenceal_nerdtree_brackets = 1
 
  packadd devicons
  packadd nerdtree 
  packadd nerdtree-syntax 

  execute 'NERDTree'
endfunction

command NERDTree call s:lazyload_nerdtree()

function! s:autoload_nerdtree()
  if argc() == 1 && isdirectory(argv()[0]) && !exists('s:is_stdin')
    call s:lazyload_nerdtree()
    execute 'NERDTree' argv()[0]
  endif
endfunction

augroup autoload-nerdtree
  autocmd!
  autocmd StdinReadPre * let s:is_stdin = 1
  autocmd VimEnter * call s:autoload_nerdtree()
augroup END
