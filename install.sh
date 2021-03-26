#!/usr/bin/env bash

INSTALL_SCRIPT="${0}"
INSTALL_DIR="${0%/*}"

VIMRC="$HOME/.vimrc"

echo "Running ${INSTALL_SCRIPT}..."

if [[ -e ${VIMRC} ]] ; then
   echo "Creating a backup of ${VIMRC} as ${VIMRC}-old..."
   mv ${VIMRC} ${VIMRC}-old
fi

touch ${VIMRC} && ln -sf ${PWD}/.vimrc ${VIMRC} && echo "Successfully created new link to .vimrc"

echo "Plugins will be installed upon opening the next vim session"
