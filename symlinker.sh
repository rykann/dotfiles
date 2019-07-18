#!/bin/bash
############################
# .symlinker.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# Adapted from https://github.com/jonhoman/dotfiles/blob/master/symlinker.sh
############################

########## Variables

dir=~/.dotfiles                    # dotfiles directory
olddir=~/.dotfiles_old             # old dotfiles backup directory
# list of files/folders to symlink in homedir
files="ackrc aliases bash_profile bashrc gemrc gitconfig gitignore inputrc irbrc my.cnf rspec vimrc zshrc"

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/.dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# special cases
#echo "Creating symlink for .vim/colors"
#mv ~/.vim/colors ~/dotfiles_old/
#ln -s $dir/vim/colors ~/.vim/

#echo "Creating symlink for bin"
#mv ~/bin ~/dotfiles_old/
#ln -s $dir/bin ~
