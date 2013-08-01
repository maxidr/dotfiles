set nocompatible

runtime autoload/vim-pathogen/autoload/pathogen.vim

call pathogen#infect()
call pathogen#helptags()

"" allow backspacing over everything in insert mode
set backspace=indent,eol,start
"
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set number " show line numbers
set noswapfile
"
"" set filetype check on
:filetype plugin indent on
syntax on
set t_Co=256 " 256 colors
set background=dark 
"colorscheme ir_black
"colorscheme herald
colorscheme vividchalk

"set hlsearch
"
"" enable spell check
" :set spell
"" enable mouse
":set mouse=a
"
"" set search ignorecase 
:set ignorecase
"
:set sessionoptions+=unix,slash
"
"" encodings configure
:set fileencoding=utf-8
:set encoding=utf-8
:set fileencodings=ucs-bom,utf-8,gb2312,cp936
"
"" set tabstop value and shift width 
:set ts=2
:set sw=2
:set expandtab
"
""setting about indent
:set autoindent
:set smartindent
"
""setting about old window resizing behavior when open a new window
:set winfixheight
"" not let all windows keep the same height/width
:set noequalalways

:nmap ,o o<Esc>

"" Set leader as comma instead \ 
let mapleader = ","

" Use ctrl+t and arrows to move inner tabs
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>

" List buffers
nnoremap <Leader>l :ls<CR>
" Go to next buffer
"nnoremap <Leader>b :bp<CR>
" Go to previous buffer
"nnoremap <Leader>f :bn<CR>
" Go to last used buffer
nnoremap <Leader>g :e#<CR>
" Go to buffer 1/2/3 etc
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

"Git branch
"function! GitBranch()
"  let branch = system("git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* //'")
"  if branch != ''
"    return '   Branch: ' . substitute(branch, '\n', '', 'g')
"  en
"  return ''
"endfunction

" It's useful to show the buffer number in the status line.
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
"set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P\ %{GitBranch()}

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*   " for Linux/MacOSX
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'

" Functions to run spin from VIM :D
" Thanks to http://renderedtext.com/blog/2011/10/05/streamlining-vim-with-rspec-and-cucumber/
function! RailsScriptIfExists(name)
  " Bundle exec
  if isdirectory(".bundle") || (exists("b:rails_root") && isdirectory(b:rails_root . "/.bundle"))
    return "bundle exec " . a:name
  " System Binary
  else
    return a:name
  end
endfunction

function! RunSpinPush(args)
  let spec = RailsScriptIfExists("spin push")
  let cmd = spec . " " . a:args . " " . @%
  execute ":silent ! echo " . cmd . " && " . cmd . " &>/dev/null &" | redraw!
endfunction

map <Leader>s :call RunSpinPush("")<CR>

function! RunZeusTestFile(args)
  let cmd = "zeus test " . a:args . " " . @%
  call VimuxRunCommand(cmd)
endfunction

map <Leader>t :call RunZeusTestFile("")<CR>
map <Leader>tl :call RunZeusTestFile(":" . line('.'))<CR>


" Map ctrl+b for see buffer list
map <C-b> :CtrlPBuffer<CR>
map <Leader>b :CtrlPBuffer<CR>

" NERDTree ---------------------------------------------------------
" from: https://github.com/scrooloose/nerdtree
" More help: http://www.catonmat.net/blog/vim-plugins-nerdtree-vim/
" ------------------------------------------------------------------
" F2 to open/close NerdTree
map <F2> :NERDTreeToggle<CR>
" Press o to open the file in a new buffer or open/close directory.
" Press t to open the file in a new tab.
" Press i to open the file in a new horizontal split.
" Press s to open the file in a new vertical split.
" Press p to go to parent directory.
" Press r to refresh the current directory.

au BufRead,BufNewFile *.hamlc set ft=haml

set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
let g:Powerline_symbols = 'fancy'

autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby let g:rubycomplete_buffer_loading=1
autocmd FileType ruby let g:rubycomplete_rails=1
autocmd FileType ruby let g:rubycomplete_classes_in_global=1

autocmd FileType html,eruby let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,eruby source ~/.vim/bundle/closetag.vim/plugin/closetag.vim

map <Leader>cp "+p<CR>
map <C-p> "+p<CR>

" Autocomplete ZEN with Ctrl + t
let g:user_zen_expandabbr_key='<C-t>'
