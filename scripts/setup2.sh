#!/bin/bash
DOTFILE_PATH=~/Dropbox/Projekter/Diverse/dotfiles/

printf "\nConfiguring\n"
for f in ${DOTFILE_PATH}scripts/config/*
do
    echo "Running "${f}
    $f
done

printf "\nCompile programs from source\n"
for f in ${DOTFILE_PATH}scripts/installers/*
do
    echo "Running "${f}
    $f
done
