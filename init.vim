call plug#begin('~/.config/nvim/plugged')
" нижняя строка состояния
"Plug 'https://github.com/vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
" файловое дерево
Plug 'https://github.com/preservim/nerdtree'
" цвета с #
Plug 'https://github.com/ap/vim-css-color'
" Темы
Plug 'https://github.com/rafi/awesome-vim-colorschemes'
" Иконки
"Plug 'https://github.com/ryanoasis/vim-devicons'
" Терминал
Plug 'https://github.com/tc50cal/vim-terminal'
" Markdown
Plug 'https://github.com/preservim/vim-markdown.git'
" LaTex
" Plug 'https://github.com/lervag/vimtex'
" A Vim Plugin for Lively Previewing LaTeX PDF Output
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
"  Снипет
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" Вики
Plug 'https://github.com/vimwiki/vimwiki'
" fzf - нечёткий поиск
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Surround
Plug 'https://github.com/tpope/vim-surround'
" File Explorer
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
" Startup
" Plug 'mhinz/vim-startify'
Plug 'glepnir/dashboard-nvim'
" Translate
Plug 'skanehira/translate.vim'
" AutoSave
Plug 'Pocco81/AutoSave.nvim'
" Содержание текста (нужно скачать exuberant-ctags)
Plug 'https://github.com/preservim/tagbar'
Plug 'deoplete-plugins/deoplete-jedi'
" bufferline
" Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
Plug 'ryanoasis/vim-devicons' "Icons without colours
Plug 'akinsho/bufferline.nvim'
" ]p - вставить на строку выше, [p - ниже
Plug 'powerman/vim-plugin-ruscmd'
" Количество совпадений
Plug 'google/vim-searchindex'
" Автоматически закрывает скобки
Plug 'cohama/lexima.vim'
" Подсвечивает закрывающий и откры. тэг
Plug 'idanarye/breeze.vim'
" nnn
Plug 'luukvbaal/nnn.nvim'
" coc
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" python
" Plug 'yaegassy/coc-pylsp', {'do': 'yarn install --frozen-lockfile'} 
" LSP
Plug 'wbthomason/packer.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
" TreeSitter - подробная подстветка синтаксиса
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Autocomplit (cmp)
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" color schemas
Plug 'morhetz/gruvbox'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' } " tokyonight
Plug 'dracula/vim', { 'as': 'dracula' } " dracula
call plug#end()
" Highlight cursor line underneath the cursor horizontally.
set cursorline
" Show matching words during a search.
set showmatch
" enter the current millenium
set nocompatible
" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on
" Hotkeys
nnoremap <C-n> :NERDTreeToggle<CR>
imap jj <Esc>
noremap <C-f> :History<CR>
noremap <C-t> :tabnew<CR>
noremap <Tab> :BufferLineCycleNext<CR>
" Курсор всегда в центре экрана
set so=999
" noremap <C-u> :e ~/Dropbox/Area/TheSecondBrain/ibx/`date +"%F_%H-%M-%S.md"`<CR>

" switch language
inoremap <C-l> <C-^>
nmap gr <Plug>(Translate)
vmap t <Plug>(VTranslate)
nmap <F8> :TagbarToggle<CR>

" Системный буфер обмена shift - Y / P
noremap <C-c> "+y

"Appearance
" colorscheme gruvbox
"colorscheme tokyonight

"colorscheme dracula
"let g:lightline = {'colorscheme': 'dracula'}

" source ~/.local/share/nvim/plugged/awesome-vim-colorschemes/colors/gruvbox.vim

" По F1 очищаем последний поиск с подсветкой
nnoremap <silent><F1> :noh<CR>
" Simple Settings
set noswapfile
set number
set autoindent " автоматические отступы
set tabstop=4
" searching
set ignorecase	" игнорирование регистра
set smartcase
set hlsearch	" подсветка
"set relativenumber	" номеровка строк в соответствии с Настоящей
set shiftwidth=4 " правильное расставление линий
set smarttab " правильная идентификация tab
set softtabstop=4
set mouse=a " включение мышки
set wildmenu " При авто-дополнении в командной строке над ней выводятся возможные варианты
" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest
" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set clipboard+=unnamedplus "copy to clipboard
" don't auto commenting new lines
au BufEnter * set fo-=c fo-=r fo-=o
" Bufferline
set termguicolors
lua << EOF
require("bufferline").setup{}
EOF

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'
  cmp.setup({
	-- disable autocomplite and turn on it with C-Space
    -- completion = {
    -- autocomplete = false, -- disable auto-completion.
  -- },
	mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
 },
 sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['sumneko_lua'].setup {
    capabilities = capabilities
  }
EOF


" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" Запоминает, где nvim последний раз редактировал файл
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Показывать скрытые файлы и папки в NERDTree
let NERDTreeShowHidden = 1
let g:netrw_hide = 0
" nnn

lua << EOF
require("nnn").setup()
-- TreeSitter
-- Folding
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

EOF

lua << EOF
-- LSP
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
  local opts = {}
  server:setup(opts)
end)
-- for python download python3.9-venv
-- hotkeys for lsp

-- Проверка только в режиме normal

EOF

tnoremap <C-A-n> <cmd>NnnExplorer<CR>
nnoremap <C-A-n> <cmd>NnnExplorer %:p:h<CR>

set keymap=russian-jcukenwin
set iminsert=0 " Чтобы при старте ввод был на английском, а не русском (start > i)
set imsearch=0 " Чтобы при старте поиск был на английском, а не русском (start > /)
" Startup
let g:mapleader="\<Space>"
let g:dashboard_default_executive ='fzf'
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>



highlight lCursor guifg=NONE guibg=Cyan " Смена цвета курсора
"Проверка орфографии
set nospell
" Appearance
"let g:airline_theme='dracula'
" LaTeX
autocmd Filetype tex setl updatetime=30
let g:livepreview_previewer = 'open -a Preview'
let g:livepreview_previewer = 'zathura'
" fzf: Горячие клавиши для файлов и буферов
let g:fzf_buffers_jump = 1
" 'Предложения'
let g:deoplete#enable_at_startup = 1

" Снипет
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" Translate
let g:translate_source = "en"
let g:translate_target = "ru"
let g:translate_popup_window = 0 " if you want use popup window, set value 1
let g:translate_winsize = 3 " set buffer window height size if you doesn't use popup window

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" == Проверка орфографии ==
"     mkdir -p ~/.vim/spell
"    cd ~/.vim/spell
"    wget http://ftp.vim.org/vim/runtime/spell/ru.koi8-r.sug
"    wget http://ftp.vim.org/vim/runtime/spell/ru.koi8-r.spl
"    wget http://ftp.vim.org/vim/runtime/spell/en.ascii.sug
"    wget http://ftp.vim.org/vim/runtime/spell/en.ascii.spl

":set spell spelllang=ru,en       включить проверку орфографии
":set nospell                     выключить проверку орфографии
"]s                               следующее слово с ошибкой
"[s                               предыдущее слово с ошибкой
"z=                               замена слова на альтернативу из списка
"zg                               good word
"zw                               wrong word
"zG                               ignore word

" SNIPPETS
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a
nnoremap ,hey :-1read /home/vovanilak/.config/nvim/snip/hey.txt

" VIMSCRIPTS
" If GUI version of Vim is running set these options.
if has('gui_running')

    " Set the background tone.
    set background=dark

    " Set a custom font you have installed on your computer.
    " Syntax: set guifont=<font_name>\ <font_weight>\ <size>
    set guifont=Monospace\ Regular\ 14

    " Map the F4 key to toggle the menu, toolbar, and scroll bar.
    " <Bar> is the pipe character.
    " <CR> is the enter key.
    nnoremap <F4> :if &guioptions=~#'mTr'<Bar>
        \set guioptions-=mTr<Bar>
        \else<Bar>
        \set guioptions+=mTr<Bar>
        \endif<CR>

endif

" STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ row:\ %l\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

" }}}

