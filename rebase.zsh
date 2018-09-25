function rebase () {

  if [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]] || [[ "$1" == "" ]]; then
      echo "usage: rebase [base [top]]"
      echo "where [top] defaults to the current branch"
      return
  fi

  START=`currentBranch`

  TOP=$2
  BASE=$1
  echo maybe $TOP
  # fall back if second arg is not defined
  if [[ "$2" == "" ]];
    TOP=$START
  if
  echo yes $TOP
  echo rebasing $TOP onto $BASE

  git checkout $BASE
  git pull
  echo checking out $TOP
  git checkout $TOP
  git rebase $BASE
  git checkout $START
}
