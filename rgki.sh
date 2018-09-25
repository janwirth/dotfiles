#!/bin/zsh

MAX_HITS=30

YELLOW=`tput setaf 3`
WHITE=`tput setaf 7`

function rgki () {
  local counter=1
  # populate array with the first MAX_HITS hits
  hits=("${(@f)$(rg -l $1 | tail +2 | head -n $MAX_HITS)}");

  # print file list with newline before and after
  printf "\n"
  for hit in "${hits[@]}";do
    echo ${counter}$YELLOW ${hit} $WHITE
    counter=$((counter+1))
  done

  printf "\nwhich file? "

  # get the file by number
  read whichfile
  kak ${hits[$whichfile]}
}
