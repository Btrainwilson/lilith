#!/bin/bash
#
INSTALLDIR=$(realpath ~)
SCRIPTDIR=$(realpath .)
YESMODE=false

run_install () {
  local resp
  if [ "$YESMODE" = false ]; then
    read -p "Install $1? (y/n) "  resp
  else
    resp="y"
  fi

  if [ -z "$resp" ] || [ "$resp" = "y" ]; then
    source "$2"
  fi
}


has_argument() {
    [[ ("$1" == *=* && -n ${1#*=}) || ( ! -z "$2" && "$2" != -*)  ]];
}

extract_argument() {
  echo "${2:-${1#*=}}"
}

# Function to display script usage
usage() {
 echo "Usage: $0 [OPTIONS]"
 echo "Options:"
 echo " -h, --help      Display this help message"
 echo " -y, --yes       Skip all prompts and install everything"
}
handle_options() {
  while [ $# -gt 0 ]; do
    case $1 in
      -h | --help)
        usage
        exit 0
        ;;
      -y | --yes)
        YESMODE=true
        ;;
      *)
        echo "Invalid option: $1" >&2
        usage
        exit 1
        ;;
    esac
    shift
  done
}

handle_options "$@"

if [ ! -d $INSTALLDIR ]; then
  echo "Directory $INSTALLDIR does not exist. Creating..."
  mkdir -p $INSTALLDIR
fi

run_install "PARA Folders" "$SCRIPTDIR/install/para_folders.sh"
run_install "Packages" "$SCRIPTDIR/install/install_packages.sh"
run_install "Dotfiles" "$SCRIPTDIR/install/setup_dotfiles.sh"
