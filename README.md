# Xbox360BadUpdate 1.2 17526 Port

An experimental work-in-progress port of [Grimdoomer’s Xbox360BadUpdate](https://github.com/grimdoomer/Xbox360BadUpdate) from dashboard **17559** to **17526**.

This is an unofficial side project made for research and learning. It is not affiliated with or supported by Grimdoomer.

> [!WARNING]
> This port is **not finished or confirmed working**. Some values are still missing or unverified. Do not run the current files on real hardware, it's just gonna freeze up. **This makes the use of AI-assisted tools. Though every entry marked CHECKED is manually verified.**

![Status](https://img.shields.io/badge/status-work%20in%20progress-orange)
![Dashboard](https://img.shields.io/badge/dashboard-17526-blue)
![Testing](https://img.shields.io/badge/hardware-untested-red)
![Upstream](https://img.shields.io/badge/upstream-BadUpdate%20v1.2-purple)

## Current Progress

* [x] Created a 17526 kernel configuration
* [x] Kernel gadgets and functions manually verified 
* [ ] Verify the remaining XAM functions and gadgets
* [ ] Confirm the 17526 HV system-call ordinals
* [ ] Update the version-specific Stage 3 values
* [ ] Update the version-specific Stage 4 values
* [ ] Prepare the clean 17526 HV restore segment
* [ ] Build and inspect the completed binaries
* [ ] Test on my hardware

## Approach

Addresses are compared directly between the 17559 and 17526 files using Ghidra.

Address deltas are used only as hints. Every final value is manually checked against the corresponding function or instruction sequence before being marked as verified.

A small Python tool may be used to apply the confirmed replacements, but it will not blindly shift every address by one global delta.

## Building

The project uses the original BadUpdate XePatcher build process.

Detailed build instructions will be added after the port has been completed and successfully tested.

## Repository Contents

This repository contains only my porting work, configuration files, notes, and related scripts.

Microsoft kernel, XAM, update, and decrypted HV files are not provided. You must obtain any required files yourself from software you legally own.

## Disclaimer

This project modifies low-level system software and is provided without any warranty.

Incorrect or incomplete values may cause crashes, freezes, data corruption, or other unintended behavior. Use it entirely at your own risk.

## Credits

* [Grimdoomer](https://github.com/grimdoomer) — original Xbox360BadUpdate project and research
* Everyone who documented Xbox 360 internals and made this kind of research possible
