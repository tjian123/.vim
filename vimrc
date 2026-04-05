let g:vim_config_root = fnamemodify(resolve(expand('<sfile>:p')), ':h')

if &compatible
  set nocompatible
endif

for s:file in sort(split(globpath(g:vim_config_root . '/vimrc.d/pre', '*.vim'), "\n"))
  if filereadable(s:file)
    execute 'source' fnameescape(s:file)
  endif
endfor

if has('packages')
  packloadall
endif

for s:file in sort(split(globpath(g:vim_config_root . '/vimrc.d/post', '*.vim'), "\n"))
  if filereadable(s:file)
    execute 'source' fnameescape(s:file)
  endif
endfor
