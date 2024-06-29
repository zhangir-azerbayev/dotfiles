" Comments in Vimscript start with a `"`.

" If you open this file in Vim, it'll be syntax highlighted for you.

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible
" Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>


"Default indenting settings
set expandtab           " enter spaces when tab is pressed
set textwidth=0       " break lines when line length increases
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line

" C and C++ Language Settings
autocmd FileType c,cpp setlocal cindent shiftwidth=4 tabstop=4

" Python Settings
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4

" Rust Settings
autocmd FileType rust setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4

" Lisp and Scheme Settings
autocmd FileType lisp,scheme setlocal lisp

" Use system clipboard 
set clipboard=unnamedplus

" Vertically split on the right 
set splitright 

" Faster updatetime
set updatetime=300


" Configures vim-plug 
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'sainnhe/gruvbox-material'
Plug 'preservim/nerdtree'
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'
Plug 'rust-lang/rust.vim'
Plug 'khaveesh/vim-fish-syntax'
Plug 'tmsvg/pear-tree'
Plug 'jpalardy/vim-slime'
Plug 'neovim/nvim-lspconfig'
" Configures vimtex 
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
" Configures ultisnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories = ["~/.vim/UltiSnips"]
let g:UltiSnipsEditSplit = "tabdo"
" Configures pear-tree
let g:pear_tree_repeatable_expand=0
let g:pear_tree_ft_disabled = ["tex"]
call plug#end()


"theming 
"“ color schemes
set termguicolors
syntax enable
set background=dark
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_performance = 1
colorscheme gruvbox-material

" something for rust 
filetype plugin indent on 

" Configures NERDTree
nnoremap <C-t> :NERDTreeToggle<CR>

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Make the vim-slime target the neovim terminal
let g:slime_target = "tmux"
let g:slime_bracketed_paste = 1
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}

" Do lua stuff for nvim-lspconfig
let $PYRIGHT_PYTHON = system("conda info --json | jq -r '.active_prefix'") . "/bin/python"
lua << EOF
require('lspconfig').pyright.setup{
  on_attach = function(client, bufnr)
    client.config.settings = {
      python = {
        analysis = {
          typeCheckingMode = "off",
          diagnosticMode = "workspace",
          useLibraryCodeForTypes = true,
          disable = { "unresolved-import", "unknown-attribute" }
        }
      }
    }
    if client.resolved_capabilities.workspace_configuration then
      client.notify("workspace/didChangeConfiguration", {settings = client.config.settings})
    end
    vim.lsp.buf_attach_client(bufnr, client.id)
  end
}

require('lspconfig').clangd.setup{
  on_attach = function(client, bufnr)
    -- additional setup can be done here
    vim.lsp.buf_attach_client(bufnr, client.id)
  end,
  cmd = { "clangd", "--background-index", "--clang-tidy" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = function(fname)
    return require('lspconfig.util').root_pattern("compile_commands.json", "compile_flags.txt", ".git")(fname) or vim.fn.getcwd()
  end,
}

vim.diagnostic.config({
  virtual_text = true,  -- disable virtual text
  signs = false,          -- keep signs on the line number column
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    source = "always",  -- show source in diagnostic float window
  },
})
EOF
nnoremap <silent> gd :lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr :lua vim.lsp.buf.references()<CR>
nnoremap <silent> K :lua vim.lsp.buf.hover()<CR>
