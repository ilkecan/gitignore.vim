if exists('b:current_syntax')
  finish
endif

" SYNTAX
" pattern
syntax match gitignoreBrackets '[[\]]'
  \ contained
syntax match gitignoreDirSeparator '/'
  \ contained
syntax match gitignoreEscapedCharacter '\\.'
  \ contained
syntax region gitignoreGroup matchgroup=gitignoreBrackets start="\[" skip="\\\]" end="\]"
  \ oneline
  \ contained
  \ contains=
    \ gitignoreRange,
syntax match gitignorePattern '^\s*\zs!\?\%(\\.\|[^\\]\)\+\ze\s*$'
  \ nextgroup=gitignorePrefix
  \ contains=
    \ gitignoreDirSeparator,
    \ gitignoreEscapedCharacter,
    \ gitignoreGroup,
    \ gitignorePrefix,
    \ gitignoreWildcard,
syntax match gitignorePrefix '\s*\zs\!'
  \ contained
syntax match gitignoreRange '\%(\d-\d\|\a-\a\)'
  \ contained
  \ contains=
    \ gitignoreRangeSeperator,
syntax match gitignoreRangeSeperator '-'
  \ contained
syntax match gitignoreWildcard '[*?]'
  \ contained

" comment
syn match	gitignoreComment	'^\s*#.*$'
  \ contains=gitignoreTodo,@Spell
syn keyword	gitignoreTodo
  \ contained
  \ FIXME
  \ TODO
  \ XXX

" HIGHLIGHT
" pattern
highlight link gitignoreBrackets Delimiter
highlight link gitignoreDirSeparator Delimiter
highlight link gitignoreEscapedCharacter gitignorePattern
highlight link gitignoreGroup Character
highlight link gitignorePattern Constant
highlight link gitignorePrefix SpecialChar
highlight link gitignoreRange Character
highlight link gitignoreRangeSeperator Delimiter
highlight link gitignoreWildcard SpecialChar

" comment
highlight link gitignoreComment Comment
highlight link gitignoreTodo Todo

let b:current_syntax = 'gitignore'
