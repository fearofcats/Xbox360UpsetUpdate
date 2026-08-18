# Xbox360UpsetUpdate 17526.

An experimental work-in-progress port of [Grimdoomer’s Xbox360BadUpdate](https://github.com/grimdoomer/Xbox360BadUpdate) from dashboard **17559** to **17526**, currently using 1.2 as a base.

This is an unofficial side project made for research and learning. It is not affiliated with or supported by Grimdoomer.

> [!WARNING]
> This port is **not finished or confirmed working**. Some values are still missing or unverified. Do not run the current files on real hardware, it is expected to freeze or fail. **This project DOES make the use of AI-assisted tools. Though every entry marked CHECKED is manually verified.**

being tested as is currently, no major changes made to Stage 1, 2, 3 and 4 yet. 
Notes: "Running Exploit" did not appear, instant freeze.

![Status](https://img.shields.io/badge/status-work%20in%20progress-orange)
![Dashboard](https://img.shields.io/badge/dashboard-17526-blue)
![Upstream](https://img.shields.io/badge/upstream-BadUpdate%20v1.2-green)

## Current Progress (sorted by priority.)

* [x] Created a 17526 kernel configuration
* [ ] Verify whether 17526's bootanim.xex addresses might've changed and if thats exploit terminating
* [ ] Kernel gadgets and functions manually verified sanity check
* [ ] Verify the remaining XAM functions and gadgets. uncertain, sanity check/second opinion?
* [ ] ~~Confirm the 17526 HV system-call ordinals~~ placeholder, needs research
* [ ] Update the version-specific Stage 4 values 
* [ ] Prepare the clean 17526 HV restore segment
* [ ] Build and inspect the completed binaries
* [ ] Test on hardware

# FAQ
**Q: Why are you doing this?**  
A: well why not, it's to challenge myself.

**Q: 17526?, and what about my Dashboard?**  
A: if 17526 ends up working, i plan to document the process thoroughly so other ports are easier to attempt, again no promises.

**Q: When will this release? Will it work?**  
A: no promises, i'm not certain. don't expect anything out of this.

**Q: Does this work on Blades/NXE consoles?**  
A: NXE and Blades have not been investigated.

**Q: AI assisted?**  
A: yeah, but it isnt 'vibecoded', the addresses are being manually found by me using Ghidra, the only use of AI here is to help me get a better work flow going.. if this upsets you (no pun intended) feel free to ignore the project

 
## Approach

Addresses are compared directly between the 17559 and 17526 files using Ghidra.

Every final value is manually checked against the corresponding function or instruction sequence before being marked as verified.

## Building

The project uses the original BadUpdate XePatcher build process.

Detailed build instructions will be added after the port has been completed and successfully tested.

## Repository Contents

This repository contains my porting work, configuration files, notes, and related scripts.

~~Microsoft kernel, XAM, update, and decrypted HV files are not provided. You must obtain any required files by yourself.~~ Adding them as proof of concept under "Binaries/" if anyone wants to take a look. I'll explain how to get these by yourself later (this means extracting them from any dashboard).

## Disclaimer

This project modifies low-level system software and is provided without any warranty.

Incorrect or incomplete values may cause crashes, freezes, data corruption, or other unintended behavior. Use it entirely at your own risk.

## Credits

* [Grimdoomer](https://github.com/grimdoomer) — original Xbox360BadUpdate project and research
* Everyone who documented Xbox 360 internals and made this kind of research possible
