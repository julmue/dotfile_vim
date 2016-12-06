" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" appearance
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" # tell vim it's in a terminal
set t_Co=256

" # default colorscheme
colorscheme solarized
set background=light
let g:rehash256 = 1

" # set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar


" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" encoding
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Set utf8 as standard encoding
set encoding=utf8


" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" general behaviour
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" # shows the leaderkey in the right corner when awaiting a command
set showcmd

" # disables startmessage
set shortmess+=I

" # turn backup off, (most stuff is in svn, git, ...)
set nobackup
set nowb
set noswapfile

" # searching behaviour
" ## incremental search
set incsearch
set splitright
set ignorecase
set smartcase

" # allow hidden buffers
set hidden

" # always keep statusline
set laststatus=2

" # status line height
" set cmdheight=2

" # set to auto read when a file is changed from the outside
set autoread

" # automatically change working directory
" set autochdir

" # root always in home
" set path=$HOME/**

" # show line numbers
set number

" # highlight line break
" :set colorcolumn=81
:highlight ColorColumn ctermbg=darkgrey guibg=grey

" make vim not behave like vi but more sensible
set nocompatible

" make vim show the mode it's in
set showmode

" insert the right amount of blanks when tabbing at the beginning of a line
set smarttab
set softtabstop=4
set shiftwidth=4

" expand tab to spaces
set expandtab





" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" mappings
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" -----------------------------------------------------------------------------
" # set leader key
let mapleader="\<Space>"
let maplocalleader="\<Space>"

" -----------------------------------------------------------------------------
" + normal mode access;
"	+ from insert mode:
inoremap fd <esc>
" 	+ from all other modes: <esc>

" alternative movement mappings
nnoremap <c-l> <c-w>w
nnoremap <c-h> <c-w>W
" 	+ previous buffer
nnoremap <c-k> :bprevious<cr>
" next buffer
nnoremap <c-j> :bnext<cr>
" previous tab
nnoremap <c-u> :tabprevious<cr>
" next tab
nnoremap <c-i> :tabnext<cr>

" -----------------------------------------------------------------------------
" + buffer/file commands:<leader>f
"   + forcefully deleting buffer from list
nnoremap <leader>fD :bdelete!<CR>
"   + save buffer/file
nnoremap <leader>fs :w<CR>


" -----------------------------------------------------------------------------
" + window commands: <leader>w
"    + create vertical windows:
nnoremap <leader>wn <c-w>s
"    + create vertical windows:
nnoremap <leader>wv <c-w><c-v>
"    + close window:
"        + close current window
nnoremap <leader>wd <c-w><c-q>
"        + move window to left
nnoremap <leader>wl <c-w>H
"        + move window to right
nnoremap <leader>wr <c-w>L
"        + move window up
nnoremap <leader>wu <c-w>K
"        + move window down
nnoremap <leader>wd <c-w>J
"        + cycle
" nnoremap <leader>wc <c-w>r
"        + to new tab page
nnoremap <leader>wt <c-w>T
"        + maximize current window
nnoremap <leader>wm <c-w>w |
"        + resize windows
nnoremap <leader>wr <c-w> =


" ------------------------------------------------------------------------------
" + environment commands: <leader>a
"	shortcut 'a' is not that intuitiv,
"	but e is needed for buffers ...
"	mnemonic: "_a_utomat configuration"
"	+ vimrc
"		+ split & edit:
nnoremap <leader>ae :tabnew $MYVIMRC<cr>
"		+ resource
nnoremap <leader>as :so $MYVIMRC<cr>

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" + (toggleable) switches:<leader>s
"	as a mnemonic think of "switch"...
"     + toggle relative linenumbers
nnoremap <leader>sr :set relativenumber!<CR>
"     + toogle line numbers
nnoremap <leader>tn :set number!<CR>
"     + toggle code folding
nnoremap <leader>sf za
"     + toggle backgounr color
nnoremap <leader>sb :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" + compatibility mappings
" + communicating with the external world: copying and pasting to the clipboard register
"     + copying to the clipboard register
" 	(+ is the cut buffer, * is the selection buffer)
vnoremap <c-c> "+y
"     + cutting: deleting selected text and storing it in the clipboard register *
vnoremap <c-c>c "+d
"     + pasting to the clipboard register
nnoremap <c-v> "+p
inoremap <c-v> <esc>"+pa

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" # Disable Functionality:
" ## disable <c-z>: default - forces vim to shut down which is horrible
noremap <c-z> <c-R>
" ## disable recording shit...
noremap q <nop>
" ## disable runmode
noremap Q <nop>


" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" language extensions
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" enable syntax highlighting
syntax on

" enable filetype detection
filetype on

" enable filetype plugin mappings
filetype plugin on


" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" functions
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Delete trailing white space on save
function! <SID>DeleteTrailingWS()
    "Save last search and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    "Do the business:
    %s/\s\+$//e
    "Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l,c)
endfunction


" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" plugin configuration
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" # NerdTree
" open explorer
nnoremap <leader>ft :NERDTreeToggle<CR>
" remap nerdtree splitopen
let NERDTreeMapOpenVSplit=''

" # easymotion
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" JK motions: Line motions
nnoremap <leader>jj <Plug>(easymotion-s)


" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" package management
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" use pathogen package manager
execute pathogen#infect()
