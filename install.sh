# Automatically sets up and installs as much as possible.
# Make sure to run this from the directory containing it.

# May want to check that this is up to date at:
# http://mxcl.github.com/homebrew/
echo "Installing homebrew..."
ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"

echo "Symlinking .bash_profile..."
ln -fs $PWD/dotfiles/.bash_profile ~/.bash_profile

echo "Symlinking Sublime settings..."
# The Sublime settings. Note: because this symlinks to the real file here,
# Sublime won't correctly see any changes made to it and refresh itself. If you
# modify this, just run install.sh again to poke Sublime into reloading it.
ln -fs $PWD/sublime/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Preferences.sublime-settings

echo "Symlinking .ackrc..."
ln -fs $PWD/dotfiles/.ackrc ~/.ackrc

echo "Installing git bash completion..."
brew install git bash-completion

# Run the new .bash_profile.
source ~/.bash_profile

echo "Installing ack..."
brew install ack
