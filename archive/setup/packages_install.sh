#!/bin/env sh

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

if command -v apt-get &>/dev/null; then
	sudo apt-get update
	#:
elif command -v pacman &>/dev/null; then
	sudo pacman -Syyu --noconfirm
fi

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
# Loop through the packages in the list file
while IFS= read -r package; do
	# Check if the package needs special handling (e.g., cargo install)
	case "$package" in
	\#*) ;;
	*cargo:*)
		# If the package name contains "cargo", use cargo install
		cargo_package=${package//cargo:/}
		#echo "cargo install $cargo_package"
		install_with_cargo "$cargo_package"
		;;
	*)
		# Otherwise, use apt or pacman to install the package
		if command -v apt-get &>/dev/null; then
			#echo "apt install $package"
			install_with_apt "$package"
		elif command -v pacman &>/dev/null; then
			#echo "pacman $package"
			install_with_pacman "$package"
		else
			echo "Unsupported package manager"
			exit 1
		fi
		;;
	esac
done <$script_dir/lib/packages.txt
