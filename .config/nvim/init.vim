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

" Plugins
set nocompatible
filetype off   


call plug#begin('~/.vim/plugged')

Plug 'git://git.wincent.com/command-t.git'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/vimproc.vim'
Plug 'jceb/vim-orgmode'
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

" Autocompletion
"Plug 'Valloric/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"" Markdown
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
Plug 'python-mode/python-mode'

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

" Writing 
Plug 'dbmrq/vim-ditto'
Plug 'junegunn/goyo.vim'

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
        \"cpp": ["!g++ %", "./a.out", "rm ./a.out"],
        \"c": ["!gcc %", "./a.out", "rm ./a.out"],
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
command Spellcommands setlocal spell | setlocal linebreak | setlocal tw=79
autocmd BufRead,BufNewFile *.txt Spellcommands
autocmd BufRead,BufNewFile *.org Spellcommands
autocmd BufRead,BufNewFile *.md  Spellcommands
autocmd BufRead,BufNewFile *.tex Spellcommands

" Afleveringer
autocmd BufRead,BufNewFile comments.txt setlocal spelllang=da
autocmd BufRead,BufNewFile feedback.txt setlocal spelllang=da

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

let g:vimtex_quickfix_ignore_filters = [
  \"Package microtype Warning: `draft' option active. Disabling all micro-typographic extensions. This might lead to different line and page breaks.",
  \"Package hyperref Warning: Draft mode on.",
  \'Underfull \\hbox (badness [0-9]*) in ',
  \'Overfull \\hbox ([0-9]*.[0-9]*pt too wide) in ',
  \'Overfull \\hbox ([0-9]*.[0-9]*pt too wide) detected ',
  \'Package hyperref Warning: Token not allowed in a PDF string',
  \'Package typearea Warning: Bad type area settings!',
  \".*LaTeX Font Warning:.*",
  \'LaTeX Warning: Float too large for page by [0-9]*.[0-9]*pt on input line [0-9]*.',
  \]

let g:Tex_IgnoredWarnings = 
    \'Underfull'."\n".
    \'Overfull'."\n".
    \'specifier changed to'."\n".
    \'You have requested'."\n".
    \'Missing number, treated as zero.'."\n".
    \'There were undefined references'."\n".
    \'Citation %.%# undefined'."\n".
    \'Double space found.'."\n"

let g:Tex_IgnoreLevel = 8
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


" Autocompletion 
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

"hi SpellBad gui=undercurl guifg=undercurl
"let g:tex_comment_nospell=1

" Coq
let g:coqtail_project_files = ['_CoqProject', '_CoqProject.local']
hi default CheckedByCoq ctermbg=lightgreen guibg=Green
hi default SentToCoq ctermbg=lightblue guibg=LimeGreen

" Writing
au FileType markdown,text,tex DittoOn  " Turn on Ditto's autocmds
nmap <leader>di <Plug>ToggleDitto      " Turn Ditto on and off

" If you don't want the autocmds, you can also use an operator to check
" specific parts of your text:
" vmap <leader>d <Plug>Ditto	       " Call Ditto on visual selection
" nmap <leader>d <Plug>Ditto	       " Call Ditto on operator movement

nmap =d <Plug>DittoNext                " Jump to the next word
nmap -d <Plug>DittoPrev                " Jump to the previous word
nmap +d <Plug>DittoGood                " Ignore the word under the cursor
nmap _d <Plug>DittoBad                 " Stop ignoring the word under the cursor
nmap ]d <Plug>DittoMore                " Show the next matches
nmap [d <Plug>DittoLess                " Show the previous matches

" GOyo
autocmd! User GoyoEnter nested set eventignore=FocusGained
autocmd! User GoyoLeave nested set eventignore=
