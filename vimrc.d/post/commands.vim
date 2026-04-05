function! s:plugin_names() abort
  let l:dirs = split(globpath(&packpath, 'pack/*/start/*'), "\n")
  return sort(map(filter(l:dirs, 'isdirectory(v:val)'), 'fnamemodify(v:val, ":t")'))
endfunction

function! s:project_root(...) abort
  let l:start = a:0 ? a:1 : expand('%:p:h')
  if empty(l:start)
    let l:start = getcwd()
  endif

  let l:git_dir = finddir('.git', l:start . ';')
  if !empty(l:git_dir)
    return fnamemodify(l:git_dir, ':p:h:h')
  endif

  let l:git_file = findfile('.git', l:start . ';')
  if !empty(l:git_file)
    return fnamemodify(l:git_file, ':p:h')
  endif

  let l:dir_markers = ['.hg', '.svn']
  for l:marker in l:dir_markers
    let l:dir = finddir(l:marker, l:start . ';')
    if !empty(l:dir)
      return fnamemodify(l:dir, ':p:h:h')
    endif
  endfor

  let l:file_markers = ['.root', '.project', 'Makefile', 'package.json', 'pyproject.toml', 'go.mod']
  for l:marker in l:file_markers
    let l:file = findfile(l:marker, l:start . ';')
    if !empty(l:file)
      return fnamemodify(l:file, ':p:h')
    endif
  endfor

  return fnamemodify(l:start, ':p')
endfunction

function! s:show_plugins() abort
  let l:plugins = s:plugin_names()
  if empty(l:plugins)
    echo 'No start plugins found under packpath.'
    return
  endif

  new
  setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted
  setlocal filetype=vim
  call setline(1, ['Loaded start plugins:'] + [''] + l:plugins)
  normal! gg
endfunction

function! s:config_check() abort
  echo 'vim_config_root=' . get(g:, 'vim_config_root', '')
  echo 'project_root=' . s:project_root()
  echo 'packpath=' . &packpath
  echo 'number=' . (&number ? 'on' : 'off') . ' relativenumber=' . (&relativenumber ? 'on' : 'off')
  echo 'colors_name=' . get(g:, 'colors_name', '')
  echo 'startify=' . exists(':Startify') . ' nerdtree=' . exists(':NERDTreeToggle') . ' ctrlp=' . exists(':CtrlP')
endfunction

function! s:config_reload() abort
  execute 'source' fnameescape(g:vim_config_root . '/vimrc')
  doautocmd BufEnter
  echo 'Vim config reloaded.'
endfunction

function! s:build_tags() abort
  let l:root = s:project_root()

  if executable('ctags')
    let l:cmd = 'ctags -R --exclude=.git --exclude=node_modules --exclude=dist --exclude=build -f ' . shellescape(l:root . '/tags') . ' ' . shellescape(l:root)
    execute 'silent !' . l:cmd
    redraw!
    echo 'Tags generated: ' . l:root . '/tags'
  else
    echoerr 'ctags not found in PATH.'
  endif
endfunction

function! s:project_cd() abort
  let l:root = s:project_root()
  execute 'lcd' fnameescape(l:root)
  echo 'Project root: ' . l:root
endfunction

function! s:project_files() abort
  call s:project_cd()
  if exists(':CtrlP') == 2
    execute 'CtrlP ' . fnameescape(s:project_root())
  else
    execute 'edit' fnameescape(s:project_root())
  endif
endfunction

function! s:project_tree() abort
  let l:root = s:project_root()
  execute 'lcd' fnameescape(l:root)
  if exists(':NERDTree') == 2
    execute 'NERDTree' fnameescape(l:root)
  else
    execute 'edit' fnameescape(l:root)
  endif
endfunction

function! s:project_grep(pattern) abort
  call s:project_cd()
  execute 'silent grep! ' . a:pattern
  copen
endfunction

function! s:project_make(...) abort
  call s:project_cd()
  if a:0
    execute 'make ' . a:1
  else
    make
  endif
endfunction

function! s:git_status() abort
  call s:project_cd()
  if exists(':Git') == 2
    Git
  else
    echoerr 'vim-fugitive is not available.'
  endif
endfunction

function! s:git_blame() abort
  if exists(':Git') == 2
    Git blame
  else
    echoerr 'vim-fugitive is not available.'
  endif
endfunction

function! s:git_log_file() abort
  if exists(':0Gclog') == 2
    execute '0Gclog'
  elseif exists(':Git') == 2
    execute 'Git log -- %'
  else
    echoerr 'vim-fugitive is not available.'
  endif
endfunction

function! s:git_diff_file() abort
  if exists(':Gdiffsplit') == 2
    Gdiffsplit
  else
    echoerr 'vim-fugitive is not available.'
  endif
endfunction

function! s:git_stage_file() abort
  if empty(expand('%:p'))
    echoerr 'No current file to stage.'
    return
  endif

  if exists(':Git') == 2
    execute 'Git add ' . fnameescape(expand('%:p'))
    echo 'Staged: ' . expand('%:t')
  else
    echoerr 'vim-fugitive is not available.'
  endif
endfunction

function! s:git_commit(...) abort
  call s:project_cd()
  if exists(':Git') != 2
    echoerr 'vim-fugitive is not available.'
    return
  endif

  if a:0
    execute 'Git commit -m ' . shellescape(a:1)
  else
    Git commit
  endif
endfunction

command! Plugins call s:show_plugins()
command! ConfigCheck call s:config_check()
command! ConfigReload call s:config_reload()
command! TagsBuild call s:build_tags()
command! ProjectRoot echo s:project_root()
command! ProjectCD call s:project_cd()
command! ProjectFiles call s:project_files()
command! ProjectTree call s:project_tree()
command! -nargs=+ ProjectGrep call s:project_grep(<q-args>)
command! -nargs=* ProjectMake call s:project_make(<q-args>)
command! GitStatus call s:git_status()
command! GitBlame call s:git_blame()
command! GitFileLog call s:git_log_file()
command! GitFileDiff call s:git_diff_file()
command! GitStageFile call s:git_stage_file()
command! -nargs=? GitCommit call s:git_commit(<q-args>)
