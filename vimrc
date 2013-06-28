set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'derekwyatt/vim-fswitch'
Bundle 'vim-scripts/tComment'
Bundle 'vim-scripts/LaTeX-Suite-aka-Vim-LaTeX'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/Wombat'
Bundle 'vim-scripts/CSApprox'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

syntax on
set nowrap
set hlsearch 
set incsearch
set nospell

set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files

" Colorscheme
set t_Co=256
colorscheme wombat

" Movement settings
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
map <Left> <c-w>h
map <Right> <c-w>l
map <Up> <c-w>k
map <Down> <c-w>j

" Set title
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)\ -\ %{v:servername}

" GVim settings
set guioptions-=m
set mouse=c
" Hide GVim menu
set guioptions-=T

" Search settings
nnoremap <space> :noh<return><space>

" Change repeat command to set cursor to before change
nmap . .`[

" Indent Settings
set expandtab
set smarttab
set tabstop=3
set shiftwidth=3
set autoindent
set smartindent

" Delete spaces at the end of files
autocmd FileType c,cpp,python,tex autocmd BufWritePre <buffer> :%s/\s\+$//e

" Comment Settings
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Paste settings
nnoremap <F12> :set invpaste paste?<CR>
set pastetoggle=<F12>
set showmode
set textwidth=78

" Abbreviations
ab pymain if __name__=="__main__":
ab teh the

" Read vtu files as xml
au BufRead,BufNewFile *.vtu set filetype=xml

" FSwitch settings
command! A :FSHere
command! Al :FSRight
command! AL :FSSplitRight
command! Ah :FSLeft
command! AH :FSSplitLeft
command! Ak :FSAbove
command! AK :FSSplitAbove
command! Aj :FSBelow
command! AJ :FSSplitBelow

"Vim-LaTeX Settings
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
" set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
let g:Tex_CompileRule_dvi = 'latex -src-specials -interaction=nonstopmode $*'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_GotoError=1
let g:Tex_ViewRule_pdf = 'evince'
let g:Tex_MultipleCompileFormats = 'pdf'

" NERDTree settings
let NERDTreeIgnore=['\.o$', '\~$']
