#!/bin/bash

MY_PATH="`dirname \"$0\"`"
MY_PATH="`( cd \"$MY_PATH\" && pwd )`"

ccred=$(echo -e "\033[0;31m")
ccgreen=$(echo -e "\033[0;32m")
ccend=$(echo -e "\033[0m")

function success {
  echo -e $ccgreen '\xE2\x9C\x93' $ccend
}

function failure {
  echo -e $ccred "\xC3\x97" $ccend
}

function checkSystemCommand () {
  local command="$1"
  local instruction="$2"

  echo -n "$command: "

  `which $command 1>/dev/null 2>/dev/null`

  local returnValue=$?
  if [ $returnValue == 0 ]; then
    success
    return 0
  else
    failure
    echo -e $ccred "   -> $instruction" $ccend
    return 1
  fi
}

function vimHas () {
  local term="$1"
  local instruction="$2"

  echo -n "vim: $term: "

  if vim --version | grep -q $term; then
    success
    return 1
  else
    failure
    echo -e $ccred "   -> $instruction" $ccend
    return 0
  fi
}

if [ -z "$MY_PATH" ] ; then
  echo "Could not determine dotfiles location"
  exit 1
fi

cd "$MY_PATH"

echo "Testing required system packages"
vimHas "+clipboard" "note that rbenv shims should not be in the path: export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin brew install vim --override-system-vi --with-lua"
vimHas "+lua" "brew install vim --override-system-vi --with-lua"
checkSystemCommand "ag" "install: brew install the_silver_searcher"
checkSystemCommand "tmux" "install: brew install tmux"
checkSystemCommand "tmuxinator" "install: gem install tmuxinator"
checkSystemCommand "reattach-to-user-namespace" "install: brew install reattach-to-user-namespace"

echo "Fetching submodules"
git submodule init
git submodule update


echo "Creating symlinks..."

# tmuxinator folder
if [ -d "$HOME/.tmuxinator" ]; then
  rm -r ~/.tmuxinator
fi
if [ -h "$HOME/.tmuxinator" ]; then
  rm ~/.tmuxinator
fi
# ln -s "$MY_PATH/tmuxinator" ~/.tmuxinator

# vim folder
if [ -d "$HOME/.vim" ]; then
  rm -r ~/.vim
fi
if [ -h "$HOME/.vim" ]; then
  rm ~/.vim
fi
ln -s "$MY_PATH/vim" ~/.vim

rm ~/.tmux.conf
ln -s "$MY_PATH/tmux.conf" ~/.tmux.conf

# rm ~/.aliases
# ln -s "$MY_PATH/aliases" ~/.aliases

rm ~/.zshrc
ln -s "$MY_PATH/zshrc" ~/.zshrc

# rm ~/.tigrc
# ln -s "$MY_PATH/tigrc" ~/.tigrc

rm ~/.vimrc
ln -s "$MY_PATH/vimrc" ~/.vimrc

echo "Done."

