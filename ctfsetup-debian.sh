#!/bin/bash

# Colors for formatting output
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}Starting CTF environment setup...${NC}"

# Update and upgrade the system
echo -e "${GREEN}Updating system...${NC}"
sudo apt update && sudo apt upgrade -y

# Install general development tools
echo -e "${GREEN}Installing essential development tools...${NC}"
sudo apt install -y build-essential git curl wget vim tmux htop python3 python3-pip gdb libc6-dbg

# Install common CTF tools

## Pwntools
echo -e "${GREEN}Installing pwntools...${NC}"
pip3 install --upgrade pwntools

## Binary exploitation tools
echo -e "${GREEN}Installing binary exploitation tools...${NC}"
sudo apt install -y gdb gdb-multiarch radare2 binwalk

## Reverse engineering tools
echo -e "${GREEN}Installing reverse engineering tools...${NC}"
sudo apt install -y strace ltrace objdump ghex

## Networking tools
echo -e "${GREEN}Installing networking tools...${NC}"
sudo apt install -y wireshark tcpdump netcat-openbsd nmap socat

## Web exploitation tools
echo -e "${GREEN}Installing web exploitation tools...${NC}"
sudo apt install -y sqlmap nikto

## Cryptography tools
echo -e "${GREEN}Installing cryptography tools...${NC}"
sudo apt install -y john hashcat

## Forensics tools
echo -e "${GREEN}Installing forensics tools...${NC}"
sudo apt install -y foremost sleuthkit autopsy steghide exiftool

# Install Docker
echo -e "${GREEN}Installing Docker for isolated environments...${NC}"
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER

# Install Zsh and Oh My Zsh (Optional)
echo -e "${GREEN}Installing Zsh and Oh My Zsh...${NC}"
sudo apt install -y zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Create a CTF directory structure
echo -e "${GREEN}Setting up CTF directory structure...${NC}"
mkdir -p ~/CTFs/{binary,web,forensics,crypto,misc}
echo -e "${GREEN}CTF directories created under ~/CTFs${NC}"

# Finishing up
echo -e "${GREEN}CTF environment setup complete! Restart your terminal to apply Zsh.${NC}"
