set nocompatible

call plug#begin('~/.config/nvim/plugged')

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'Shougo/vimproc.vim'
Plug 'zchee/deoplete-jedi'

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-obsession'
Plug 'Konfekt/FastFold'

Plug 'lervag/vimtex'

Plug 'tpope/vim-classpath', { 'for' : 'clojure' }
Plug 'guns/vim-clojure-static', { 'for' : 'clojure'}
Plug 'tpope/vim-fireplace', { 'for' : 'clojure' }

Plug 'derekwyatt/vim-scala', { 'for' : 'scala' }

Plug 'kchmck/vim-coffee-script', { 'for' : 'coffee' }

Plug 'jpalardy/vim-slime', { 'for' : ['lisp', 'haskell'] }
Plug 'eagletmt/neco-ghc', { 'for' : 'haskell' }
Plug 'eagletmt/ghcmod-vim', { 'for' : 'haskell' }
Plug 'dag/vim2hs', { 'for' : 'haskell' }

call plug#end()

set tags=/home/samuel/.vim/tags

let maplocalleader = ","

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources = {'haskell' : ['ghc']}

map T :NERDTreeToggle<CR>
let NERDTreeMapOpenInTabSilent = ''
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '~'

let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": ":1.1"}
let g:slime_dont_ask_default = 1

let g:syntastic_mode_map = { "mode": "active", "active_filetypes": [], "passive_filetypes": ["scala", "asm"] }
let g:syntastic_check_on_open = 1 
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_haskell_checkers=['ghc_mod', 'hlint']

let g:haskell_conceal_wide = 1

inoremap <silent><expr> <Tab>
\ pumvisible() ? "\<C-n>" :
\ deoplete#mappings#manual_complete()

autocmd CursorMovedI *  if pumvisible() == 0|silent! pclose|endif "Automatically close omnicomplete scratch preview
autocmd InsertLeave * if pumvisible() == 0|silent! pclose|endif

let g:tex_flavor = 'latex'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set ssop-=options " do not store global and local values in a session
set ssop-=folds " do not store folds

set foldcolumn=1

" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set showtabline=1

" Use thinner borders for windows
set fillchars=stl:-,stlnc:-,vert:│

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
" set whichwrap+=<,>,h,l

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Disable mouse support
set mouse=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable

set t_Co=256
colorscheme burrito

set number

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set smarttab
set autoindent
set nowrap

"------ Filetypes ------"

" Vimscript
autocmd FileType vim setlocal cindent expandtab shiftwidth=4 tabstop=8 softtabstop=4

" Shell
autocmd FileType sh setlocal cindent expandtab shiftwidth=4 tabstop=8 softtabstop=4

" Lisp
autocmd BufRead,BufNewFile lisp,asd setfiletype lisp
autocmd Filetype lisp setlocal lisp expandtab shiftwidth=2 tabstop=8 softtabstop=2

" Scheme
autocmd BufRead,BufNewFile scm setfiletype scheme
autocmd Filetype scheme setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=8
autocmd FileType scheme let b:is_chicken=1

" Ruby
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2

" Python
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4

" Perl
autocmd FileType perl setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4

" C
autocmd FileType c,h setfiletype c
autocmd FileType c,h setlocal cindent noexpandtab shiftwidth=4 tabstop=4 softtabstop=4

" C++
autocmd FileType cpp,hpp setfiletype cpp
autocmd FileType cpp,hpp setlocal cindent noexpandtab shiftwidth=4 tabstop=4 softtabstop=4

" ASH
autocmd BufRead,BufNewFile ash setfiletype ash
autocmd FileType ash setlocal cindent noexpandtab shiftwidth=4 tabstop=4 softtabstop=4

" Haskell
autocmd BufRead,BufNewFile hs setfiletype haskell
autocmd Filetype haskell setlocal tabstop=8 expandtab softtabstop=4 shiftwidth=4 smarttab shiftround nojoinspaces

" Cabal
autocmd BufRead,BufNewFile hs setfiletype cabal
autocmd FileType cabal setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4

" Java
autocmd FileType java setlocal cindent expandtab shiftwidth=4 tabstop=4 softtabstop=4

" Scala
autocmd FileType scala setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2

" PHP
autocmd FileType php setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" X?HTML & XML
autocmd FileType html.*,html,xhtml,xml setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" CSS
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" LESS
autocmd FileType less setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4

" SASS
autocmd FileType sass setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4

" JavaScript
autocmd BufRead,BufNewFile json setfiletype javascript
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 cinoptions=J2
let javascript_enable_domhtmlcss=1

" CoffeeScript
autocmd FileType coffee setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set acd "Automatically change working directory

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

nnoremap <S-h> gT
nnoremap <S-l> gt

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
" set viminfo^=%


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""

" Never show the status line
set laststatus=0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remap VIM 0 to first non-blank character
map 0 ^

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction 
