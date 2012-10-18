# Sets up symlinks for the various files in this repo.
# Run this script from the directory containing it.

# The bash config.
ln -fs $PWD/dotfiles/.bash_profile ~/.bash_profile

# The Sublime settings. Note: because this symlinks to the real file here,
# Sublime won't correctly see any changes made to it and refresh itself. If you
# modify this, just run install.sh again to poke Sublime into reloading it.
ln -fs $PWD/sublime/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Preferences.sublime-settings
