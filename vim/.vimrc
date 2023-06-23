filetype on
filetype plugin on
filetype plugin indent on
syntax on

set wildignore=*.o,*~,*/.git/*,*/.DS_Store
set wildignore+=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.flv,*.img,*.xlsx

" THEME {{{

set termguicolors
"set t_Co=256
set encoding=utf8

try
	colorscheme gruvbox
catch
endtry

set background=dark
let &t_ut='' "fixes background issue
hi Normal guibg=NONE ctermbg=NONE "remove background for transparency
hi EndOfBuffer guibg=NONE ctermbg=NONE
hi NonText ctermbg=NONE guibg=NONE

" }}}

" STATUS LINE {{{

set laststatus=2
set statusline=\ %F\ %M\ %Y\ %R
set statusline+=%=
set statusline+=\ %3b\ 0x%2B
set statusline+=%=
set statusline+=\ pos:\ %-4l\ %-4c\ %3p%%

" }}}

" VIMSCRIPT {{{

augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END

set nobackup
set nowb
set noswapfile

set ruler
set cmdheight=1

set tabstop=4
set shiftwidth=4
set autoindent

set showmatch
set ignorecase
set smartcase
set hlsearch
set incsearch

set showcmd
set nocompatible
set hidden
set mouse=a
set number
set numberwidth=5
set wildmenu
set colorcolumn=81
set scrolloff=8
set cursorline
set ttyfast
set listchars=nbsp:█,space:·,tab:•-,extends:»,precedes:«,trail:*
set list

set history=200

" }}}
