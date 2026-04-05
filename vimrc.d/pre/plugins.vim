let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ }

let g:startify_session_autoload = 0
let g:startify_session_persistence = 0
let g:startify_change_to_vcs_root = 1
let g:startify_relative_path = 1
let g:startify_files_number = 8
let g:startify_lists = [
      \ { 'type': 'sessions', 'header': ['   Sessions'] },
      \ { 'type': 'files', 'header': ['   Recent Files'] },
      \ { 'type': 'dir', 'header': ['   Files In Current Directory'] },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks'] },
      \ { 'type': 'commands', 'header': ['   Commands'] },
      \ ]
let g:startify_bookmarks = [
      \ '~/.vim/README.md',
      \ '~/.vim/vimrc',
      \ '~/.vim/vimrc.d/pre/basic.vim',
      \ '~/.vim/vimrc.d/pre/plugins.vim',
      \ '~/.vim/vimrc.d/pre/languages.vim',
      \ '~/.vim/vimrc.d/post/ui.vim',
      \ '~/.vim/vimrc.d/post/commands.vim',
      \ ]
let g:startify_commands = [
      \ { 'u': ['Update packages', ':!make sync'] },
      \ { 'c': ['Open vimrc', ':edit ~/.vim/vimrc'] },
      \ { 'p': ['Open plugins config', ':edit ~/.vim/vimrc.d/pre/plugins.vim'] },
      \ { 'l': ['Open languages config', ':edit ~/.vim/vimrc.d/pre/languages.vim'] },
      \ { 'r': ['Show project root', ':ProjectRoot'] },
      \ { 't': ['Open project tree', ':ProjectTree'] },
      \ { 'g': ['Open git status', ':GitStatus'] },
      \ ]

let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_use_caching = 0

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeWinSize = 30
let g:NERDTreeDirArrows = 1
let g:NERDTreeStatusline = ''

let g:indentLine_enabled = 1
let g:indentLine_char = '¦'
let g:indentLine_setColors = 0

let g:gitgutter_map_keys = 0

" vim-commentary:
"   gcc      comment current line
"   gc{motion} comment target motion
" vim-surround:
"   cs"'     change surrounding quotes
"   ysiw]    add [] around current word
" NERDTree:
"   <leader>e open project file tree
" CtrlP:
"   <leader>f find files
"   <leader>b switch buffers
"   <leader>r recent files
" Startify:
"   <leader>ss open start screen
