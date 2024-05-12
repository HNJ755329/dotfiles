#!/bin/bash

# Function to install packages using pacman
install_with_pacman() {
	sudo pacman -S --needed --noconfirm "$@"
}

install_with_apt() {
	sudo apt-get install -y "$@"
}

# Function to install packages using Cargo
install_with_cargo() {
	cargo install "$@"
}

# Loop through the packages in the list file
while IFS= read -r package; do
	# Check if the package needs special handling (e.g., cargo install)
	case "$package" in
	^\#*)
		continue
	^cargo .*)
		# If the package name contains "cargo", use cargo install
		install_with_cargo "${package//cargo /}"
		;;
	*)
		# Otherwise, use apt or pacman to install the package
		if [ -x "$(command  apt-get)" ]; then
				install_with_apt "$package"
		elif [ -x "$(command -v pacman)" ]; then
				install_with_pacman "$package"
		else
				echo "Unsupported package manager"
				exit 1
		fi
		;;
	esac

if [ -x "$(command -v apt-get)" ]; then
	sudo apt-get update
fi

done <packages.txt
