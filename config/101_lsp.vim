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
    \ 'css' : ['prettier'],
    \ 'javascript' : ['prettier'],
    \ 'json' : ['prettier'],
    \ 'nix' : ['nixpkgs-fmt'],
    \ 'scss' : ['prettier'],
    \ 'typescript' : ['prettier'],
    \ 'yaml' : ['prettier'],
  \ }

  packadd ale

  autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
      \ 'name': 'file',
      \ 'whitelist': ['*'],
      \ 'priority': 10,
      \ 'completor': function('asyncomplete#sources#file#completor')
      \ }))
  autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'rnix-lsp',
      \ 'cmd': {server_info->[&shell, &shellcmdflag, 'rnix-lsp']},
      \ 'whitelist': ['nix'],
      \ })
endfunction

augroup autoload-lsp
  autocmd!
  autocmd VimEnter * call s:autoload_lsp()
augroup END
