
echo "XCode command line tools"
xcode-select --install

echo "General settings"
sudo chflags hidden /Applications/maps.app
sudo chflags hidden /Applications/game\ center.app
sudo chflags hidden /Applications/photo \booth.app
sudo chflags hidden /Applications/iBooks.app
sudo chflags hidden /Applications/Siri.app

printf "System - Reveal IP address, hostname, OS version, etc. when clicking the login window clock\n"
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

printf "System - Require password immediately after sleep or screen saver begins\n"
sudo defaults write com.apple.screensaver askForPassword -int 1
sudo defaults write com.apple.screensaver askForPasswordDelay -int 0


printf "System - Avoid creating .DS_Store files on network volumes\n"
sudo defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

printf "System - set clock to be desired format\n"
sudo defaults write com.apple.menuextra.clock DateFormat -string "EEE d MMM H:mm:ss"

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
brew install autoconf
brew install automake
brew install awscli
brew install curl
brew install docker
brew install git
brew install git-extras
brew install git-open
brew install gnupg2
brew install golang
brew install hugo
brew install libevent
brew install node
brew install npm
brew install openssl
brew install python
brew install python3
brew install readline
brew install ruby
brew install ssh-copy-id
brew install vim
brew install wget
brew install zsh
brew install pyenv-virtualenv
brew install pyenv-virtualenvwrapper

echo "Cask installing apps"
brew cask install caskroom/versions/google-chrome-beta
brew cask install evernote
brew cask install gimp
brew cask install inkscape
brew cask install iterm2
brew cask install keybase
brew cask install macvim
brew cask install qgis
brew cask install spotify
brew cask install dropbox

echo "Installing Powerline Fonts"
brew cask install caskroom/fonts/font-anonymice-powerline
brew cask install caskroom/fonts/font-monofur-for-powerline
brew cask install caskroom/fonts/font-inconsolata-for-powerline
brew cask install caskroom/fonts/font-menlo-for-powerline
brew cask install caskroom/fonts/font-consolas-for-powerline
brew cask install caskroom/fonts/font-meslo-for-powerline
brew cask install caskroom/fonts/font-roboto-mono-for-powerline
brew cask install caskroom/fonts/font-ubuntu-mono-derivative-powerline
brew cask install caskroom/fonts/font-source-code-pro-for-powerline
brew cask install caskroom/fonts/font-inconsolata-dz-for-powerline
brew cask install caskroom/fonts/font-liberation-mono-for-powerline
brew cask install caskroom/fonts/font-inconsolata-g-for-powerline
brew cask install caskroom/fonts/font-fira-mono-for-powerline
brew cask install caskroom/fonts/font-dejavu-sans-mono-for-powerline
brew cask install caskroom/fonts/font-droid-sans-mono-for-powerline

echo "Get my zshrc"
git clone --recursive https://github.com/undertakingyou/dotzsh.git $HOME/.zsh
chmod +x $HOME/.zsh/install.zsh; $HOME/.zsh/install.zsh
chsh -s /bin/zsh

echo "Get my vimrc"
git clone http://github.com/undertakingyou/dotvim $HOME/.vim

echo "Install Needed NPM tools"
npm install --global prettier
npm install --global eslint
npm install --global babel-eslint
npm install --global eslint-plugin-react

echo "Setup dotfiles"
ln -sf $(pwd)/gitconfig $HOME/.gitconfig
ln -sf $(pwd)/eslintrc $HOME/.eslintrc

echo "Setup code folder"
mkdir $HOME/Projects

echo "Installing Inconsolata font"
curl -sfSL -o $HOME/Library/Fonts/Inconsolata.otf http://levien.com/type/myfonts/Inconsolata.otf
