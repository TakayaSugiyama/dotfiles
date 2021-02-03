set syntax=on
set tabstop=4
set number
set hlsearch
set ignorecase
set smartcase
set incsearch
set wrap
set noswapfile
set tabstop=2
set shiftwidth=2
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
autocmd QuickFixCmdPost *grep* cwindow
set statusline+=%{fugitive#statusline()}

Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
call plug#end()
1
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let NERDTreeShowHidden = 1
autocmd VimEnter * execute 'NERDTree'
