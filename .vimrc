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

" FZF Plugin (make sure that FZF is installed on the system)
Plugin 'junegunn/fzf.vim'
" If installed using git
set rtp+=~/.fzf


" For python development
Plugin 'nvie/vim-flake8'

" For Rust development
Plugin 'rust-lang/rust.vim'
let g:autofmt_autosave = 1


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

" Press [F5] to execute cargo run
imap <F5> <Esc>:w<CR>:!clear;cargo run<CR>


"Themes
Plugin 'AlessandroYorba/Alduin'
Plugin 'joshdick/onedark.vim'
" colorscheme alduin

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on
colorscheme onedark


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

" NerdTree settings
let NERDTreeShowHidden=1

set undofile
