#!/usr/bin/env python3
import os
import sys
import time

PINK="[38;2;255;79;184m"
BUBBLE="[38;2;255;179;230m"
LAV="[38;2;199;167;255m"
SKY="[38;2;149;220;255m"
MINT="[38;2;184;255;217m"
BUTTER="[38;2;255;243;166m"
WHITE="[38;2;255;247;253m"
DIM="[38;2;231;138;197m"
RESET="[0m"
BOLD="[1m"


def line(text=""):
    print(text, flush=True)


def pause(seconds=0.35):
    time.sleep(seconds)


def clear():
    print("[2J[H", end="", flush=True)


def main():
    clear()
    line(f"{BOLD}{PINK}♡  🎀  ♡   NEKO BABY   ♡  🐾  ♡{RESET}")
    line(f"{BUBBLE}/\\_/\\  strawberry milk terminal magic  /\\_/\\{RESET}")
    line(f"{PINK}( o.o )  pink paws online, bows charged  ( o.o ){RESET}")
    line(f"{BUTTER}  > ♡ <    nyan sparkle command parlor    > ♡ <{RESET}")
    line(f"{DIM}╭────────────────────────────────────────────╮{RESET}")
    line(f"{WHITE}│ compact chibi TUI  ✦  Comic Mono launcher │{RESET}")
    line(f"{BUBBLE}│ ♡ฅ prompt  ✦  neko pet  ✦  candy tools   │{RESET}")
    line(f"{DIM}╰────────────────────────────────────────────╯{RESET}")
    pause(0.7)

    line()
    cat = [
        "   /\\_/\\       🎀",
        "  ( o.o )   ♡  neko pet pane",
        "   > ♡ <        focused catgirl view",
    ]
    for row in cat:
        line(f"{BUBBLE}{row}{RESET}")
        pause(0.18)

    line()
    line(f"{PINK}♡ฅ{RESET} {WHITE}neko-baby profile{RESET}")
    pause(0.25)
    line(f"{MINT}✓ profile:{RESET} neko-baby")
    line(f"{MINT}✓ model:{RESET} gpt-5.5 via openai-codex")
    line(f"{MINT}✓ skin:{RESET} candy pink Neko Baby")
    line(f"{MINT}✓ font launcher:{RESET} Comic Mono only for neko-baby")
    pause(0.7)

    line()
    frames=[
      "♡ฅ(=^･ω･^=)ฅ♡ stitching a lace bow",
      "🎀(=✪ᆽ✪=)🎀 charging the nyan rainbow",
      "ฅ^ >ヮ< ^ฅ polishing jellybean paws",
      "(=^‥^=)💭 warming the strawberry milk",
    ]
    for f in frames:
        line(f"{PINK}🎀🐾 Neko Baby 🐾🎀{RESET} {BUBBLE}{f}{RESET}")
        pause(0.45)

    line()
    tools=[("🐾", "terminal", "running compact smoke check"), ("🎀", "read_file", "opening skin config"), ("🧁", "patch", "tightening banner height"), ("🌈", "web", "ready for docs and demos")]
    for emoji, name, msg in tools:
        line(f"{PINK}💗 {emoji} {name:<10}{RESET} {WHITE}{msg}{RESET}")
        pause(0.32)

    line()
    line(f"{DIM}╭────────────────────────────────────────────╮{RESET}")
    line(f"{WHITE}│ {PINK}Neko Baby:{RESET} {WHITE}Purrfect. The opening view fits, │{RESET}")
    line(f"{WHITE}│ the font is scoped, and the UI stays nyan. │{RESET}")
    line(f"{DIM}╰────────────────────────────────────────────╯{RESET}")
    pause(1.2)

if __name__ == '__main__':
    main()
