augroup project_languages
  autocmd!

  autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
  autocmd FileType go setlocal tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab
  autocmd FileType make setlocal noexpandtab
  autocmd FileType sh,zsh,bash setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
  autocmd FileType lua setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
  autocmd FileType yaml,yml setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
  autocmd FileType json,jsonc setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
  autocmd FileType toml setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
  autocmd FileType markdown,text,gitcommit setlocal spell
  autocmd FileType markdown setlocal wrap linebreak
  autocmd FileType gitcommit setlocal colorcolumn=73

  autocmd BufNewFile,BufRead Dockerfile* setfiletype dockerfile
  autocmd BufNewFile,BufRead *.env setfiletype sh
  autocmd BufNewFile,BufRead *.tf,*.tfvars setfiletype terraform
augroup END

nnoremap <silent> <leader>m :ProjectMake<CR>
nnoremap <silent> <leader>co :copen<CR>
nnoremap <silent> <leader>cc :cclose<CR>
nnoremap <silent> <leader>cn :cnext<CR>
nnoremap <silent> <leader>cp :cprevious<CR>

if executable('rg')
  set grepprg=rg\ --vimgrep\ --smart-case
  set grepformat=%f:%l:%c:%m
endif

set tags=./tags;,tags;
set path+=**
set wildignore+=*/.git/*,*/node_modules/*,*/dist/*,*/build/*

nnoremap <silent> <leader>tb :TagsBuild<CR>
nnoremap <silent> <leader>tt <C-]>
nnoremap <silent> <leader>to <C-t>
nnoremap <silent> <leader>tl :tselect<Space>
nnoremap <silent> <leader>ts :tsplit<CR>

nnoremap <silent> <leader>gg :ProjectGrep<Space>
nnoremap <silent> <leader>gf :ProjectFiles<CR>

function! s:format_buffer() abort
  let l:view = winsaveview()
  let l:original = getline(1, '$')
  let l:failed = 0

  if &filetype ==# 'python' && executable('black')
    silent keepjumps execute '%!black -q -'
  elseif (&filetype ==# 'sh' || &filetype ==# 'bash' || &filetype ==# 'zsh') && executable('shfmt')
    silent keepjumps execute '%!shfmt'
  elseif &filetype ==# 'go' && executable('gofmt')
    silent keepjumps execute '%!gofmt'
  elseif (&filetype ==# 'json' || &filetype ==# 'jsonc') && executable('jq')
    silent keepjumps execute '%!jq .'
  else
    normal! gg=G
  endif

  if v:shell_error != 0
    let l:failed = 1
    call setline(1, l:original)
    if line('$') > len(l:original)
      execute (len(l:original) + 1) . ',$delete _'
    endif
  endif

  call winrestview(l:view)
  if l:failed
    echoerr 'Format failed; buffer restored.'
  endif
endfunction

command! Format call s:format_buffer()
nnoremap <silent> <leader>cf :Format<CR>
