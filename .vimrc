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
set clipboard+=unnamed

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'

Plug 'tpope/vim-fugitive'
autocmd QuickFixCmdPost *grep* cwindow
set statusline+=%{fugitive#statusline()}

Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red  ctermbg=22
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=23
let g:indent_guides_exclude_filetypes = ['nerdtree']

Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-endwise'
Plug 'vim-syntastic/syntastic'
call plug#end()

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let NERDTreeShowHidden = 1
autocmd VimEnter * execute 'NERDTree'

function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif
