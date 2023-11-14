#!/bin/bash

# Development packages
devPkgs=("openjdk@11" "gradle@8" "python@3.11" "visual-studio-code")

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
		if [[ $pkg="visual-studio-code" ]]; then
			# Install VS Code and extension: redhat.java
			brew install --cask $pkg

			echo "Installing VS Code extension: redhat.java..."
			if ! code --list-extensions | grep -q "redhat.java"; then
				code --install-extension redhat.java
			fi
		else
			brew install $pkg
		fi
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