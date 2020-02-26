function! s:autoload_lsp()
  let g:asyncomplete_auto_popup = 0
  
  let g:lsp_signs_enabled = 1
  let g:lsp_diagnostics_echo_cursor = 1
  let g:lsp_signs_error = {'text': "\uF421"}
  let g:lsp_signs_warnings = {'text': "\uF41B"}
  let g:lsp_signs_hint = {'text': "\uF449"}

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
