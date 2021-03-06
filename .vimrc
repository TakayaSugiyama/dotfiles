" シンタックスハイライトを有効にする
set syntax=on
" タブ文字の表示幅
set tabstop=2
" 行番号を表示させる
set number
" 検索結果のハイライト
set hlsearch
" 検索時の大文字小文字を区別しない
set ignorecase
" 検索パターンに大文字を含んでいたら大文字小文字を区別する
set smartcase
" インクリメンタルサーチ 1文字毎に検索を行う
set incsearch
" 長くなってしまった時、折り返す
set wrap
" スワップファイルを作成しない
set noswapfile
" Vimが挿入するインデントの幅
set shiftwidth=2
" ヤンクしたコードをコピーする
set clipboard+=unnamed
" Leaderをスペースに設定する
let mapleader = "\<Space>"

" プラグイン管理 vim-plug
call plug#begin('~/.vim/plugged')
" ファイルツリー
Plug 'scrooloose/nerdtree'
" Git ラッパー
Plug 'tpope/vim-fugitive'
"インデントを可視化する
Plug 'nathanaelkane/vim-indent-guides'
" endを自動で挿入する
Plug 'tpope/vim-endwise'
" コメントアウトを楽にする
Plug 'preservim/nerdcommenter'
" 閉じカッコを補完する
Plug 'cohama/lexima.vim'
call plug#end()

" vim-fugitiveの設定
autocmd QuickFixCmdPost *grep* cwindow
set statusline+=%{fugitive#statusline()}

" vim-indnet-guidesの設定
let g:indent_guides_exclude_filetypes = ['nerdtree']
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red  ctermbg=22
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=23

" nerdtreeの設定
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let NERDTreeShowHidden = 1
autocmd VimEnter * execute 'NERDTree'

" nerdcommenterの設定
let g:NERDCreateDefaultMappings = 1

" 全角スペースの表示
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
