hook global WinCreate .* %{set global indentwidth 2}
hook global WinCreate .* %{set global tabstop 2}
hook global WinCreate .* %{hook window InsertChar \t %{ exec -draft h@}}

hook global InsertChar \( 'exec )<left>'
hook global InsertChar \{ 'exec }<left>'
hook global InsertChar \[ 'exec ]<left>'
hook global InsertChar < 'exec ><left>'
hook global InsertChar ' "exec '<left>"

add-highlighter global/ number-lines -hlcursor -separator ' ' 
add-highlighter global/ show-matching
add-highlighter global/ show-whitespaces -lf ' '
#add-highlighter global dynregex '%reg{/}' 0:default,+u
colorscheme gruvbox


hook global NormalKey y|d|c %{ nop %sh{
  printf %s "$kak_main_reg_dquote" | xsel -ib
}}

map global user p <a-!>pbpaste<ret>'
# paste large stuff from clipboard
# extract rule from parse tree in latex tikz tree syntax
map global user r Zf.lf<space>Hyo<esc>F<esc>PA<space><minus><gt><space><esc>zf[f.lf<space>Hyjpzf[mf.lf<space>HyjA<space><esc>pz
map global user l yI<esc>Oconsole.log(<esc>P:w<ret>

# find selection across all buffers
map global user f :find<space>%{<backspace>reg{.}<ret>
# open file from find result
map global user o F:<esc>H:b<space>%{<backspace>reg{.}<ret>


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

source ~/dotfiles/find.kak
