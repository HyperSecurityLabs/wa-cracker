# wa-cracker
A WhatsApp Framework That Your Mutual Fund Advisor Warned You About — Written in Rust, No Garbage Collector, No Regrets.
<div align="center">

```
                 __    __  _         ___   __    _    __          __  __
                / / /\ \ \/_\       / __\ /__\  /_\  / _\  /\  /\/__\/__\
                \ \/  \/ //_\\     / /   / \// //_\\ \ \  / /_/ /_\ / \//
                 \  /\  /  _  \===/ /___/ _  \/  _  \_\ \/ __  //__/ _  \
                  \/  \/\_/ \_/===\____/\/ \_/\_/ \_/\__/\/ /_/\__/\/ \_/
```

# WA-CRACKER

**A WhatsApp Framework That Your Mutual Fund Advisor Warned You About — Binary Edition**  
*HypersecurityOffensiveLabs · Pre-compiled · Ready-to-run*

`No Rust · No build · Just download and execute`

<br>

[![Linux](https://img.shields.io/badge/Platform-Linux-367bf0?style=for-the-badge&logo=kalilinux&logoColor=ffffff)]()
[![License](https://img.shields.io/badge/License-Premium-00C8B4?style=for-the-badge)]()
[![File](https://img.shields.io/badge/Format-Single_Binary-557C94?style=for-the-badge)]()
[![Telegram](https://img.shields.io/badge/Telegram-@hypersecurity__offsec-64D2FF?style=for-the-badge&logo=telegram&logoColor=ffffff)](https://t.me/hypersecurity_offsec)
[![Website](https://img.shields.io/badge/Website-HyperSecurity_Labs-00C8B4?style=for-the-badge&logo=google-chrome&logoColor=ffffff)](https://hypersecurityoffensivelabs-about.is-best.net/)
[![Forums](https://img.shields.io/badge/Community_Forums-b388ff?style=for-the-badge&logo=discourse&logoColor=ffffff)](https://hypersecurityoffensivelabs-about.is-best.net/forums/index.php)

</div>

---

## What is WA-CRACKER?

A **pre-compiled, single-binary** WhatsApp automation tool. No Python, no Node, no Rust toolchain. Just one file, one dependency (geckodriver), and unlimited possibilities.

**Firefox native** — default engine is Firefox via geckodriver. No Chrome. No bloat.

---

## Quick Start

```bash
# 1. Download the binary
# 2. Make it executable
chmod +x wacrash

# 3. Start geckodriver (install if needed)
pkill -9 geckodriver 2>/dev/null; sleep 1
geckodriver --port 4444 &

# 4. Run it
./wacrash web --target 923132594933 --message "hi" --count 5 --delay 2
```

---

## Commands

### `web` — WhatsApp Web Automation

Launch Firefox, navigate to target chat, send messages with human-like timing.

```
./wacrash web --target <number> --message "<text>" --count <N> --delay <secs>
```

| Flag | Default | Description |
|------|---------|-------------|
| `--target` | required | Full number with country code |
| `--message` | required | Message text |
| `--count` | `1` | Number of messages |
| `--delay` | `2` | Seconds between sends |
| `--session` | `default` | Profile name (saves login) |
| `--headless` | off | No browser GUI |
| `--port` | `4444` | WebDriver port |

### `crash` — Unicode Crash Payload

Generate and deliver Unicode crash payloads.

```
./wacrash crash --code 92 --phone 3132594933 --intensity 3 --count 3
```

| Flag | Default | Description |
|------|---------|-------------|
| `--code` | required | Country code |
| `--phone` | required | Phone number |
| `--intensity` | `3` | 1 → 5 scale |
| `--count` | `3` | Number of payloads |
| `--delay` | `10` | Seconds between sends |
| `--web` | off | Send via WhatsApp Web |
| `--open` | off | Open wa.me link |

### `link` — wa.me Link Generator

```
./wacrash link --code 92 --phone 3132594933 --message "hello"
```

### `session` — Profile Management

```
./wacrash session list
./wacrash session info <name>
./wacrash session delete <name>
./wacrash session clear
```

---

## Advanced Features

| Feature | Description |
|---------|-------------|
| **🦀 Unicode Payload Engine** | Generates text so cursed it makes WhatsApp question its life choices. Zero-width chars, combining marks, and other Unicode horrors from the depths of UTF-8 hell. |
| **🧠 execCommand Ninjutsu** | Injects text via a single JS call — one round-trip, zero hesitation. Bypasses WebDriver detection like a ghost in the REPL. CAPTCHA? Never met her. |
| **🔥 Nuclear Intensity Dial** | Scale of 1 to 5. At 5, your target's phone doesn't just crash — it considers a career change and relocates to a remote cabin in the woods. |
| **🔮 Session Persistence™** | Scan the QR code once. Forever. Your session outlives most startups and some marriages. Switch profiles like Netflix accounts. |
| **🕶️ Headless Mode** | Run without a GUI (Chrome only). No display? No problem. Works on servers, VPS, Raspberry Pis, toasters with Linux support, and that old laptop you use as a coffee stand. |
| **🎭 Multi-Profile Support** | Maintain separate sessions for "research," "more research," and "don't ask." Each with its own QR scan, cookies, and plausible excuse. |
| **🔐 Machine-Bound License** | Your license is more loyal than your ex. Bound to hardware fingerprint, XOR-encrypted, hidden in 3 locations with `chattr +i`. Tamper with it and the binary ratio-hoods you. |
| **🚫 No Python. No Node. No Docker.** | Zero dependencies. One binary. Your package manager will feel unemployed but your terminal will thank you. |

---

## Requirements

| Component | Notes |
|-----------|-------|
| **OS** | Linux (any distro) |
| **Firefox** | Installed (any recent version) |
| **geckodriver** | Download from GitHub — place in `~/.local/bin/` |

Nothing else. No Python. No Node. No Rust. No Java. No Docker. No containers.

---

## License Activation

WA-CRACKER is a **license-based premium tool**. First run prompts for activation:

1. Obtain password from **KhaninKali @ HyperSecurity Offensive Labs**
2. Run `./wacrash` and enter the password
3. License binds to your machine — valid for 30 days

**Contact for activation:**
- Telegram: [@hypersecurity_offsec](https://t.me/hypersecurity_offsec)
- Website: [HyperSecurity Labs](https://hypersecurityoffensivelabs-about.is-best.net/)
- Forums: [Community Forums](https://hypersecurityoffensivelabs-about.is-best.net/forums/index.php)

---

<div align="center">

[![Telegram](https://img.shields.io/badge/✉_Telegram-@hypersecurity__offsec-64D2FF?style=for-the-badge&logo=telegram&logoColor=000000)](https://t.me/hypersecurity_offsec)
[![Website](https://img.shields.io/badge/⎈_Website-HyperSecurity_Labs-00C8B4?style=for-the-badge&logo=google-chrome&logoColor=000000)](https://hypersecurityoffensivelabs-about.is-best.net/)
[![Forums](https://img.shields.io/badge/⎈_Community_Forums-b388ff?style=for-the-badge&logo=discourse&logoColor=000000)](https://hypersecurityoffensivelabs-about.is-best.net/forums/index.php)
[![Rust](https://img.shields.io/badge/⚙_Download_Rust-00C8B4?style=for-the-badge&logo=rust&logoColor=000000)](https://www.rust-lang.org/)

</div>

---

> **🔥 Check out [OXIDE v7.7.7-elite](https://github.com/HyperSecurityLabs/OxideCE-v7.7.7ELITE)** — Precision-forged Rust vulnerability scanner with ML detection, WAF bypass, headless JS crawling, distributed scanning, and Kali Linux integration. ⭐ Star it to help bring `sudo apt install oxide` to Kali!

> ⚠️ **WA-CRACKER is for authorized security testing only.** Unauthorized use against WhatsApp accounts violates ToS and may be illegal. You are responsible for complying with all applicable laws.
```
