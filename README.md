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
