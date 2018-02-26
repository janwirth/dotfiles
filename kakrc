hook global WinCreate .* %{set global indentwidth 2}
hook global WinCreate .* %{set global tabstop 2}
hook global WinCreate .* %{hook window InsertChar \t %{ exec -draft h@}}

hook global InsertChar \( 'exec )<left>'
hook global InsertChar \{ 'exec }<left>'
hook global InsertChar \[ 'exec ]<left>'
hook global InsertChar < 'exec ><left>'
hook global InsertChar ' "exec '<left>"

add-highlighter global number_lines -hlcursor -separator ' '
add-highlighter global show_matching
add-highlighter global show_whitespaces
add-highlighter global dynregex '%reg{/}' 0:default,+u

hook global NormalKey y|d|c %{ nop %sh{
  printf %s "$kak_reg_dquote" | pbcopy
}}

hook global BufCreate .vue %{ set buffer filetype xml }
hook global BufCreate .*.elm %{ set buffer filetype haskell }
hook global BufCreate .*.purs %{ set buffer filetype haskell }
hook global BufCreate .*.(es6|tsx?) %{ set buffer filetype javascript }

define-command trim-whitespaces -docstring "Remove trailing whitespace from every line" %{
   try %{
        exec -draft '%s\h+$<ret>d'
        echo -markup "{Information}trimmed"
    } catch %{
        echo -markup "{Information}nothing to trim"
    }
}
