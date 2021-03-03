"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.vimrc
"

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
set hidden

set visualbell t_vb= 
set novisualbell    
set mouse=a
set autochdir
set omnifunc=syntaxcomplete#Complete

" Plugins
set nocompatible
filetype off   

call plug#begin('~/.vim/plugged')

Plug 'git://git.wincent.com/command-t.git'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/vimproc.vim'
Plug 'jceb/vim-orgmode'
Plug 'Valloric/YouCompleteMe'
Plug 'leafgarland/typescript-vim'
Plug 'tpope/vim-speeddating'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'scrooloose/nerdcommenter'
Plug 'MikeCoder/quickrun.vim' 
Plug 'mboughaba/i3config.vim'
Plug 'ap/vim-css-color'
Plug 'itchyny/vim-haskell-indent'
Plug 'eagletmt/ghcmod-vim'
Plug 'dag/vim-fish'
Plug 'jez/vim-better-sml'
Plug 'BrandonRoehl/auto-omni'
Plug 'calebsmith/vim-lambdify'
Plug 'preservim/nerdtree'
Plug 'andymass/vim-matchup'

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Markdown preview
Plug 'JamshedVesuna/vim-markdown-preview'
let vim_markdown_preview_github=1

" HTML
Plug 'alvan/vim-closetag'
Plug 'mattn/emmet-vim'

" Solidity
Plug 'tomlion/vim-solidity'
Plug 'dmdque/solidity.vim'

" OCaml
Plug 'ocaml/vim-ocaml'

" Elm
Plug 'elmcast/elm-vim'

" Scilla
Plug 'edisonljh/vim-scilla'
Plug 'dense-analysis/ale'

" Python3
Plug 'nvie/vim-flake8'

" LaTeX
Plug 'lervag/vimtex'
Plug 'jiangmiao/auto-pairs'
Plug 'KeitaNakamura/tex-conceal.vim'  
Plug 'Konfekt/FastFold'


" Javascript
Plug 'maxmellon/vim-jsx-pretty'

" Java
Plug 'hdiniz/vim-gradle'
Plug 'artur-shaik/vim-javacomplete2'

" Git
Plug 'tpope/vim-fugitive'

" Clipboard
Plug 'junegunn/vim-peekaboo'

" Snippets
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

" Theme
Plug 'ayu-theme/ayu-vim'

" Coq
Plug 'whonore/Coqtail'

call plug#end()

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
"let ayucolor="light"   " for light version of theme
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
        \"trp": ["!~/Repos/Troupe/local.sh %"],
        \"sol": ["!solc --bin --optimize %"],
        \"midlang": ["!mid build %"],
        \"js": ["!node %"],
    \}

nnoremap <F5> :QuickRun<cr>

" Spell check
command Dkdir setlocal spelllang=da
command Spellcommands setlocal spell | setlocal linebreak
autocmd BufRead,BufNewFile *.txt Spellcommands
autocmd BufRead,BufNewFile *.org Spellcommands
autocmd BufRead,BufNewFile *.md  Spellcommands
autocmd BufRead,BufNewFile *.tex Spellcommands

" Afleveringer
autocmd BufRead,BufNewFile comments.txt setlocal spelllang=da

" Troupe
au BufRead,BufNewFile *.trp set filetype=troupe
au! Syntax troupe source ~/.config/nvim/troupe.vim

" Solidity
augroup quickfix
  autocmd!
  autocmd QuickFixCmdPost make nested copen
augroup END

" Liquidity
au BufRead,BufNewFile *.liq set filetype=ocaml
au BufRead,BufNewFile *.midlang set filetype=elm
au BufRead,BufNewFile *.conf set filetype=conf

" LaTeX
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_progname = 'nvr'
let g:tex_flavor = 'latex'
"let g:vimtex_quickfix_mode=0
set conceallevel=2
let g:tex_conceal="abdgm"
hi clear Conceal
let g:vimtex_fold_enabled=1

"let g:vimtex_compiler_latexmk = {
        "\ 'options' : [
        "\   '-pdf' ,
        "\   '-shell-escape' ,
        "\   '-verbose' ,
        "\   '-file-line-error',
        "\   '-synctex=1' ,
        "\   '-interaction=nonstopmode' ,
        "\ ],
        "\}

" Matchup
let g:matchup_surround_enabled = 0
let g:matchup_transmute_enabled = 1
let g:matchup_matchparen_deferred = 1
let g:matchup_override_vimtex = 1

" Nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
nmap <F6> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.DS_Store$', '\.git$', '__pycache__'] " ignore files in nerd tree

" Snippets
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"hi SpellBad gui=undercurl guifg=undercurl
"let g:tex_comment_nospell=1

" Coq
let g:coqtail_project_files = ['_CoqProject', '_CoqProject.local']
hi default CheckedByCoq ctermbg=lightgreen guibg=Green
hi default SentToCoq ctermbg=lightblue guibg=LimeGreen
