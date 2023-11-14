#!/bin/bash

# Development packages
devPkgs=("openjdk@11" "gradle@8" "python@3.11")

echo "Uninstalling packages..."

# Loop over the development packages and uninstall each one
for pkg in "${devPkgs[@]}"; do
	echo "Uninstalling $pkg..."

	# Check if the command associated with the package is available
	if command -v $pkg &>/dev/null; then
		# Uninstall Python requests module
		if [[ $pkg="python3" ]]; then
			echo "Uninstalling Python requests module..."
			if pip3 show requests &>/dev/null; then
				pip3 uninstall requests -y
			else
				echo "Python requests module is not installed. Skipping..."
			fi
		else
			echo "Python is not installed. Skipping Python requests module uninstallation..."
		fi

		brew uninstall $pkg
	else
		echo "$pkg is not installed. Skipping..."
	fi
done

# Uninstall VS Code
echo "Uninstalling Visual Studio Code..."
if command -v code &>/dev/null; then
	brew uninstall --cask visual-studio-code
else
	echo "Visual Studio Code is not installed. Skipping..."
fi
