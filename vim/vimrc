" custom (g)vim settings

" basics
set t_Co=256            " set 256 colors (needs 256 color terminal)
set nocompatible        " use gVim defaults
set mouse=a             " make sure mouse is used in all cases.
map <F12> :browse confirm e<CR>

"colorscheme calmar256  " define syntax color scheme
colorscheme vividchalk " define syntax color scheme
"colorscheme zenburn    " define syntax color scheme
"colorscheme navajo-night " (codemac scheme, needs 16colors)
"colorscheme gardener
"colorscheme darktango

" tabs and indenting
set expandtab           " insert spaces instead of tab chars
set tabstop=2           " a n-space tab width
set shiftwidth=2        " allows the use of < and > for VISUAL indenting
set softtabstop=2       " counts n spaces when DELETE or BCKSPCE is used
set autoindent          " auto indents next new line
set nosmartindent       " intelligent indenting -- DEPRECATED by cindent
set nocindent           " set C style indenting off, I don't write C!

" searching
set hlsearch            " highlight all search results
set incsearch           " increment search
set ignorecase          " case-insensitive search
set smartcase           " upper-case sensitive search

" Add timestamp to rc files
fun! <SID>UpdateRcHeader()
    let l:c=col(".")
    let l:l=line(".")
    1,10s-\(Most recent update:\).*-\="Most recent update: ".strftime("%c")-
    call cursor(l:l, l:c)
endfun

" Set up the status line
fun! <SID>SetStatusLine()
    let l:s1="%-3.3n\\ %f\\ %h%m%r%w"
    let l:s2="[%{strlen(&filetype)?&filetype:'?'},%{&encoding},%{&fileformat}]"
    let l:s3="%=\\ 0x%-8B\\ \\ %-14.(%l,%c%V%)\\ %<%P"
    execute "set statusline=" . l:s1 . l:s2 . l:s3
endfun

" Setup a funky statusline
set laststatus=2
call <SID>SetStatusLine()

" Vim7 only settings
if v:version >= 700
    try
        setlocal numberwidth=3
    catch
    endtry
	set cursorline
	" Set special characters
	set listchars+=tab:»·,trail:·,extends:~,nbsp:.
endif

" Encoding
if ($TERM == "rxvt-unicode") && (&termencoding == "")
    set termencoding=utf-8
endif
set encoding=utf-8


set backspace=2         " full backspacing capabilities
set history=100         " 100 lines of command line history
set cmdheight=1         " command line height
set laststatus=2        " occasions to show status line, 2=always.
set ruler               " ruler display in status line
set showmode            " show mode at bottom of screen
set number              " show line numbers
set nobackup            " disable backup files (filename~)
set showmatch           " show matching brackets (),{},[]
set ww=<,>,[,]          " whichwrap -- left/right keys can traverse up/down
set showcmd
set modeline
set wildmenu

" syntax highlighting
syntax on               " enable syntax highlighting

" highlight redundant whitespaces and tabs.
"highlight RedundantSpaces ctermbg=red guibg=red
"match RedundantSpaces /\s\+$\| \+\ze\t\|\t/

" gvim settings
if has("gui_running")
  set guioptions-=r
  set guioptions-=m" Disable menu bar
  set guioptions-=T" Disable toolbar icons
  "set guifont=DejaVu\ Sans\ Mono\ 8 " backslash spaces (e.g. Bitstream\ Vera\ Sans\ 8)
  "set guifont=Dina\ 8
  set guifont=Terminus\ 8
  "set guifont=smoothansi 
endif

" common save shortcuts
inoremap <C-s> <esc>:w<cr>a
nnoremap <C-s> :w<cr>

" enter ex mode with semi-colon
nnoremap ; :
vnoremap ; :

" mutt rules
au BufRead /tmp/mutt-* set tw=72 spell

" drupal rules
if has("autocmd")
	  " Drupal *.module files.
	  augroup module
	    autocmd BufRead *.module set filetype=php
	  augroup END
endif

" mangels cool block quoting function
function! VBlockquote(...) range
    " put `| ' at beginning of line
    exe a:firstline.",".a:lastline."s/^/| /"
    " remove trailing whitespaces
    exe a:firstline.",".a:lastline.'s/^| $/|/e'
    " generate tail
    exe a:lastline."put ='`----'"
    " set mark
    normal m'
    " generate title
    let @z = ',----'
    if (a:0 != 0)
        " -> extra argument a:1
        let @z = @z."[ ".a:1." ]"
    endif
    exe a:firstline."put! z"
    " jump back to mark
    normal ''
endfunction

vmap bq :call VBlockquote("

" Set taglist plugin options
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Compact_Format = 1
let Tlist_File_Fold_Auto_Close = 0
let Tlist_Inc_Winwidth = 1

" Set bracket matching and comment formats
set matchpairs+=<:>
set comments-=s1:/*,mb:*,ex:*/
set comments+=s:/*,mb:**,ex:*/
set comments+=fb:*
set comments+=b:\"
set comments+=n::

" Basic abbreviations
iab teh the
iab DATE <C-R>=strftime("%B %d, %Y (%A, %H:%M)")<CR>

" Fix filetype detection
au BufNewFile,BufRead .torsmorc* set filetype=rc
au BufNewFile,BufRead *.inc set filetype=php
au BufNewFile,BufRead *.sys set filetype=php
au BufNewFile,BufRead grub.conf set filetype=grub
au BufNewFile,BufRead *.dentry set filetype=dentry
au BufNewFile,BufRead *.blog set filetype=blog

" C file specific options
au FileType c,cpp set cindent
au FileType c,cpp set formatoptions+=ro

" HTML abbreviations
au FileType html,xhtml,php,eruby imap bbb <br />
au FileType html,xhtml,php,eruby imap aaa <a href=""><left><left>
au FileType html,xhtml,php,eruby imap iii <img src="" /><left><left><left><left>
au FileType html,xhtml,php,eruby imap ddd <div class=""><left><left>

" Compile and run keymappings
au FileType c,cpp map <F5> :!./%:r<CR>
au FileType java map <F5> :make %<CR>
au FileType sh,php,perl,python,ruby map <F5> :!./%<CR>
au FileType java map <F6> :java %:r
au FileType c,cpp map <F6> :make<CR>
au FileType php map <F6> :!php &<CR>
au FileType python map <F6> :!python %<CR>
au FileType perl map <F6> :!perl %<CR>
au FileType ruby map <F6> :!ruby %<CR>
au FileType html,xhtml map <F5> :!firefox3 %<CR>
au FileType ruby setlocal sts=2 sw=2				" Enable width of 2 for ruby tabbing

" MS Word document reading
au BufReadPre *.doc set ro
au BufReadPre *.doc set hlsearch!
au BufReadPost *.doc %!antiword "%"

" Toggle dark/light default colour theme for shitty terms
map <F2> :let &background = ( &background == "dark" ? "light" : "dark" )<CR>

" Toggle taglist script
map <F7> :Tlist<CR>

" Cursor keys suck. Use ctrl with home keys to move in insert mode.
imap <C-h> <Left>
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-l> <Right>

" Do Toggle Commentify
map <M-c> :call ToggleCommentify()<CR>j
imap <M-c> <ESC>:call ToggleCommentify()<CR>j

set makeprg=jikes\ %
"set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
set errorformat=%f:%l:%c:%*\d:%*\d:%*\s%m
