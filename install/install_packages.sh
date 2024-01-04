#!/bin/bash
# List of packages to be installed
PACKAGES=(
    "git"
    "nvim"
    "curl"
    "htop"
    "fish"
    "i3"
    "rofi"
    "wget"
    "xclip"
    "python"
    "neofetch"
    "make"
    "lemurs"
    "inotify-tools"
    "tmux"
    "kitty"

)

# Function to install packages for Debian/Ubuntu
install_debian() {
    echo "Detected Debian/Ubuntu system."
    # Update package list
    sudo apt-get update

    # Install packages
    for package in "${PACKAGES[@]}"
    do
        sudo apt-get install -y $package
    done
}

# Function to install packages for Red Hat/CentOS
install_redhat() {
    echo "Detected Red Hat/CentOS system."
    # Add your Red Hat/CentOS specific commands here
    # sudo yum update
    # sudo yum install -y package1 package2
}

# Function to install packages for Fedora
install_fedora() {
    echo "Detected Fedora system."
    # Add your Fedora specific commands here
    # sudo dnf update
    # sudo dnf install -y package1 package2
}

install_arch() {
    echo "Detected Arch system."
    # Add your Fedora specific commands here
    # sudo dnf update
    # sudo dnf install -y package1 package2
}
# Function to show an error for unsupported distributions
unsupported_distro() {
    echo "Unsupported Linux distribution."
}

# Check the Linux distribution
if [ -f /etc/os-release ]; then
    . /etc/os-release
    case $ID in
        debian|ubuntu)
            install_debian
            ;;
        fedora)
            install_fedora
            ;;
        rhel|centos)
            install_redhat
            ;;
        arch)
            install_arch
            ;;
        *)
            unsupported_distro
            ;;
    esac
else
    echo "Cannot identify the Linux distribution."
fi

