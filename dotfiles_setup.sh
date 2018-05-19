#!/bin/bash

# Colors
NC='\033[0m' # No color
LT_GREEN='\033[1;32m' # Light Green
GREEN='\033[0;32m'
RED='\033[0;31m'
LT_CYAN='\033[1;36m' # Light Cyan
YELLOW='\033[0;33m'
LT_BLUE='\033[1;34m'

dotfiles=("bash_profile" "fzf.bash" "git-completion.bash" "git-prompt.sh"
          "gitconfig" "vimrc" "tmux.conf" "tmuxline.conf")
dir="$(pwd)"

echo -e "Going to create links for this files in the home directory: "
for dotfile in "${dotfiles[@]}"; do
    echo -e "${LT_CYAN}${dotfile}${NC}"
done
echo -e

echo -en "Proceed? (${GREEN}y${NC}/n) "
read -r ans

if [ "$ans" != "y" ]; then
    echo "Exiting..."
    exit 1
fi

if [ "$PLATFORM" = "Darwin" ] && [ -x "/usr/local/bin/gln" ]; then
    ln_command="gln"
else
    ln_command="ln"
fi

echo "bash command used to create links: ${ln_command}"

if [ "$PLATFORM" = "Darwin" ] && [ -x "/usr/local/bin/greadlink" ]; then
    readlink_command="greadlink -f"
else
    readlink_command="readlink"
fi

echo "bash command used to read links: ${readlink_command}"

failed=()

for dotfile in "${dotfiles[@]}"; do
    origin="${dir}/${dotfile}"
    destination="${HOME}/.${dotfile}"
    echo -e "Creating a soft link for ${YELLOW}${origin}${NC}" \
        "in ${LT_BLUE}${destination}...${NC}"
    if [ -h "${destination}" ]; then
        if [ "$($readlink_command "${destination}")" = "${origin}" ]; then
            echo -e "${LT_GREEN}Already exists.${NC}"
        else
            echo -e "${RED}A link exists, but points to another file:" \
                    "$($readlink_command "${destination}")${NC}"
            failed+=("${destination}")
        fi
    elif [ -f "${destination}" ]; then
        echo -e "${RED}A file exists. Delete it (or temporary move it).${NC}"
        failed+=("${destination}")
    else
        $ln_command -s "${origin}" "${destination}"
        echo -e "${GREEN}Created.${NC}"
    fi
done

clear;

if [ ${#failed[@]} -gt 0 ]; then
    echo -e "${RED}Failed to create links for: "
    for fail in "${failed[@]}"; do
        echo -e "${fail}"
    done
    echo -e "${NC}"
else
    echo -e "${GREEN}Done.${NC}"
fi
