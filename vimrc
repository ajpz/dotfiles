execute pathogen#infect()
set rtp+=/usr/local/opt/fzf

let mapleader = ","

map <Leader>h         :call RunCurrentSpecFile()<CR>  " RSpec.vim mappings
map <Leader>s         :call RunNearestSpec()<CR>
map <Leader>l         :call RunLastSpec()<CR>
map <Leader>a         :call RunAllSpecs()<CR>
map \                 :NERDTreeToggle<CR>             " NERDTree mappings
map \|                :NERDTreeFind<CR>
map <Leader>/         <plug>NERDCommenterToggle
map <leader>c :let @* = expand("%")<CR>:echo "Copied: ".expand("%")<CR>
map <leader>C :let @* = expand("%").":".line(".")<CR>:echo "Copied: ".expand("%").":".line(".")<CR>

let NERDSpaceDelims = 1

nnoremap <leader>sv             :source $MYVIMRC<cr>  " Resource .vimrc
nnoremap <silent> <leader>ev    :tabe $MYVIMRC<cr>    " Edit .vimrc in new tab
nnoremap <leader>t              :FZF<cr>
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>"" " Clear search highlighting
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

set timeoutlen=1000 ttimeoutlen=5
set noesckeys

cabbrev W w                             " alias W to w
cabbrev Q q                             " alias Q to q
cabbrev Wq wq                           " alias Wq to wq
cabbrev bu buffer                       " alias bu to buffer

filetype on                             " Enable filetype detection
filetype indent on                      " Enable filetype-specific indenting
filetype plugin on                      " Enable filetype-specific plugins

set vb                                  " Silence audio notifications
set expandtab                           " Use soft tabs
set tabstop=2                           " Tab settings
set autoindent                          " Basic autoindent
set smartindent                         " Addtl smartindent
set shiftwidth=2                        " Width of autoindent
set number                              " Line numbers
set hls                                 " Search with highlights by default
set history=1024                        " History size
set incsearch                           " Incremental search
set ignorecase                          " Search ignores cahse
set smartcase                           " Search with smart case-sensitivity
set nowrap                              " No wrapping
set backspace=indent,eol,start          " Let backspace work over anything.
set cursorline                          " Highlight current line
set nocompatible                        " Cursor in insert

set list                                " Show whitespace
set listchars=trail:·                   " Set whitespace char

set notimeout                           " No command timeout
set mouse=a                             " Use mouse support in XTerm/iTerm.
set showcmd                             " Show typed command prefixes while waiting for operator
set showmatch                           " Show matching brackets
set hidden                              " Allow hidden, unsaved buffers
set splitright                          " Add new windows towards the right
set splitbelow                          " ... and bottom
set wildmode=list:longest               " Bash-like tab completion
set scrolloff=3                         " Scroll when the cursor is 3 lines from edge
set laststatus=2                        " Always show statusline
set encoding=utf-8                      " Necessary to show unicode glyphs
set autoread                            " No prompt for file changes outside Vim

set swapfile                            " Keep swapfiles
set directory=~/.vim-tmp,~/tmp,/var/tmp,/tmp
set backupdir=~/.vim-tmp,~/tmp,/var/tmp,/tmp

set updatetime=100                      " Gitgutter updates in 100ms, not 4s

set autowriteall                        " Save when doing various buffer-switching things.
autocmd BufLeave,FocusLost * silent! wall

autocmd FileType javascript let b:surround_36 = "$(\r)"
                        \ | let b:surround_95 = "_(\r)"

set guifont=Menlo\ for\ Powerline:h16
set guioptions-=T                  " Remove GUI toolbar
set guioptions-=e                  " Use text tab bar, not GUI
set guioptions-=rL                 " Remove scrollbars
set guicursor=a:blinkon0           " Turn off the blinking cursor

syntax enable

set background=dark
let g:solarized_termcolors = 256
colorscheme solarized

let &t_SI.="\e[5 q"                     " Change cursor when changing mode
let &t_SR.="\e[4 q"
let &t_EI.="\e[1 q"

if has("clipboard")                     " Use system clipboard instead vim buffer
  set clipboard=unnamed
endif

" Display all open buffers as tabs when there's only one tab open
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='base16'

" Use ag via ack.vim
let g:ackprg = 'ag --nogroup --nocolor --column'

runtime macros/matchit.vim              " Expand % toggling to if/else etc

function! StripTrailingWhitespace()
  let save_cursor = getpos(".")
  %s/\s\+$//e
  call setpos('.', save_cursor)
endfunction

autocmd BufRead,BufNewFile *.json set filetype=javascript
autocmd BufWritePre *.* call StripTrailingWhitespace()

let g:ale_linters = {
\   'html': ['htmlhint'],
\   'javascript': ['eslint'],
\   'ruby': ['rubocop'],
\   'scss': ['stylelint']
\}

" Optional: To lint on save only:
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

" Optional: To turn off highlighting, set to 0:
let g:ale_set_highlights = 1

" Turn on auto-fix on save for some issues:
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'ruby': ['rubocop']
\}
let g:ale_fix_on_save = 1

let g:rspec_runner = "os_x_iterm"
let g:rspec_command = "!bundle exec rspec {spec}"
