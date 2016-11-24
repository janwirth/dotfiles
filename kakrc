hook global WinCreate .* %{addhl number_lines}
hook global WinCreate .* %{addhl show_whitespaces}


hook global WinCreate .* %{set global indentwidth 2}
hook global WinCreate .* %{set global tabstop 2}
hook global WinCreate .* %{hook window InsertChar \t %{ exec -draft h@}}

hook global InsertChar \( 'exec )<left>'
hook global InsertChar \{ 'exec }<left>'
hook global InsertChar \[ 'exec ]<left>'
hook global InsertChar ' "exec '<left>"


hook global WinCreate .* %{ addhl show_matching }
