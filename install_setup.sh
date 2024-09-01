#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Install xclip and xsel using apt-get
install_xclip_xsel() {
    echo "Installing xclip and xsel..."
    sudo apt-get update -qq >/dev/null
    sudo apt-get install -y xclip xsel >/dev/null
}

# Attempt to install clipy using apt-get
install_clipy() {
    echo "Attempting to install clipy Python module..."
    if sudo apt-get install -y python3-clipy >/dev/null 2>&1; then
        echo "Clipy installed successfully."
    else
        echo "Clipy not available via apt-get. Installing from source..."
        if [ -f "setup.py" ] || [ -f "pyproject.toml" ]; then
            sudo python3 setup.py install >/dev/null 2>&1 || echo "Failed to install clipy from source. Please check the setup files."
        else
            echo "setup.py or pyproject.toml not found. Please ensure they exist in the current directory."
        fi
    fi
}

# Install xclip and xsel if they are not already installed
if ! command_exists xclip || ! command_exists xsel; then
    install_xclip_xsel
else
    echo "xclip and xsel are already installed."
fi

# Install clipy Python module
install_clipy

echo "Installation complete!"
