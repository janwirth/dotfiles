hook global WinCreate .* %{addhl number_lines}
hook global WinCreate .* %{addhl show_whitespaces}


hook global WinCreate .* %{set global indentwidth 2}
hook global WinCreate .* %{set global tabstop 2}
hook global WinCreate .* %{hook window InsertChar \t %{ exec -draft h@}}

hook global InsertChar \( 'exec )<left>'
hook global InsertChar \{ 'exec }<left>'
hook global InsertChar \[ 'exec ]<left>'
hook global InsertChar \< 'exec ><left>'
hook global InsertChar ' "exec '<left>"


hook global WinCreate .* %{ addhl show_matching }

hook global NormalKey y|d|c %{ nop %sh{
  printf %s "$kak_reg_dquote" | pbcopy
}}

hook global BufCreate .* %{editorconfig-load}
hook global BufCreate .vue %{ set buffer filetype xml }
hook global BufCreate .*.elm %{ set buffer filetype haskell }
hook global BufCreate .*.purs %{ set buffer filetype haskell }
hook global BufCreate .*.(es6|tsx?) %{ set buffer filetype javascript }
