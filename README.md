# Xbox360BadUpdate 1.2 17526 Port

An experimental work-in-progress port of [Grimdoomer’s Xbox360BadUpdate](https://github.com/grimdoomer/Xbox360BadUpdate) from dashboard **17559** to **17526**.

This is an unofficial side project made for research and learning. It is not affiliated with or supported by Grimdoomer.

> [!WARNING]
> This port is **not finished or confirmed working**. Some values are still missing or unverified. Do not run the current files on real hardware, it's just gonna freeze up. **This project DOES make the use of AI-assisted tools. Though every entry marked CHECKED is manually verified.**

![Status](https://img.shields.io/badge/status-work%20in%20progress-orange)
![Dashboard](https://img.shields.io/badge/dashboard-17526-blue)
![Testing](https://img.shields.io/badge/hardware-untested-red)
![Upstream](https://img.shields.io/badge/upstream-BadUpdate%20v1.2-purple)

## Current Progress

* [x] Created a 17526 kernel configuration
* [x] Kernel gadgets and functions manually verified 
* [x] Verify the remaining XAM functions and gadgets
* [x] ~~Confirm the 17526 HV system-call ordinals~~ placeholder for now, the HV didn't change as much as I thought?, code seems identical at a first glance.
* [ ] ~~Update the version-specific Stage 3 values~~ marked out baked addresses, might be better to mess with the c code instead?
* [ ] ~~Update the version-specific Stage 4 values~~ marked out baked addresses
* [ ] Prepare the clean 17526 HV restore segment
* [X] Does it compile?
* [ ] Build and inspect the completed binaries
* [x] ~~Test on hardware~~, sorta tested, I cannot debug anything as of now. I don't own a modded console... compiled as is 08/17/2026, no changes were made to Stage 1, 2, 3 and 4. Notes: didn't get "Running Exploit" to appear, instant freeze.
* [ ] Figure out how to compile BD 1.3?
* [ ] Move configs over to 1.3
* [ ] Port 1.3 aswell?

# FAQ
**Q: Why are you doing this?**  
A: well why not, i get to challenge myself, and this is kinda of fun.

**Q: Why 17526?, and what about my Dashboard?**  
A: if i get 17526 working, i plan to document the process so other ports are easier to attempt... as for why 17526 in specific?, it's the version my console just happens to be stuck in due to a 4gb emmc failure.

**Q: When will this release? Will it work?**  
A: no promises, I do know what to do and have stuff planned out for the port, such as "unhardcoding" a few things, but don't expect anything out of this.

**Q: Does this work on Blades/NXE consoles?**  
A: as for NXE and Blades, you wont be able to use Rock Band Blitz. It's probably a easier fix for NXE, just think of it as using ABadAvatar instead. Blades? Not entirely sure.

**Q: AI assisted?**  
A: yeah, but it isnt 'vibecoded', the addresses are being manually found by me using Ghidra, the only use of AI here is to help me get a better work flow going.. if this upsets you (no pun intended) feel free to ignore the project

**Q: Just do a RGH/16MB conversion.**  
A: no, sorry.

 
## Approach

Addresses are compared directly between the 17559 and 17526 files using Ghidra.

Every final value is manually checked against the corresponding function or instruction sequence before being marked as verified.

## Building

The project uses the original BadUpdate XePatcher build process.

Detailed build instructions will be added after the port has been completed and successfully tested.

## Repository Contents

This repository contains only my porting work, configuration files, notes, and related scripts.

~~Microsoft kernel, XAM, update, and decrypted HV files are not provided. You must obtain any required files by yourself.~~, Adding them as proof of concept under "Binaries/" if anyone wants to take a look. I'll explain how to get theses by yourself later (this means extracting them from any dashboard).

## Disclaimer

This project modifies low-level system software and is provided without any warranty.

Incorrect or incomplete values may cause crashes, freezes, data corruption, or other unintended behavior. Use it entirely at your own risk.

## Credits

* [Grimdoomer](https://github.com/grimdoomer) — original Xbox360BadUpdate project and research
* Everyone who documented Xbox 360 internals and made this kind of research possible
