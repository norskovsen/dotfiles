#!/bin/bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
nvim +VimEnter +PlugInstall +qall 
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --all
