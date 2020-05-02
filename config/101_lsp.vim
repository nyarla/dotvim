function! s:autoload_lsp()
  let g:asyncomplete_auto_popup = 0
 
  let g:lsp_diagnostics_enabled = 0
  let g:lsp_highlights_enabled = 1
  let g:lsp_textprop_enabled = 1

  packadd VimCompletesMe

  packadd vim-vsnip-integ
  packadd vim-vsnip
  packadd vim-lsp-settings
  packadd vim-lsp
  packadd asyncomplete-lsp
  packadd asyncomplete
  packadd asyncomplete-file

  set omnifunc=lsp#complete

  let g:ale_completion_enabled = 0
  let g:ale_disable_lsp = 1
  let g:ale_fix_on_save = 1

  let g:ale_fixers = {
    \ 'javascript' : ['prettier'],
    \ 'json' : ['prettier'],
    \ 'typescript' : ['prettier']
  \ }

  packadd ale
endfunction

augroup autoload-lsp
  autocmd!
  autocmd VimEnter * call s:autoload_lsp()
  autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
      \ 'name': 'file',
      \ 'whitelist': ['*'],
      \ 'priority': 10,
      \ 'completor': function('asyncomplete#sources#file#completor')
      \ }))
augroup END
