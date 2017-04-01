#!/usr/bin/env bash
mkdir -p ~/src
cd ~/src
if [ -d qmk_firmware ]; then
    cd qmk_firmware ; git fetch -p ; git reset --hard HEAD
else
    git clone https://github.com/qmk/qmk_firmware
    cd qmk_firmware && git submodule update --init --recursive
fi

MY_KEYMAP="$HOME/src/qmk_firmware/keyboards/whitefox/keymaps/$(whoami)"
if [ -d "$MY_KEYMAP" ]; then
    cd "$MY_KEYMAP" ; git fetch -p ; git reset --hard origin/HEAD
else
    git clone https://github.com/phongnh/whitefox-settings "$MY_KEYMAP"
fi

brew install dfu-util

cd ~/src/qmk_firmware/keyboards/whitefox
make whitefox-`whoami`-clean whitefox-`whoami`
