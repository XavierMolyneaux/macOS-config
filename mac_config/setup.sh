#!/bin/bash

echo "Starting Setup Script..."


# Install command-line tools

echo "Installing command line tools..."
    xcode-select --install
echo "Command line tools installed successfully ✅"


# Set macOS system preferences

echo "Setting macOS system preferences..."
    # Finder settings
    defaults write com.apple.finder "AppleShowAllFiles" -bool "true"
    killall Finder

    # Dock settings
    defaults write com.apple.dock "autohide" -bool "true"
    # defaults write com.apple.dock "autohide-delay" -float "0"
    # defaults write com.apple.dock tilesize -int 36
    killall Dock

    # Screenshot settings
    # defaults write com.apple.screencapture "location" -string "~/Desktop"
    killall SystemUIServer
echo "System preferences set successfully ✅"


# Install Homebrew

echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "Homebrew installed successfully ✅"


# Install oh-my-zsh and set as default shell. Add homebrew to PATH 

echo "Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
    eval "$(/opt/homebrew/bin/brew shellenv)"
    echo "...Homebrew has been added to PATH within in ~/.zshrc... "
    source ~/.zshrc
echo "Oh-my-zsh installed successfully ✅"


# Install apps from app.txt

echo "Installing apps from apps.txt..."
    while read line; 
    do
        brew install $line
    done < apps.txt
echo "Apps installed successfully ✅"


# Copy config files to proper locations

echo "Copying config files..."
    cp -Rv config/ ~/
    # cp -v config/.bash_profile ~/
    # cp -v config/.bashrc ~/
    # cp -v config/.gitconfig ~/
    # cp -v config/.vimrc ~/
    # cp -v config/.zshrc ~/  
    # cp -v config/.oh-my-zsh ~/
echo "Config files copied successfully ✅"


# Download and install all available OS updates

echo "Updating macOS..."
    sudo softwareupdate -i -a
echo "OS updated successfully ✅"
    

# Verify Homebrew

echo "Verifying Homebrew..."
    echo "If any, run following commands required by Homebrew:"
    brew doctor
echo "Homebrew has been verified ✅"


sleep 2


echo "Setup script complete! ✅"