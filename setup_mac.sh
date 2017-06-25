
echo "XCode command line tools"
xcode-select --install

echo "General settings"
sudo chflags hidden /Applications/maps.app
sudo chflags hidden /Applications/game\ center.app
sudo chflags hidden /Applications/photo \booth.app

printf "System - Reveal IP address, hostname, OS version, etc. when clicking the login window clock\n"
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

printf "System - Require password immediately after sleep or screen saver begins\n"
sudo defaults write com.apple.screensaver askForPassword -int 1
sudo defaults write com.apple.screensaver askForPasswordDelay -int 0


printf "System - Avoid creating .DS_Store files on network volumes\n"
sudo defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

printf "Keyboard - Turn off keyboard illumination when computer is not used for 5 minutes\n"
sudo defaults write com.apple.BezelServices kDimTime -int 300

printf "Bluetooth - Increase sound quality for headphones/headsets\n"
sudo defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

printf "Finder - Show the $HOME/Library folder\n"
sudo chflags nohidden $HOME/Library

printf "Finder - Show hidden files\n"
sudo defaults write com.apple.finder AppleShowAllFiles -bool true

printf "Finder - Show filename extensions\n"
sudo defaults write NSGlobalDomain AppleShowAllExtensions -bool true

printf "Finder - Disable the warning when changing a file extension\n"
sudo defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false


printf "Finder - Show path bar\n"
sudo defaults write com.apple.finder ShowPathbar -bool true

printf "Finder - Show status bar\n"
sudo defaults write com.apple.finder ShowStatusBar -bool true

printf "Finder - Display full POSIX path as window title\n"
sudo defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

printf "Finder - Use list view in all Finder windows\n"
sudo defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"


printf "Printer - Expand print panel by default\n"
sudo defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

echo "Check for software updates daily, not just once per week"
sudo defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

echo "Disable Photos.app from starting everytime a device is plugged in"
sudo defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

echo "Disable smart quotes as they’re annoying when typing code"
sudo defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

echo "Disable smart dashes as they’re annoying when typing code"
sudo defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false


# Show all processes in Activity Monitor
sudo defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort Activity Monitor results by CPU usage
sudo defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
sudo defaults write com.apple.ActivityMonitor SortDirection -int 0

echo "Installing Homebrew"
ruby -e "$(curl --location --fail --silent --show-error https://raw.githubusercontent.com/Homebrew/install/master/install)"
export PATH="/usr/local/bin:$PATH"

echo "Brew installing apps"
brew install automake
brew install autoconf
brew install awscli
brew install wget
brew install neovim
brew install vim
brew install git
brew install node
brew install npm
brew install python3
brew install curl
brew install libevent
brew install openssl
brew install readline
brew install git-open
brew install git-extras
brew install zsh
brew install docker
brew install keybase
brew install hugo
brew install ssh-copy-id
brew install golang

echo "Cask installing apps"
brew cask install iterm2
brew cask install keepingyouawake
brew cask install mattr-slate
brew cask install caskroom/versions/google-chrome-beta
brew cask install virtualbox
brew cask install sublime-text

echo "Install miniconda"
wget https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh -b -p $HOME/miniconda3

echo "Setup dotfiles"
ln -s $(pwd)/aliases $HOME/.aliases
ln -s $(pwd)/mac $HOME/.mac
ln -s $(pwd)/slate $HOME/.slate
ln -sf $(pwd)/bashrc $HOME/.bashrc
ln -s $(pwd)/zshrc $HOME/.zshrc
ln -s $(pwd)/gitconfig $HOME/.gitconfig
ln -s $(pwd)/package_control.sublime-settings $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Package\ Control.sublime-settings
ln -s $(pwd)/user_settings.sublime-settings $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
ln -s $(pwd)/sublime_keybindings.sublime-keymap $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Default\ \(OSX\).sublime-keymap

echo "Setup code folder"
mkdir ~$HOME/Code