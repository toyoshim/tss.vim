"
" T'SoundSystem - syntax
"
syntax match Directive '^\#CHANNEL[ \t]\+[1-9][0-9]*' contains=DirectiveNumber
syntax match Directive '^\#END'
syntax match Directive '^\#FINENESS[ \t]\+[1-9][0-9]*' contains=DirectiveNumber
syntax match Directive '^\#OCTAVE[ \t]\+\(NORMAL\|REVERSE\)' contains=DirectiveSwitch
syntax match Directive '^\#TABLE[ \t]\+[0-9]\+,<\_[^>]*>' contains=DirectiveTable
syntax match Directive '^\#TITLE[ \t]\+<.*>' contains=DirectiveString
syntax match Directive '^\#VOLUME[ \t]\+\(NORMAL\|REVERSE\)' contains=DirectiveSwitch
syntax match Directive '^\#WAV[ \t]\+[0-9]\+,<\_[^>]*>' contains=DirectiveTable

syntax match DirectiveNumber contained '[1-9][0-9]*'
syntax match DirectiveString contained '<.*>' contains=DirectiveTitle
syntax match DirectiveSwitch contained '\(NORMAL\|REVERSE\)'
syntax match DirectiveTable contained '[0-9]\+,<\_[^>]*>' contains=DirectiveTableEntry
syntax match DirectiveTableEntry contained '<\_[^>]*>' contains=DirectiveTableItem
syntax match DirectiveTableItem contained '\(\(0\|-\?[1-9][0-9]*\)\|(\(0\|-\?[1-9][0-9]*\),\(0\|-\?[1-9][0-9]*\)),[1-9][0-9]*\)'
syntax match DirectiveTitle contained '[^<].*[^>]'

syntax match Channel '^#[A-Z]\{1,2}[ \t]\+\_[^#]\+' contains=ChannelData

syntax match ChannelData contained '[ \t]\+\_[^#]\+' contains=Comment,MML,Repeat,Note,Space

syntax match Comment '{\_[^}]*}'

syntax match Repeat ':\?/:\?'
syntax match Repeat '/:[1-9][0-9]*'
syntax match Repeat '\[\([1-9][0-9]*\)\?'
syntax match Repeat '\]'
syntax match Repeat '\$'

syntax match MML '[<>]'
syntax match MML 'o[0-9]\+'

syntax match MML '[~_]'
syntax match MML 'v[0-9]\+'

syntax match MML 't[1-9][0-9]*'
syntax match MML '[@,%,l,q,p][0-9]\+'
syntax match MML '@v[0-9]\+'
syntax match MML 'k-\?[0-9]\+'
syntax match MML 'x[0-9]\+,[0-9]\+'
syntax match MML 's[0-9]*\(,\(0\|-\?[1-9][0-9]*\)\)\?'
syntax match MML 'mp[0-9]\+,[0-9]\+,[0-9]\+,[0-9]\+'
syntax match MML 'n[a,t][0-9]\+,[0-9]\+'

syntax match Note '[a-g,r][#,+,-]\?[1-9]\?[0-9]*\.*^\?[1-9]\?[0-9]*\.*'

syntax match Space contained '[ \t]\+'

highlight link Channel Identifier
highlight link Comment Comment
highlight link Directive Special

highlight link DirectiveNumber Statement
highlight link DirectiveSwitch Statement
highlight link DirectiveTable Identifier
highlight link DirectiveTableItem Statement
highlight link DirectiveTitle Statement

highlight link ChannelData Underlined
highlight link Repeat PreProc
highlight link MML Special
