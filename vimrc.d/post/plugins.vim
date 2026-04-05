augroup project_plugin_ui
  autocmd!
  autocmd VimEnter * if argc() == 0 && exists(':Startify') == 2 | Startify | endif
augroup END

if exists(':LightlineEnable') == 2
  set noshowmode
endif

nnoremap <silent> ]h <Plug>(GitGutterNextHunk)
nnoremap <silent> [h <Plug>(GitGutterPrevHunk)
nnoremap <silent> <leader>hs <Plug>(GitGutterStageHunk)
nnoremap <silent> <leader>hu <Plug>(GitGutterUndoHunk)
nnoremap <silent> <leader>hp <Plug>(GitGutterPreviewHunk)
