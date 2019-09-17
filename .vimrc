set rnu!
set ai
set hlsearch            
set incsearch          
set showmatch         
set ignorecase       
set smartcase       

set shiftwidth=4
set expandtab
set autoindent
set smartindent
set cindent

set visualbell t_vb= 
set novisualbell    

" Plugins
set nocompatible
filetype off   
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'git://git.wincent.com/command-t.git'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Shougo/vimproc.vim'
Plugin 'jceb/vim-orgmode'
Plugin 'Valloric/YouCompleteMe'
Plugin 'leafgarland/typescript-vim'
Plugin 'tpope/vim-speeddating'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'ayu-theme/ayu-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'MikeCoder/quickrun.vim' 
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'mboughaba/i3config.vim'
Plugin 'ap/vim-css-color'
Plugin 'itchyny/vim-haskell-indent'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'dag/vim-fish'

call vundle#end()
filetype plugin indent on
syntax on

set timeout
set timeoutlen=2500
set ttimeoutlen=10
" Changing the cursor based on mode
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)
let g:molokai_original = 1

" Theme
set termguicolors     " enable true colors support
let ayucolor="mirage"   " for dark version of theme
colorscheme ayu
let g:airline_theme='ayu'

" Gui
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar"

" Quickrun
let g:quickrun_known_file_types = {
        \"cpp": ["!g++ %", "./a.out"],
        \"c": ["!gcc %", "./a.out"],
        \"php": ["!php %"],
        \"vim": ["source %"],
        \"py": ["!python3 %"],
    \}

nnoremap <F5> :QuickRun<cr>

" Java
autocmd FileType java setlocal omnifunc=javacomplete#Complete

set completeopt-=preview
