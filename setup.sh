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
echo "║    WA-CRACKER — Build & Launch                          ║"
echo "║    A WhatsApp Framework Your MF Advisor Warned You About ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo -e "${NC}"

# ─── Step 0: Check Rust ───────────────────────────────────────
check_rust() {
    if ! command -v rustc &>/dev/null; then
        echo -e "${YELLOW}[!] Rust not found.${NC}"
        echo -e "    Install it: ${BOLD}curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh${NC}"
        echo -e "    Then re-run this script."
        exit 1
    fi
    echo -e "${GREEN}[✓] Rust found: $(rustc --version)${NC}"
}

# ─── Step 1: Ensure geckodriver is running ────────────────────
start_geckodriver() {
    if curl -s http://localhost:4444/status >/dev/null 2>&1; then
        echo -e "${GREEN}[✓] geckodriver already running on :4444${NC}"
        return 0
    fi

    local gd
    gd="$(command -v geckodriver)"
    if [ -z "$gd" ]; then
        echo -e "${YELLOW}[!] geckodriver not found. Run ./installgecko.sh first.${NC}"
        exit 1
    fi

    echo -e "${YELLOW}[~] Starting geckodriver...${NC}"
    nohup "$gd" --log fatal > /dev/null 2>&1 & disown
    sleep 1

    if curl -s http://localhost:4444/status >/dev/null 2>&1; then
        echo -e "${GREEN}[✓] geckodriver started on :4444${NC}"
    else
        echo -e "${RED}[✗] Failed to start geckodriver${NC}"
        exit 1
    fi
}

# ─── Step 2: Build project ────────────────────────────────────
build_project() {
    local script_dir
    script_dir="$(cd "$(dirname "$0")" && pwd)"

    if [ ! -f "$script_dir/Cargo.toml" ]; then
        echo -e "${RED}[✗] Cargo.toml not found in $script_dir${NC}"
        echo -e "    Run this script from the WA-CRACKER directory."
        exit 1
    fi

    echo -e "${YELLOW}[~] Building WA-CRACKER (go make tea)...${NC}"
    cargo build --release -j2 2>&1 | sed 's/^/    /'
    cp "$script_dir/target/release/wacrash" "$script_dir/wacrash"
    echo -e "${GREEN}[✓] Build complete: $script_dir/wacrash${NC}"
}

# ─── Go ───────────────────────────────────────────────────────
check_rust
start_geckodriver
build_project

BINARY="$(cd "$(dirname "$0")" && pwd)/wacrash"

echo ""
echo -e "${CYAN}╔══════════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║${NC}  ${BOLD}All systems go, captain!${NC}                            ${CYAN}║${NC}"
echo -e "${CYAN}║${NC}                                                       ${CYAN}║${NC}"
echo -e "${CYAN}║${NC}  Binary:  ${BOLD}$BINARY${NC}                         ${CYAN}║${NC}"
echo -e "${CYAN}║${NC}  Driver:  ${BOLD}http://localhost:4444${NC}                       ${CYAN}║${NC}"
echo -e "${CYAN}║${NC}                                                       ${CYAN}║${NC}"
echo -e "${CYAN}║${NC}  Quick commands:                                       ${CYAN}║${NC}"
echo -e "${CYAN}║${NC}    $BINARY web --target PHONE --message \"Hi\" --count 5   ${CYAN}║${NC}"
echo -e "${CYAN}║${NC}    $BINARY crash --code 92 --phone PHONE --intensity 5   ${CYAN}║${NC}"
echo -e "${CYAN}║${NC}    $BINARY session list                                ${CYAN}║${NC}"
echo -e "${CYAN}║${NC}                                                       ${CYAN}║${NC}"
echo -e "${CYAN}╚══════════════════════════════════════════════════════════╝${NC}"
echo ""
