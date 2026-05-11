#!/usr/bin/env bash
set -ue

helpmsg() {
	command echo "Usage: $0 [[--help | -h]]" 0>&2
	command echo ""
}

if [[ ! -d "$HOME/.dotbackup" ]]; then
	command echo "$HOME/.dotbackup not found. Auto Make it"
	command mkdir "$HOME/.dotbackup"
fi

backup=.dotbackup/$(date +"%Y%m%d-%H:%M:%S")

link_to_homedir() {
	local root=$1
	local relPath=${2:-}
	if [[ -n "$relPath" ]]; then
		local absPath=$HOME$root/$relPath
	else
		local absPath=$HOME$root
	fi
	if [[ "$HOME" != "$absPath" ]]; then
		for f in $absPath/\.* $absPath/*; do
			basef=$(basename $f)
			[[ $basef == "." ]] && continue
			[[ $basef == ".." ]] && continue
			[[ $basef == ".git" ]] && continue
			[[ $basef == ".github" ]] && continue
			[[ $basef == ".gitignore" ]] && continue
			[[ $basef == "bin" ]] && continue
			[[ $basef == "setup" ]] && continue
			[[ $basef == "README.md" ]] && continue
			[[ $basef == "LICENSE" ]] && continue
			[[ $basef == "install" ]] && continue
			[[ $basef == "install.sh" ]] && continue

			if [[ -d "$f" ]]; then
				if [[ -n "$relPath" ]]; then
					link_to_homedir $root "$relPath/$basef"
				else
					link_to_homedir $root "$basef"
				fi
			elif [[ -e "$f" ]]; then

				#makebackup
				if [[ -n "$relPath" ]]; then
					local backupdir=$HOME/$backup/$relPath
				else
					local backupdir=$HOME/$backup
				fi

				if [[ -n "$relPath" ]]; then
					local homedir=$HOME/$relPath
				else
					local homedir=$HOME
				fi

				[[ ! -d $homedir ]] && mkdir -p $homedir

				if [[ -e $homedir/$basef ]]; then
					[[ ! -d $backupdir ]] && mkdir -p $backupdir
					echo "mv $homedir/$basef $backupdir"
					mv $homedir/$basef $backupdir
				fi

				command ln -sfv $f $homedir
			fi
		done
	else
		command echo "same install src dest"
	fi
}

while [[ $# -gt 0 ]]; do
	case ${1} in
	--debug | -d)
		set -uex
		;;
	--help | -h)
		helpmsg
		exit 1
		;;
	*) ;;
	esac
	shift
done

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
dotdir=$(dirname ${script_dir})
root="${dotdir#"$HOME"}"
link_to_homedir $root
# git config --global include.path "~/.gitconfig"
command echo -e "\e[[1;36m Install completed!!!! \e[[m"
