#!/bin/bash

dotfiles=("bash_profile" "fzfbash" "git-completionbash" "git-promptsh" 
          "gitconfig" "vimrc" "tmuxconf" "tmuxlineconf")
dir="${HOME}/.dotfiles"

for dotfile in "${dotfiles[@]}"; do
	gln -sf "${dir}/${dotfile}" "${HOME}/.${dotfile}" 
done
