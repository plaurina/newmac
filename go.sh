#!/bin/sh
echo "###############################################################################"
echo "# Go.sh Mac Setup                                                             #"
echo "###############################################################################"
echo change default shell back to bash instead of zsh
chsh -s /bin/bash

#http://blog.bmannconsulting.com/mavericks-brew-cask
#https://github.com/mathiasbynens/dotfiles/blob/master/.osx
# homebrew
## Xcode required - https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Installation.md#requirements
xcode-select --install

echo "###############################################################################"
echo "# Homebrew + Cask                                                             #"
echo "###############################################################################"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install caskroom/cask/brew-cask
brew tap caskroom/versions

echo "###############################################################################"
echo "# Common                                                                      #"
echo "###############################################################################"
brew cask install google-chrome
brew cask install vlc
brew cask install openoffice

echo "###############################################################################"
echo "# Sysadmin                                                                    #"
echo "###############################################################################"
brew cask install iterm2
brew cask install alfred
# softwareupdate --install 'RemoteDesktopClient-3.8.2 v1.1'
brew cask install atext
brew cask install spectacle
brew cask install google-backup-and-sync 

brew cask install clipy
brew cask install coconutbattery
brew cask install mysql
brew cask install keka
#brew cask install flux

echo "###############################################################################"
echo "# Development                                                                 #"
echo "###############################################################################"
#brew cask install sublime-text3
#brew cask install virtualbox
#brew cask install vagrant
#brew cask install googleappengine
#brew install mcrypt #required for laravel
#brew install php56-mcrypt #required for laravel
#vagrant plugin install vagrant-bindfs
#vagrant plugin install vagrant-hostsupdater
#brew cask install sourcetree
#brew cask install sequel-pro
#brew install homebrew/php/composer
brew install android-platform-tools
#brew install ansible
brew install node
brew install nvm
npm install -g gulp
npm install -g bower
brew cask install docker
brew cask install kitematic
brew cask install postman

brew cask install notational-velocity
#brew cask install textwrangler
brew cask install slack
#brew cask install screenhero
brew install git
#brew cask install github-desktop
brew install htop

brew install java11
brew install java6
brew install jenv
brew install maven
brew install gradle

#brew cask install yourkit-java-profiler
brew cask install dbvisualizer
brew install jce-unlimited-strength-policy
brew cask install visualvm
brew cask install intellij-idea


echo "###############################################################################"
echo "# Design                                                                      #"
echo "###############################################################################"
#brew cask install adobe-photoshop-cc
brew cask install gimp
#brew cask install sigil

echo "###############################################################################"
echo "# Security                                                                    #"
echo "###############################################################################"
#brew cask install private-internet-access  not working
#brew cask install lastpass use browser extension not working
#brew tap trinitronx/homebrew-truecrypt using integrated mac encryption
echo "Administrator password required to enable FileVault"
sudo fdesetup enable

#echo "###############################################################################"
#echo "# Sublime Text                                                                #"
#echo "###############################################################################"
#https://www.sublimetext.com/forum/viewtopic.php?f=6&t=21024
#http://sublime-text-unofficial-documentation.readthedocs.org/en/latest/reference/commands.html
# /opt/homebrew-cask/Caskroom/sublime-text3/Build\ 3083/Sublime\ Text.app/Contents/SharedSupport/bin/subl --command "show_panel {\"panel\": \"console\"}"
# /opt/homebrew-cask/Caskroom/sublime-text3/Build\ 3083/Sublime\ Text.app/Contents/SharedSupport/bin/subl --command "insert_snippet {\"contents\" : \"import urllib.request,os,hashlib; h = '2915d1851351e5ee549c20394736b442' + '8bc59f460fa1548d1514676163dafc88'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)\"}"
# /opt/homebrew-cask/Caskroom/sublime-text3/Build\ 3083/Sublime\ Text.app/Contents/SharedSupport/bin/subl --command build

echo "###############################################################################"
echo "# Cleanup                                                                     #"
echo "###############################################################################"
#brew cleanup
#brew cask cleanup

echo "###############################################################################"
echo "# General UI/UX                                                               #"
echo "###############################################################################"

# Set computer name (as done via System Preferences → Sharing)
sudo scutil --set ComputerName "LM13P"
sudo scutil --set HostName "LM13P"
sudo scutil --set LocalHostName LM13P"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "LM13P"

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Disable the crash reporter
defaults write com.apple.CrashReporter DialogType -string "none"

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Disable Notification Center and remove the menu bar icon
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null


echo "###############################################################################"
echo "# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #"
echo "###############################################################################"

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

echo "###############################################################################"
echo "# Screen                                                                      #"
echo "###############################################################################"

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

echo "###############################################################################"
echo "# Finder                                                                      #"
echo "###############################################################################"

# Set the default `PfDe` location for new Finder windows
# For other paths, use `PfLo` and `file:///full/path/here/`
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Finder: remove color tags
defaults write com.apple.finder ShowRecentTags -bool false

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Use column view in all Finder windows by default
# Four-letter codes for the view modes: `icnv` = icon, `clmv` = column, `Flwv` = coverflow, `Nlsv` = list
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Show items in finder sidebar
defaults write com.apple.sidebarlists systemitems -dict-add ShowEjectables -bool true
defaults write com.apple.sidebarlists systemitems -dict-add ShowHardDisks -bool true
defaults write com.apple.sidebarlists systemitems -dict-add ShowRemovable -bool true
defaults write com.apple.sidebarlists systemitems -dict-add ShowServers -bool true

echo "###############################################################################"
echo "# Dock, Dashboard, and hot corners                                            #"
echo "###############################################################################"

# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# Wipe all (default) app icons from the Dock
# This is only really useful when setting up a new Mac, or if you don’t use
# the Dock to launch apps.
defaults write com.apple.dock persistent-apps -array

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Disable the Launchpad gesture (pinch with thumb and three fingers)
defaults write com.apple.dock showLaunchpadGestureEnabled -int 0

# Reset Launchpad, but keep the desktop wallpaper intact
find "${HOME}/Library/Application Support/Dock" -name "*-*.db" -maxdepth 1 -delete

echo "###############################################################################"
echo "# Time Machine                                                                #"
echo "###############################################################################"

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Disable local Time Machine backups
hash tmutil &> /dev/null && sudo tmutil disablelocal




echo "###############################################################################"
echo "# Non CLI Apps                                                                #"
echo "###############################################################################"
curl -o https://awscli.amazonaws.com/AWSCLIV2.pkg
open AWSCLIV2.pkg





open /Applications/App\ Store.app

echo "Done. Note that some of these changes require a logout/restart to take effect."
say -v Fiona "I'm all done setting up your computer"
