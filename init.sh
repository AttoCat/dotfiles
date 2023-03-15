#!/bin/bash
if [ $(uname) = Darwin ]; then
    if ! type -t brew ; then
        echo "---Install and update Homebrew---"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        echo "---Installed!!---"
    else
        echo "---Homebrew is already installed, update...---"
    fi
    brew update > /dev/null
    echo "---Install some packages with HomeBrew---"
    brew bundle > /dev/null 2>&1
    echo "---Installed!---"
fi

fish -c "fisher update"
chsh -s `which fish`
fish