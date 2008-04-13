" Vim color file
" Name: DarkTango
" Maintainer: Panos Laganakos <panos.laganakos@gmail.com>
" Version: 0.3


set background=dark
if version > 580
	" no guarantees for version 5.8 and below, but this makes it stop
	" complaining
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

let g:colors_name="darktango256"

hi Normal	ctermfg=252

" {{{ syntax
hi Comment	ctermfg=240
hi Title	ctermfg=255
hi Underlined	ctermfg=38 cterm=none
hi Statement	ctermfg=245
hi Type		ctermfg=202
hi PreProc	ctermfg=255 
hi Constant	ctermfg=250
hi Identifier	ctermfg=202 
hi Special	ctermfg=255
hi Ignore	ctermfg=187
hi Todo		ctermbg=202 ctermfg=255
"hi Error
"}}}

" {{{ groups
hi Cursor	ctermbg=250 ctermfg=236
"hi CursorIM
hi Directory	ctermfg=251
"hi DiffAdd
"hi DiffChange
"hi DiffDelete
"hi DiffText
"hi ErrorMsg
hi VertSplit	ctermbg=240 ctermfg=236 cterm=none
hi Folded	ctermbg=240 ctermfg=255
hi FoldColumn	ctermbg=236 ctermfg=240
hi LineNr	ctermfg=240
hi MatchParen	ctermbg=250 ctermfg=236
hi ModeMsg	ctermfg=202
hi MoreMsg	ctermfg=202
hi NonText	ctermbg=236 ctermfg=240
hi Question	ctermfg=249
hi Search	ctermfg=220
hi IncSearch	ctermfg=227
hi SpecialKey	ctermfg=202
hi StatusLine	ctermbg=240 ctermfg=255 cterm=none
hi StatusLineNC	ctermbg=240 ctermfg=235 cterm=none
hi Visual	ctermfg=202 
"hi VisualNOS
hi WarningMsg	ctermfg=209
"hi WildMenu
"hi Menu
"hi Scrollbar  ctermbg=grey30 ctermfg=tan
"hi Tooltip
hi Pmenu	ctermbg=250 ctermfg=240
hi PmenuSel	ctermbg=244 ctermfg=236
hi NonText ctermfg=244 ctermbg=none
"hi CursorLine	ctermbg=235
" }}}

"  {{{ terminal
" TODO
" }}}

"vim: sw=4
