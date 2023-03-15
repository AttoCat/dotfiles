#!/bin/bash
if [ $(uname) = Darwin ]; then
    source ./mac/mac-init.sh
fi

fish -c "fisher update"
echo "---Set fish as login shell---"
chsh -s `which fish`
fish