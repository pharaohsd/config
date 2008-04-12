set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "twilight256"

if version >= 700
  hi CursorLine ctermbg=234
  hi CursorColumn ctermbg=234
  hi MatchParen ctermfg=white ctermbg=244 cterm=bold

  "Tabpages
  hi TabLine ctermfg=black ctermbg=249 
  hi TabLineFill ctermfg=246
  hi TabLineSel ctermfg=black ctermbg=254 cterm=bold

  "P-Menu (auto-completion)
  hi Pmenu ctermfg=white ctermbg=244
endif

hi Cursor ctermfg=NONE ctermbg=240

hi Normal ctermfg=255 ctermbg=233
hi LineNr ctermfg=244 ctermbg=233 

hi StatusLine ctermfg=254 ctermbg=239 
hi StatusLineNC ctermfg=251 ctermbg=60
hi VertSplit ctermfg=60 ctermbg=234 
hi Folded ctermbg=237 ctermfg=247

hi Comment ctermfg=241
hi Todo ctermfg=244 ctermbg=NONE cterm=bold

hi Constant ctermfg=202
hi String ctermfg=193

hi Identifier ctermfg=69
" Type
hi Structure ctermfg=139
hi Function ctermfg=185
" dylan: method, library, ...
hi Statement ctermfg=228 cterm=NONE
" Keywords
hi PreProc ctermfg=228

hi NonText ctermfg=244 ctermbg=236

"Tabs, trailing spaces, etc (lcs)
hi SpecialKey ctermfg=244 ctermbg=236
