#!/bin/bash
echo "Compile programs from source"
DOTFILE_PATH="~/Dropbox/Projekter/Diverse/dotfiles/"

for f in ${DOTFILE_PATH}scripts/installers/*
do
    $f
done
