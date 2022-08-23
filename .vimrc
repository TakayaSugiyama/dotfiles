" シンタックスハイライトを有効にする
set syntax=on
" tab => space
set expandtab
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
" Vimが挿入するインデントの幅
set shiftwidth=2
" ヤンクしたコードをコピーする
set clipboard^=unnamed,unnamedplus
" 絶対パスを表示
set statusline+=%F
" 常にstatuslineを表示させる
set laststatus=2
"
set re=0
" filetype プラグインによる indent を on にする
filetype plugin indent on
" 行末の空白を保存時に自動削除する
autocmd BufWritePre * :%s/\s\+$//e
" PodfileにRubyのシンタックスハイライトを当てる
au BufNewFile,BufRead Podfile set filetype=ruby
" Leaderをスペースに設定する
let mapleader = "\<Space>"
" fileをfuzzy検索
nnoremap <C-p> :CocList files<CR>
"全てのプラグインをロードする
packloadall
" 全てのプラグイン用にヘルプファイルをロードする
silent! helptags ALL
" プラグイン管理 vim-plug
call plug#begin('~/.vim/plugged')
" ダークテーマ
Plug 'dracula/vim', { 'as': 'dracula'  }
" grep
Plug 'mileszs/ack.vim'
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
" 補完
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Fancy status bar and tab line for Vim
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" lint
Plug 'dense-analysis/ale'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" GraphQL
Plug 'jparise/vim-graphql'
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
nnoremap <C-y> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let NERDTreeShowHidden = 1
autocmd VimEnter * execute 'NERDTree'

"Airlineの設定
let g:airline#extensions#tabline#enabled = 1
nnoremap <silent> , :bprev<CR>
nnoremap <silent> . :bnext<CR>
nnoremap bd :bd<CR>
let g:ale_disable_lsp = 1

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

" Move window
noremap sh <C-w>h
noremap sk <C-w>k
noremap sj <C-w>j
noremap sl <C-w>l

" coc setting
let g:coc_global_extensions = ['coc-go', 'coc-sql', 'coc-solargraph', 'coc-json', 'coc-prettier', 'coc-eslint', 'coc-tsserver', 'coc-lists', 'coc-graphql']
" 補完のポップアップメニューの色を設定
highlight Pmenu ctermfg=white ctermbg=black
highlight PmenuSel ctermfg=white ctermbg=gray

"sql format
xmap <leader>f  <Plug>(coc-format-selected)

set undofile
if !isdirectory(expand("$HOME/.vim/undodir"))
	  call mkdir(expand("$HOME/.vim/undodir"), "p")
endif
set undodir=$HOME/.vim/undodir


abbreviate tl - [ ]

" todoリストのon/offを切り替える
nnoremap <buffer> <Leader><Leader> :call ToggleCheckbox()<CR>
vnoremap <buffer> <Leader><Leader> :call ToggleCheckbox()<CR>

" 選択行のチェックボックスを切り替える
function! ToggleCheckbox()
  let l:line = getline('.')
  if l:line =~ '\-\s\[\s\]'
    let l:result = substitute(l:line, '-\s\[\s\]', '- [x]', '')
    call setline('.', l:result)
  elseif l:line =~ '\-\s\[x\]'
    let l:result = substitute(l:line, '-\s\[x\]', '- [ ]', '')
    call setline('.', l:result)
  end
endfunction

let g:dracula_italic = 0
packadd! dracula
syntax enable
colorscheme dracula
