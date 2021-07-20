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
#ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install caskroom/cask/brew-cask
brew tap caskroom/versions

echo "###############################################################################"
echo "# Common                                                                      #"
echo "###############################################################################"
#brew install --cask google-chrome
brew install --cask vlc
brew install --cask openoffice

echo "###############################################################################"
echo "# Sysadmin                                                                    #"
echo "###############################################################################"
brew install --cask iterm2
brew install --cask alfred
# softwareupdate --install 'RemoteDesktopClient-3.8.2 v1.1'
brew install --cask atext
brew install --cask spectacle
#brew install --cask google-backup-and-sync 

brew install --cask clipy
brew install --cask coconutbattery
brew install --cask mysql
#brew install --cask keka
#brew install --cask flux

echo "###############################################################################"
echo "# Development                                                                 #"
echo "###############################################################################"
#brew install --cask sublime-text3
brew install --cask virtualbox
#brew install --cask vagrant
#brew install --cask googleappengine
#brew install mcrypt #required  laravel
#brew install php56-mcrypt #required  laravel
#vagrant plugin install vagrant-bindfs
#vagrant plugin install vagrant-hostsupdater
#brew install --cask sourcetree
#brew install --cask sequel-pro
#brew install homebrew/php/composer
#brew install android-platm-tools
brew install ansible
brew install node
brew install nvm
npm install -g gulp
npm install -g bower
brew install --cask docker
brew install --cask kitematic
brew install --cask postman

brew install --cask notational-velocity
brew install --cask textwrangler
#brew install --cask slack
#brew install --cask screenhero
brew install git
brew install --cask github-desktop
brew install htop

#brew install java11
#brew install java6
#brew install jenv

echo "###############################################################################"
echo "# JAVA                                                                        #"
echo "###############################################################################"
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk version

brew install maven
brew install gradle

#brew install --cask yourkit-java-profiler
brew install --cask dbvisualizer
brew install jce-unlimited-strength-policy
brew install --cask visualvm
brew install --cask intellij-idea


echo "###############################################################################"
echo "# Design                                                                      #"
echo "###############################################################################"
#brew install --cask adobe-photoshop-cc
#brew install --cask gimp
#brew install --cask sigil

echo "###############################################################################"
echo "# Security                                                                    #"
echo "###############################################################################"
#brew install --cask private-internet-access  not working
#brew install --cask lastpass use browser extension
#brew tap trinitronx/homebrew-truecrypt using integrated mac encryption
echo "Administrator password required to enable FileVault"
#sudo fdesetup enable

#echo "###############################################################################"
#echo "# Sublime Text                                                                #"
#echo "###############################################################################"
#https://www.sublimetext.com/um/viewtopic.php?f=6&t=21024
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
#sudo scutil --set ComputerName "LM13P"
#sudo scutil --set HostName "LM13P"
#sudo scutil --set LocalHostName LM13P"
#sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "LM13P"

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStatePrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStatePrint2 -bool true

# Disable the crash reporter
defaults write com.apple.CrashReporter DialogType -string "none"

# Check  software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Disable Notification Center and remove the menu bar icon
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null


echo "###############################################################################"
echo "# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #"
echo "###############################################################################"

# Trackpad: enable tap to click  this user and  the login screen
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

# Save screenshots in PNG mat (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

echo "###############################################################################"
echo "# Finder                                                                      #"
echo "###############################################################################"

# Set the default `PfDe` location  new Finder windows
#  other paths, use `PfLo` and `file:///full/path/here/`
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
# Four-letter codes  the view modes: `icnv` = icon, `clmv` = column, `Flwv` = coverflow, `Nlsv` = list
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
defaults write com.apple.TimeMachine DoNotOfferNewDisksBackup -bool true

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
