#!/bin/bash

# Colors for formatting output
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}Starting CTF environment setup...${NC}"

# Update and upgrade the system
echo -e "${GREEN}Updating system...${NC}"
sudo pacman -Syu --noconfirm

# Install general development tools
echo -e "${GREEN}Installing essential development tools...${NC}"
sudo pacman -S --noconfirm base-devel git curl wget vim tmux htop python python-pip gdb glibc

# Install common CTF tools

## Pwntools
echo -e "${GREEN}Installing pwntools...${NC}"
pip install --upgrade pwntools

## Binary exploitation tools
echo -e "${GREEN}Installing binary exploitation tools...${NC}"
sudo pacman -S --noconfirm gdb radare2 binwalk

## Reverse engineering tools
echo -e "${GREEN}Installing reverse engineering tools...${NC}"
sudo pacman -S --noconfirm strace ltrace ghex

## Networking tools
echo -e "${GREEN}Installing networking tools...${NC}"
sudo pacman -S --noconfirm wireshark-cli tcpdump nmap openbsd-netcat socat

## Web exploitation tools
echo -e "${GREEN}Installing web exploitation tools...${NC}"
sudo pacman -S --noconfirm sqlmap nikto

## Cryptography tools
echo -e "${GREEN}Installing cryptography tools...${NC}"
sudo pacman -S --noconfirm john hashcat

## Forensics tools
echo -e "${GREEN}Installing forensics tools...${NC}"
sudo pacman -S --noconfirm foremost sleuthkit steghide exiftool

# Install Docker
echo -e "${GREEN}Installing Docker for isolated environments...${NC}"
sudo pacman -S --noconfirm docker
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER

# Install Zsh and Oh My Zsh (Optional)
echo -e "${GREEN}Installing Zsh and Oh My Zsh...${NC}"
sudo pacman -S --noconfirm zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Create a CTF directory structure
echo -e "${GREEN}Setting up CTF directory structure...${NC}"
mkdir -p ~/CTFs/{binary,web,forensics,crypto,misc}
echo -e "${GREEN}CTF directories created under ~/CTFs${NC}"

# Finishing up
echo -e "${GREEN}CTF environment setup complete! Restart your terminal to apply Zsh.${NC}"
