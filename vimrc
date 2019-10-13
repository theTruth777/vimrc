set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

call vundle#end()            " required
filetype plugin indent on    " required

" custom plugins for file explorer, autocomplete etc.
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'Townk/vim-autoclose'


" For python development
Plugin 'nvie/vim-flake8'


" For cpp development
Plugin 'xavierd/clang_complete'
" path to directory where library can be found
let g:clang_library_path='/usr/lib/llvm-6.0/lib/'
" path directly to the library file
let g:clang_library_path='/usr/lib/llvm-6.0/lib/libclang.so.1'

" enable lines and mark active line
set nu
set laststatus=2
set cursorline


" Set the encoding
set encoding=utf-8


" configure expanding of tabs for various file types
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.c set noexpandtab
au BufRead,BufNewFile *.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab

set expandtab           " enter spaces when tab is pressed
set textwidth=120       " break lines when line length increases
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line


" make backspaces more powerfull
set backspace=indent,eol,start


" Press [F5] to execute current python script
imap <F5> <Esc>:w<CR>:!clear;python3 %<CR>


"Themes
Plugin 'AlessandroYorba/Alduin'
colorscheme alduin


" Various settings
set nobackup
set noswapfile
set history=1000
set undolevels=10000
set wrap
set mouse=a


" Make Sure that Vim returns to the same line when we reopen a file
augroup line_return
    au!
    au BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \ execute 'normal! g`"zvzz' |
                \ endif
augroup END

" For better git integration
Plugin 'airblade/vim-gitgutter'
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
let g:gitgutter_override_sign_column_highlight = 1
highlight SignColumn guibg=bg
highlight SignColumn ctermbg=bg

set updatetime=250



