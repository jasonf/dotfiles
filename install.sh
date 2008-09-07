#!/bin/sh

replace_all=false
for file in `ls`
do
  case $file in
  README)
    continue;;
  install.sh)
    continue;;
  dotfile_init)
    continue;;
  esac

  if [ -f $HOME/.$file ]
  then
    if [ $replace_all == true ]
    then
      rm $HOME/.$file
      ln -s $PWD/$file $HOME/.$file
    else
      echo "overwrite ~/.$file? [ynaq] "
      read -s answer
      case $answer in
      a)
        replace_all=true
        rm $HOME/.$file
        ln -s $PWD/$file $HOME/.$file;;
      y)
        rm $HOME/.$file
        ln -s $PWD/$file $HOME/.$file;;
      q)
        exit;;
      *)
        echo "skipping ~/.$file"
      esac
    fi
  else
    echo "linking ~/.$file"
    ln -s $PWD/$file $HOME/.$file
  fi

done;
exit 0

