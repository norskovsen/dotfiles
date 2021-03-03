" Standard ML syntax highlighting

if exists('b:current_syntax')
  finish
endif

let b:current_syntax = 'sml'

setlocal iskeyword=a-z,A-Z,48-57,_,'

"
" reserved words {{{
"
syn keyword smlCond if then else case of
hi def link smlCond Keyword

syn keyword smlRepeat while do
hi def link smlRepeat Keyword

syn keyword smlRaise raise handle
hi def link smlRaise Keyword

syn keyword smlBoolOp andalso orelse
hi def link smlBoolOp Keyword

syn keyword smlDecl and datatype exception fun in infix infixr import
syn keyword smlDecl nonfix rec type val withtype
hi def link smlDecl Structure

syn keyword smlBlock local let in end struct sig abstype with
hi def link smlBlock Structure

syn keyword smlExpr fn op
hi def link smlExpr Keyword
syn keyword smlPat as
hi def link smlPat smlExpr

syn keyword smlWild _
hi def link smlWild Special
" }}}

" operators
syn match smlOperator "[!%&$#+-/:<=>?@\~`^|*]\+"
syn keyword smlOperator mod div o before
hi def link smlOperator Operator

"
" brackets and other punctuation {{{
"
syn match smlPunc ",\|:\|;\|\.\.\."
syn match smlPunc
  \ "[!%&$#+-/:<=>?@\~`^|*]\@<!\(|\|=\|=>\|->\|\)[!%&$#+-/:<=>?@\~`^|*]\@!"
hi def link smlPunc Delimiter
" }}}

"
" builtin names
"
syn keyword smlCon true false nil ref
syn match smlCon '[!%&$#+\-/:<=>?@\\~`^|*]\@<!::[!%&$#+\-/:<=>?@\\~`^|*]\@!'
hi def link smlCon Constant


"
" special constants [i.e., literals]
"
syn match smlInt "\~\?\<\(\d\+\|0x\x\+\)\>"
hi def link smlInt Number

syn match smlWord "\<0w\(\d\+\|x\x\+\)\>"
hi def link smlWord Number

syn match smlReal "\~\?\<\d\+\(\.\d\+\)\?\([eE]\d\+\)\?\>"
hi def link smlReal Float

syn region smlChar start=+#"+ end=+"+ skip=+\\"+ contains=smlCharEsc,smlCharEscErr
hi def link smlChar Character
syn match  smlCharEscErr '\\' contained
hi def link smlCharEscErr SpellBad
syn match  smlCharEsc '\\[abtnvfr]' contained
syn match  smlCharEsc '\\\^[@-_]' contained
syn match  smlCharEsc '\\\d\d\d' contained
syn match  smlCharEsc '\\u\x\x\x\x' contained
syn match  smlCharEsc '\\"' contained
syn match  smlCharEsc '\\\\' contained
hi def link smlCharEsc SpecialChar

syn region smlString start=+"+ end=+"+ skip=+\\"+ contains=smlCharEsc,smlCharEscErr,smlStrGap
hi def link smlString String
syn match  smlStrGap  '\\\_s\+\\' contained
hi def link smlStrGap SpecialChar
" }}}

"
" comments {{{
"
syn match smlCommentErr "\*)"
hi def link smlCommentErr SpellBad

syn region smlComment start="(\*" end="\*)" contains=smlComment,smlTodo
hi def link smlComment Comment

syn keyword smlTodo TODO XXX FIXME contained
hi def link smlTodo Todo
" TODO mldoc markup etc
" }}}

"
" identifiers {{{
"
syn match smlStrid "\(\a\k*\|[!%&$#+\-/:<=>?@\\~`^|*]\+\)\.\@="
hi def link smlStrid Include

syn match smlStridBare "\(sig\|struct\)\@!\&\(\a\k*\|[!%&$#+\-/:<=>?@\\~`^|*]\+\)" contained
  \ nextgroup=smlStridBareDot,smlModPunc,smlFunctApp skipwhite skipempty
syn match smlStridBareDot "\." nextgroup=smlStridBare contained
hi def link smlStridBareDot smlDelim
hi def link smlStridBare smlStrid

syn match smlStridBareMany "\a\k*\|[!%&$#+\-/:<=>?@\\~`^|*]\+" contained
  \ nextgroup=smlStridBareManyDot,smlStridBareMany skipwhite
syn match smlStridBareManyDot "\." nextgroup=smlStridBareMany contained
hi def link smlStridBareMany smlStridBare

syn match smlRecordField "\(\a\k*\|[1-9]\d*\)\(\s*[:=]\)\@=" contained containedin=smlRecord
syn match smlRecordField "\([{,]\s*\)\@<=\(\a\k*\)[,}]\@=" contained containedin=smlRecord
hi def link smlRecordField Identifier

syn match smlLabel "#\(\a\k*\|[1-9]\d*\)"
hi def link smlLabel Constant

syn match smlTyvar "\<'\+\a\k*"
hi def link smlTyvar Identifier
" }}}

"
" modules {{{
"
syn keyword smlDecl eqtype sharing where
syn keyword smlDecl signature structure include nextgroup=smlStridBare
  \ skipwhite skipempty
syn keyword smlDecl open nextgroup=smlStridBareMany skipwhite skipempty

syn keyword smlDecl functor nextgroup=smlFunctid skipwhite skipempty
syn match smlFunctid "\a\k*\|[!%&$#+\-/:<=>?@\\~`^|*]\+" contained
  \ nextgroup=smlFunctArg skipwhite skipempty
hi def link smlFunctid smlStrid
syn region smlFunctArg matchgroup=smlDelim start="(" end=")" contains=smlFunctArgSimple,smlDecl contained nextgroup=smlFunctArg,smlModPunc skipwhite skipnl skipempty
syn match smlFunctArgSimple
  \ "\((\s*\)\@<=\a\k*\|[!%&$#+\-/:<=>?@\\~`^|*]\+\(\s*:\)\@=" contained
  \ nextgroup=smlModPunc
hi def link smlFunctArgSimple smlStrid

syn region smlFunctApp matchgroup=smlDelim start="(\*\@!" end="\*\@<!)" contains=smlFunctAppSimple,smlFunctApp transparent contained
syn match smlFunctAppSimple
  \ "\((\s*\)\@<=\(struct\|sig\)\@!\&\(\a\k*\|[!%&$#+\-/:<=>?@\\~`^|*]\+\)\(\s*)\)\@="
  \ contained
hi def link smlFunctAppSimple smlStrid

syn match smlModPunc "[!%&$#+\-/:<=>?@\\~`^|*]\@<!\(:\|=\|:>\)[!%&$#+\-/:<=>?@\\~`^|*]\@!"
  \ nextgroup=smlStridBare skipwhite skipempty contained
hi def link smlModPunc smlPunc

syn region smlParen matchgroup=smlDelim start='(\*\@!' end='\*\@<!)' transparent
syn region smlList matchgroup=smlDelim start='\[' end=']' transparent
syn region smlRecord matchgroup=smlDelim start='{' end='}' transparent
hi def link smlDelim Delimiter

syn match smlDot "\."
hi def link smlDot smlDelim


" vim: set fdm=marker:
"
syn keyword smlStandardFunc attenuate authority declassify lowermbox mkuuid pinipop pinipush print printWithLabels sandbox self send _setProcessDebuggingName sleep spawn raisedTo raiseTrust raisembox readInput receive register rcv whereis
hi def link smlStandardFunc Function
