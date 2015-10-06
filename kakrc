hook global WinCreate .* %{addhl number_lines}
hook global WinCreate .* %{addhl show_whitespaces}


hook global WinCreate .* %{set global indentwidth 4}
hook global WinCreate .* %{set global tabstop 4}
hook global WinCreate .* %{hook window InsertChar \t %{ exec -draft h@}}
