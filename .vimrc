" Enable syntax
syntax sync fromstart
if has("syntax")
    syntax sync fromstart
    syntax on
    set background=dark
endif

" Basic settings
set number
set relativenumber
set clipboard=unnamed
set softtabstop=4
set shiftwidth=4
set expandtab
set incsearch
set ignorecase
set smartcase
set ruler
set showmode
set viminfo=%,'50,\"100,:100,n~/.viminfo
set autoindent
set backspace=2

" Keymaps
map <C-o> :bn<CR>
map <C-k> :bp<CR>
map 4 $
vmap q <gv
vmap <TAB> >gv

" Enable smart indent for braces
set cindent
set cinkeys-=0#
set indentkeys-=0#

" Auto-close braces with proper indentation
inoremap {<CR> {<CR>}<Esc>O
inoremap {; {<CR>};<Esc>O
inoremap {{ {
inoremap {} {}

" File types
augroup filetypedetect
au BufNewFile,BufRead *.c,*.h set filetype=c softtabstop=4 shiftwidth=4
au BufNewFile,BufRead *.js set filetype=javascript softtabstop=2 shiftwidth=2
au BufNewFile,BufRead *.ts set filetype=typescript softtabstop=2 shiftwidth=2
au BufNewFile,BufRead *.py set filetype=python softtabstop=4 shiftwidth=4
au BufNewFile,BufRead *.go set filetype=go softtabstop=4 shiftwidth=4
au BufNewFile,BufRead *.md set filetype=markdown softtabstop=4 shiftwidth=4
augroup END

" Remember cursor
if has("autocmd")
    autocmd BufReadPost * if line("'\"") | exe "'\"" | endif
endif

augroup custom_colors
  autocmd!
  " Control keywords (if, for, while, return, else) - YELLOW like in photo
  autocmd Syntax * hi Statement cterm=bold ctermfg=3
  autocmd Syntax * hi Conditional cterm=bold ctermfg=3
  autocmd Syntax * hi Repeat cterm=bold ctermfg=3
  autocmd Syntax * hi Label cterm=bold ctermfg=3
  autocmd Syntax * hi Keyword cterm=bold ctermfg=3
  
  " Types (int, size_t, void, char) - DARK GREEN like in photo
  autocmd Syntax * hi Type cterm=bold ctermfg=2
  autocmd Syntax * hi StorageClass cterm=bold ctermfg=2
  autocmd Syntax * hi Structure cterm=bold ctermfg=2
  autocmd Syntax * hi Typedef cterm=bold ctermfg=2
  
  " Constants and numbers (0, 1, -1) - PURPLE/MAGENTA like in photo
  autocmd Syntax * hi Constant cterm=bold ctermfg=5
  autocmd Syntax * hi Number cterm=bold ctermfg=5
  
  " Functions - Keep default color
  autocmd Syntax * hi Function cterm=bold

  " Comments - BOLD
  autocmd Syntax * hi Comment cterm=bold

  " Preprocessor - Keep default
  autocmd Syntax * hi PreProc cterm=bold
augroup END

" Status Line
set laststatus=2

hi User1 cterm=bold ctermfg=green ctermbg=black
hi User2 cterm=bold ctermfg=yellow ctermbg=black
hi User3 cterm=bold ctermfg=red ctermbg=black
hi User4 cterm=bold ctermfg=blue ctermbg=black
hi User5 cterm=bold ctermfg=white ctermbg=black

set statusline=
set statusline +=%1*\ %n\ %*
set statusline +=%5*%{&ff}%*
set statusline +=%3*%y%*
set statusline +=%4*\ %<%F%*
set statusline +=%2*%m%*
set statusline +=%1*%=%5l%*
set statusline +=%2*/%L%*
set statusline +=%1*%4v\ %*
set statusline +=%5*\ %{strftime('%d/%m')}\ %*
set statusline +=%5*%{strftime('%H:%M:%S')}\ %*

if has('autocmd')
  augroup statusline_update
    autocmd!
    autocmd CursorHold,CursorHoldI * redrawstatus
  augroup END
  set updatetime=1000
endif

let loaded_matchparen = 1
filetype plugin on
