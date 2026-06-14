#!/bin/bash

BOLD='\033[1m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

GECKO=$(which geckodriver 2>/dev/null || echo "$HOME/.local/bin/geckodriver")

if [ ! -x "$GECKO" ]; then
    echo -e "${RED}[✗] geckodriver not found at: $GECKO${NC}"
    echo -e "${YELLOW}    Run ./installgecko.sh first${NC}"
    exit 1
fi

kill_old() {
    local pid
    pid=$(pidof geckodriver 2>/dev/null) && {
        echo -e "${YELLOW}[!] Killing old geckodriver (PID: $pid)${NC}"
        kill "$pid" 2>/dev/null
        sleep 1
    }
}

cleanup() {
    echo -e "\n${YELLOW}[!] Stopping geckodriver...${NC}"
    local pid
    pid=$(pidof geckodriver 2>/dev/null) && kill "$pid" 2>/dev/null
    exit 0
}
trap cleanup SIGINT SIGTERM

kill_old

PORT="${1:-4444}"

echo -e "${BOLD}${CYAN}"
echo "  ╔══════════════════════════════════════╗"
echo "  ║       GECKODRIVER LAUNCHER           ║"
echo "  ╚══════════════════════════════════════╝"
echo -e "${NC}"
echo -e "  ${GREEN}→ Binary:${NC} $GECKO"
echo -e "  ${GREEN}→ Port:${NC}   $PORT"
echo -e "  ${GREEN}→ Ctrl+C${NC} to stop\n"

"$GECKO" --port "$PORT" --log fatal &
GECKO_PID=$!

sleep 1
if kill -0 "$GECKO_PID" 2>/dev/null; then
    echo -e "  ${CYAN}✓ geckodriver running (PID: $GECKO_PID) on port $PORT${NC}\n"
else
    echo -e "  ${RED}[✗] geckodriver failed to start${NC}"
    exit 1
fi

wait "$GECKO_PID"
