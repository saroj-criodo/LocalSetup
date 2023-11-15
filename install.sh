#!/bin/bash

# Development packages
devPkgs=("openjdk@11" "python@3.11")

echo "Setting up local development environment..."

# Install Homebrew if not present
if ! command -v brew &>/dev/null; then
	echo "Installing Homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew
echo "Updating Homebrew..."
brew update

# Install Git if not present
if ! command -v git &>/dev/null; then
	echo "Installing Git..."
	brew install git
fi

# Loop over the development packages and install each one
for pkg in "${devPkgs[@]}"; do
	echo "Installing $pkg..."

	# Check if the command associated with the package is available
	if ! command -v $pkg &>/dev/null; then
		brew install $pkg
	else
		echo "$pkg is already installed. Skipping..."
	fi
done

# Install Python requests module
if command -v python3 &>/dev/null; then
	echo "Installing Python requests module..."
	if ! pip3 show requests &>/dev/null; then
		pip3 install requests
	else
		echo "Python requests module is already installed. Skipping..."
	fi
else
	echo "Python is not installed. Skipping Python requests module installation..."
fi

if command -v code &>/dev/null && [[ $(uname) != "Linux" ]]; then
	# Install VS Code and extension: redhat.java
	brew install --cask visual-studio-code

	echo "Installing VS Code extension: redhat.java..."
	if ! code --list-extensions | grep -q "redhat.java"; then
		code --install-extension redhat.java
	fi
fi
