" Documentation: https://epics.anl.gov/EpicsDocumentation/ExtensionsManuals/msi/msi.html

if exists("b:current_syntax")
    finish
endif

syntax match msiComment /#.*/ contains=msiTodo
syntax keyword msiTodo TODO FIXME XXX contained

syntax cluster msiMacro contains=msiParenMacro,msiBraceMacro
syntax region msiParenMacro matchgroup=msiMacroDelimiter start=/$(/ end=/)/ contains=msiVariableWithDefault,msiVariable contained
syntax region msiBraceMacro matchgroup=msiMacroDelimiter start=/${/ end=/}/ contains=msiVariableWithDefault,msiVariable contained
syntax match msiVariable /\I\i*/ contained
syntax match msiVariableWithDefault /\I\i*/ nextgroup=msiVariableWithDefaultOpr skipwhite contained
syntax match msiVariableWithDefaultOpr /=/ nextgroup=@msiValue skipwhite contained

syntax match msiRawValue /\i\+/ contained
syntax region msiQuotedValue start=/"/ skip=/\\"/ end=/"/ contains=msiQuotedSpecial,@msiMacro contained
syntax match msiQuotedSpecial /\\"/ contained
syntax match msiQuotedSpecial /\\\\/ contained

syntax cluster msiValue contains=@msiMacro,msiQuotedValue,msiRawValue

syntax region msiRegular start="{" end="}" contains=msiSubstitutionVar,msiComment contained

syntax match msiSubstitutionVar /\I\i*/ nextgroup=msiSubstitutionOpr skipwhite skipempty contained
syntax match msiSubstitutionOpr "=" nextgroup=msiQuotedValue,@msiValue skipwhite skipempty contained

syntax keyword msiPattern pattern nextgroup=msiCommentBeforePatternBlock,msiPatternBlock skipwhite skipempty
syntax region msiPatternBlock start="{" end="}" contains=msiPatternVar,msiComment nextgroup=msiCommentInPatternInstance,msiPatternInstance skipwhite skipempty contained
syntax match msiPatternVar /\I\i*/ contained
syntax region msiPatternInstance start="{" end="}" contains=msiQuotedValue,@msiValue,msiComment nextgroup=msiCommentInPatternInstance,msiPatternInstance skipwhite skipempty contained

syntax match msiCommentBeforePatternBlock /#.*/ contains=msiTodo nextgroup=msiCommentBeforePatternBlock,msiPatternBlock skipwhite skipempty contained
syntax match msiCommentInPatternInstance /#.*/ contains=msiTodo nextgroup=msiCommentInPatternInstance,msiPatternInstance skipwhite skipempty contained

syntax keyword msiFile file nextgroup=msiFileTarget,msiQuotedValue skipwhite skipempty
syntax match msiFileTarget /\S\+/ nextgroup=msiFileBlock skipwhite skipempty contained
syntax region msiFileBlock matchgroup=msiFileBlockBraces start="{" end="}" contains=msiPattern,msiRegular,msiComment fold contained

highlight default link msiComment Comment
highlight default link msiCommentBeforePatternBlock msiComment
highlight default link msiCommentInPatternInstance msiComment
highlight default link msiTodo Todo

highlight default link msiMacroDelimiter Delimiter
highlight default link msiVariable Identifier
highlight default link msiVariableWithDefault Identifier
highlight default link msiVariableWithDefaultOpr Operator

highlight default link msiRawValue String
highlight default link msiQuotedValue String
highlight default link msiQuotedSpecial Special

highlight default link msiSubstitutionVar Identifier
highlight default link msiSubstitutionOpr Operator

highlight default link msiPattern Keyword
highlight default link msiPatternVar Identifier

highlight default link msiFile Keyword
highlight default link msiFileTarget String
