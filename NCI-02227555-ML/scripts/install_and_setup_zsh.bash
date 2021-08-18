#!/bin/bash
# MAC OSX defaults to zsh now from bash

# set zsh as default shell
chsh -s $(which zsh)

# install oh-my-zsh
if [ -f ~/.zshrc ]; then
mv ~/.zshrc ~/.zshrc.original
fi
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# add "source ~/.zshrc_kopardevn" to the bottom of ~/.zshrc file
echo "source ~/.zshrc_kopardevn" >> ~/.zshrc

# Now add customizations to ~/.zshrc_kopardevn
