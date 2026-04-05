set encoding=utf-8
set hidden
set number
set relativenumber
set cursorline
set signcolumn=yes
set updatetime=300
set wildmenu
set wildignore+=*.o,*.obj,*.so,*.a,*.pyc,*.class
set wildignore+=*/.git/*,*/node_modules/*,*/dist/*,*/build/*
set showcmd
set showmode
set laststatus=2
set showtabline=2
set cmdheight=1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smartindent
set ignorecase
set smartcase
set incsearch
set hlsearch
set matchpairs+=<:>
set nowrap
set scrolloff=4
set sidescrolloff=8
set splitbelow
set splitright
set mouse=a
set clipboard=unnamedplus

filetype plugin indent on
syntax enable

let mapleader = ' '

nnoremap <silent> <leader>w :write<CR>
nnoremap <silent> <leader>q :quit<CR>
nnoremap <silent> <leader>h :nohlsearch<CR>
nnoremap <silent> <leader>ss :Startify<CR>
nnoremap <silent> <leader>pl :Plugins<CR>
nnoremap <silent> <leader>vr :ConfigReload<CR>
nnoremap <silent> <leader>vc :ConfigCheck<CR>
nnoremap <silent> <leader>pr :ProjectRoot<CR>
nnoremap <silent> <leader>pc :ProjectCD<CR>
nnoremap <silent> <leader>e :ProjectTree<CR>
nnoremap <silent> <leader>f :CtrlP<CR>
nnoremap <silent> <leader>b :CtrlPBuffer<CR>
nnoremap <silent> <leader>r :CtrlPMRUFiles<CR>
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l
nnoremap <silent> <leader>gs :GitStatus<CR>
nnoremap <silent> <leader>gb :GitBlame<CR>
nnoremap <silent> <leader>gl :GitFileLog<CR>
nnoremap <silent> <leader>gd :GitFileDiff<CR>
nnoremap <silent> <leader>ga :GitStageFile<CR>
nnoremap <silent> <leader>gc :GitCommit<CR>
