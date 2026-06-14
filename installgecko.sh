#!/usr/bin/env bash
set -e

BOLD='\033[1m'
DIM='\033[2m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${CYAN}"
echo "╔══════════════════════════════════════════════════════════╗"
echo "║    geckodriver Installer for WA-CRACKER                 ║"
echo "║    Firefox WebDriver — one dependency to rule them all   ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo -e "${NC}"

if command -v geckodriver &>/dev/null; then
    echo -e "${GREEN}[✓] geckodriver already installed: $(geckodriver --version 2>&1 | head -1)${NC}"
    echo -e "    Location: $(which geckodriver)"
    exit 0
fi

echo -e "${YELLOW}[~] geckodriver not found. Installing...${NC}"

# Try apt first
if command -v apt &>/dev/null; then
    echo -e "${DIM}    Trying apt...${NC}"
    sudo apt update -qq && sudo apt install -y firefox-geckodriver 2>/dev/null && {
        echo -e "${GREEN}[✓] Installed via apt${NC}"
        echo -e "    Location: $(which geckodriver)"
        exit 0
    }
    echo -e "${DIM}    apt failed, falling back to manual download.${NC}"
fi

# Manual download
arch="$(uname -m)"
case "$arch" in
    x86_64)  arch="linux64" ;;
    aarch64) arch="linux-aarch64" ;;
    *)       echo -e "${RED}[✗] Unsupported arch: $arch${NC}"; exit 1 ;;
esac

version="v0.35.0"
url="https://github.com/mozilla/geckodriver/releases/download/$version/geckodriver-$version-$arch.tar.gz"
tmp="$(mktemp -d)"

echo -e "${DIM}    Downloading geckodriver $version for $arch...${NC}"
if curl -sL "$url" | tar -xz -C "$tmp"; then
    mkdir -p "$HOME/.local/bin"
    cp "$tmp/geckodriver" "$HOME/.local/bin/geckodriver"
    chmod +x "$HOME/.local/bin/geckodriver"
    rm -rf "$tmp"
    echo -e "${GREEN}[✓] geckodriver $version installed to ~/.local/bin/geckodriver${NC}"
else
    rm -rf "$tmp"
    echo -e "${RED}[✗] Download failed. Try manually:${NC}"
    echo -e "    ${BOLD}$url${NC}"
    exit 1
fi