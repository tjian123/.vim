if has('termguicolors')
  set termguicolors
endif

set background=dark
if !empty(globpath(&runtimepath, 'colors/onedark.vim'))
  silent! colorscheme onedark
else
  colorscheme desert
endif
set number
set relativenumber

set list
set listchars=tab:>-,trail:.,extends:>,precedes:<,nbsp:+
set fillchars=vert:\|,fold:-
set colorcolumn=81
set cursorline
set cursorlineopt=number,line

highlight CursorLine cterm=NONE ctermbg=236 guibg=#2c323c
highlight CursorLineNr cterm=bold ctermfg=220 guifg=#e5c07b gui=bold
highlight Visual cterm=NONE ctermbg=24 guibg=#3e4452
highlight Search ctermfg=16 ctermbg=220 guifg=#1e2127 guibg=#e5c07b
highlight IncSearch ctermfg=16 ctermbg=214 guifg=#1e2127 guibg=#d19a66
highlight ColorColumn ctermbg=235 guibg=#2a3038
highlight VertSplit ctermfg=240 ctermbg=NONE guifg=#3a3f4b guibg=NONE
highlight LineNr ctermfg=241 guifg=#5c6370
highlight MatchParen cterm=bold ctermbg=NONE ctermfg=81 gui=bold guifg=#61afef

augroup project_ui_numbers
  autocmd!
  autocmd BufEnter,WinEnter * if &buftype ==# '' | setlocal number relativenumber | endif
augroup END
