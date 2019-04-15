# dotfiles
My dotfiles.

# To Do:
_After completing this tasks mark it as v1.0, and using sources at the bottom
start exploring and developing more._
- [ ] Add descriptions to the top of each file
    - _Or write a description to each of the files in the README.md_
- [ ] Write a description of how is this maintained and used
- [ ] Create a list of dependencies and app used
    - [ ] python3
    - [ ] pipenv
    - [ ] flake8
    - [ ] tmuxp
- [ ] Write a script that would install all require dependencies
- [ ] Write a script for scheduling sleep and wake (use `pmset schedule`)
- [x] Rewrite the setup script to be less error prone and verbose
    - [ ] Add an option to move the conflicting files in the home dir to
        another one.
- [x] Add to do
- [x] Recover plugins from the plugins tracklist
- [x] Finish adding standard settings
- [x] Set up tmux configs (add nice window management shortcuts)
- [x] Move plugin tracker file to dotfiles??? (optional)
- [x] ~~Symlinks vs sourcing files?~~ (symlinks for now)
- [x] Ensure mouse support in both tmux and vim
- [x] Remove the dots ('.') from file names and make the setup script add them

## Sources for v2.0:
- ~https://github.com/gtalarico/dotfiles-1~ (404; repo was removed)
    - Cool github profile with useful repos
    - Really liked the design of his terminal
    - The structure of the setup scripts and dotfiles repo is inspiring
- https://blog.kalis.me/dotfiles-automating-macos-system-configuration/
    - Found this article linked in the previous repo
    - Has some guidelines that could be useful
    - Contains other useful links
