# .vim

一个最小可用的 Vim 配置仓库，包含原生 `pack` 包管理。

## 目录结构

```text
.vim/
├── pack/
│   └── vendor/
│       ├── opt/
│       │   └── .gitkeep
│       └── start/
│           └── .gitkeep
├── packages/
│   ├── opt.txt
│   └── start.txt
├── scripts/
│   ├── check.sh
│   └── sync-packages.sh
├── vimrc
├── vimrc.d/
│   ├── post/
│   │   ├── commands.vim
│   │   ├── plugins.vim
│   │   └── ui.vim
│   └── pre/
│       ├── basic.vim
│       ├── languages.vim
│       └── plugins.vim
├── .editorconfig
├── .gitignore
├── LICENSE
├── Makefile
└── README.md
```

## 使用方式

如果你把这个仓库作为 `~/.vim`：

```bash
ln -sf ~/.vim/vimrc ~/.vimrc
```

插件可以直接放到：

- `pack/vendor/start/`：启动即加载
- `pack/vendor/opt/`：按需 `packadd`

更推荐维护插件清单后执行：

```bash
make sync
```

`packages/start.txt` 和 `packages/opt.txt` 每行一个仓库，格式为 `owner/repo`。

例如：

```text
tpope/vim-surround
preservim/nerdtree
```

## 安装与升级

首次安装：

```bash
git clone <your-repo> ~/.vim
ln -sf ~/.vim/vimrc ~/.vimrc
cd ~/.vim
make sync
```

升级插件：

```bash
cd ~/.vim
make sync
```

校验配置：

```bash
cd ~/.vim
make check
```

当前默认内置了一组常用插件：

- `tpope/vim-sensible`
- `tpope/vim-repeat`
- `tpope/vim-sleuth`
- `tpope/vim-surround`
- `tpope/vim-commentary`
- `tpope/vim-fugitive`
- `airblade/vim-gitgutter`
- `itchyny/lightline.vim`
- `joshdick/onedark.vim`
- `mhinz/vim-startify`
- `preservim/nerdtree`
- `ctrlpvim/ctrlp.vim`
- `jiangmiao/auto-pairs`
- `editorconfig/editorconfig-vim`
- `Yggdroot/indentLine`
- `sheerun/vim-polyglot`

## 功能概览

- 纯 Vim 原生 `pack` 包管理
- 前置配置加载后再 `packloadall`，插件相关 UI 首次启动即可生效
- `onedark` 主题、`lightline` 状态栏、`Startify` 启动屏
- NERDTree、CtrlP、最近文件、缓冲区切换
- Git 状态、blame、diff、hunk 操作
- 项目根目录感知的文件树、搜索、grep、make、tags
- 常见语言的语法高亮、缩进规则和轻量格式化入口

这组插件不依赖 Node、Python LSP 或额外后台服务，适合作为一套轻量日用配置起点。

## 常用快捷键

基础操作：

- `<leader>w` 保存当前文件
- `<leader>q` 关闭当前窗口
- `<leader>h` 清除搜索高亮
- `<C-h>` / `<C-j>` / `<C-k>` / `<C-l>` 在窗口间切换

配置与启动：

- `<leader>ss` 打开启动屏
- `<leader>pl` 查看已加载插件列表
- `<leader>vc` 查看当前配置状态
- `<leader>vr` 重新加载配置

项目操作：

- `<leader>pr` 显示当前项目根目录
- `<leader>pc` 将当前窗口切换到项目根目录
- `<leader>e` 在项目根打开文件树
- `<leader>gf` 在项目根搜索文件
- `<leader>gg` 在项目根执行文本搜索
- `<leader>m` 在项目根执行 `:make`

代码导航：

- `<leader>tb` 生成项目 tags
- `<leader>tt` 跳转到光标下符号定义
- `<leader>to` 返回上一个 tag 位置
- `<leader>tl` 从候选列表中选择 tag
- `<leader>ts` 在分屏中打开 tag
- `<leader>co` 打开 quickfix 列表
- `<leader>cc` 关闭 quickfix 列表
- `<leader>cn` 跳到下一条 quickfix
- `<leader>cp` 跳到上一条 quickfix

Git 操作：

- `<leader>gs` 打开项目 Git 状态
- `<leader>gb` 查看当前文件 blame
- `<leader>gl` 查看当前文件提交历史
- `<leader>gd` 查看当前文件 diff
- `<leader>ga` 暂存当前文件
- `<leader>gc` 打开 Git commit
- `]h` / `[h` 跳转到下一个或上一个 Git hunk
- `<leader>hs` 暂存当前 hunk
- `<leader>hu` 回滚当前 hunk
- `<leader>hp` 预览当前 hunk

编辑增强：

- `gcc` 注释当前行
- `gc{motion}` 注释指定文本对象或动作范围
- `cs"'` 修改包裹符
- `ysiw]` 给当前单词加上 `[]`
- `<leader>f` 打开 CtrlP 文件搜索
- `<leader>b` 打开缓冲区搜索
- `<leader>r` 打开最近文件列表
- `<leader>cf` 格式化当前缓冲区

## UI 与编辑体验

- `onedark` 主题
- `lightline` 状态栏
- `Startify` 启动屏
- 始终显示 tabline
- 当前行高亮
- 当前行号高亮
- 搜索和可视选择高亮
- `colorcolumn=81`
- 空白字符可视化
- 空启动时进入启动屏

## 语言与工程能力

- `vim-polyglot` 提供常见语言语法、缩进和文件类型支持
- `vim-sleuth` 自动探测缩进风格
- Python 默认 4 空格缩进
- Go 和 Makefile 使用制表符
- Shell、Lua、YAML、JSON、TOML 默认 2 空格缩进
- Markdown、文本和 Git 提交信息默认启用拼写检查
- Markdown 默认开启软换行
- `Dockerfile*`、`.env`、`*.tf`、`*.tfvars` 自动识别文件类型
- `:ProjectMake` 在项目根目录执行 `:make`
- 支持 quickfix、项目 grep、项目文件搜索、tags 和格式化入口

## 项目根目录感知

- 根目录会优先根据 `.git`、`.hg`、`.svn`、`.root`、`.project`、`Makefile`、`package.json`、`pyproject.toml`、`go.mod` 向上查找
- `:ProjectRoot` 查看当前文件所属项目根
- `:ProjectCD` 把当前窗口本地目录切到项目根
- `:ProjectFiles` 在项目根打开文件搜索
- `:ProjectTree` 在项目根打开文件树
- `:ProjectGrep {pattern}` 在项目根执行搜索
- `:GitStatus` 在项目根打开 Git 状态
- `:GitBlame` 查看当前文件 blame
- `:GitFileLog` 查看当前文件历史
- `:GitFileDiff` 查看当前文件 diff
- `:GitStageFile` 暂存当前文件
- `:GitCommit` 执行提交

## 格式化策略

- Python 优先使用 `black`
- Shell 优先使用 `shfmt`
- Go 优先使用 `gofmt`
- JSON 优先使用 `jq`
- 如果没有对应格式化工具，则回退到 Vim 内置 `gg=G`

## 排障

如果怀疑配置没有生效，可以先在 Vim 里执行：

```vim
:ConfigCheck
:Plugins
:ProjectRoot
:scriptnames
```

常见检查项：

- `:ConfigCheck` 用于查看入口目录、主题、行号、插件命令是否存在
- `:Plugins` 用于确认 `pack/start` 下的插件是否已加载
- `:ProjectRoot` 用于确认当前文件是否识别到了正确的项目根
- `:scriptnames` 用于确认 `vimrc.d/*.vim` 是否真的被 source

如果刚修改过配置文件，可执行：

```vim
:ConfigReload
```

如果刚修改过插件清单，可在 shell 中执行：

```bash
cd ~/.vim
make sync
```

## 校验

```bash
make check
```
