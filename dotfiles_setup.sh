#!/bin/bash

dotfiles=(".bash_profile" ".fzf.bash" ".git-completion.bash" ".git-prompt.sh" 
          ".gitconfig" ".vimrc" ".tmux.conf" ".tmuxline.conf")
dir="${HOME}/.dotfiles"

for dotfile in "${dotfiles[@]}"; do
	gln -sf "${dir}/${dotfile}" "${HOME}/${dotfile}" 
done
