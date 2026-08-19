# Xbox360UpsetUpdate — Dashboard 17526

An experimental work-in-progress port of [Grimdoomer's Xbox360BadUpdate](https://github.com/grimdoomer/Xbox360BadUpdate) from dashboard **17559** to **17526**. The current tree is based on BadUpdate v1.2, with a future migration to [ABadAvatar](https://github.com/shutterbug2000/ABadAvatar) planned.

This is an unofficial side project made for research and learning. It is not affiliated with or supported by the upstream developers.

> [!WARNING]
> This port is **not finished or confirmed working**. Some dashboard-specific values are still missing or unverified. Do not run the current files on real hardware; they are expected to freeze or fail. **AI-assisted tools have been used, but every entry marked `CHECKED` has been manually inspected.**

![Status](https://img.shields.io/badge/status-work%20in%20progress-orange)
![Dashboard](https://img.shields.io/badge/dashboard-17526-blue)
![Upstream](https://img.shields.io/badge/upstream-BadUpdate%20v1.2-green)

## Current Progress (in priority order)

* [ ] Migrate to [ABadAvatar](https://github.com/shutterbug2000/ABadAvatar)
* [x] Create a 17526 kernel configuration
* [x] Re-verify all kernel functions and gadgets
* [x] Verify all XAM functions and gadgets
* [x] Verify 17526 syscall ordinals from kernel wrappers
* [ ] Cross-check the syscall ordinals against the 17526 HV image
* [ ] Update the version-specific Stage 3 values
* [ ] Update the version-specific Stage 4 values
* [ ] Prepare the clean 17526 HV restore segment
* [ ] Build and inspect the completed binaries
* [ ] Test on hardware

## FAQ

**Q: Why are you doing this?**

A: Why not? I wanted to challenge myself and learn more about how the exploit works.

**Q: Why 17526, and what about my dashboard?**

A: 17526 is the dashboard version I am targeting. If the port works, I plan to document the process thoroughly so other versions are easier to attempt. No promises yet.

**Q: When will this release? Will it work?**

A: I do not know yet. This is experimental, and I do not want to promise a working release before it has been completed and tested.

**Q: Does this work on Blades or NXE consoles?**

A: Blades and NXE have not been investigated for this project.

**Q: Is this AI-assisted?**

A: Yes, but it is not “vibecoded.” AI has helped organize the workflow and review repetitive work, while every verified address has been located and manually inspected in Ghidra.

## Approach

Addresses are compared directly between the 17559 and 17526 files using Ghidra.

Every value marked `CHECKED` has been manually compared with the corresponding function or instruction sequence. This indicates manual verification of that individual value, not validation of the complete exploit chain.

## Building

The project currently retains the original BadUpdate XePatcher build process.

Detailed 17526-specific build instructions will be added after the remaining porting work has been completed and the generated binaries have been inspected.

## Repository Contents

This repository contains my porting work, the inherited upstream source, configuration files, and reference files used during address comparison.

The `Binaries/` directory contains the 17526 and 17559 files used for comparison in Ghidra. These are research inputs, not finished release files. I plan to document how to reproduce the analysis setup later.

## Disclaimer

This project modifies low-level system software and is provided without any warranty.

Incorrect or incomplete values may cause crashes, freezes, data corruption, or other unintended behavior. Use it entirely at your own risk.

## Credits

* [Grimdoomer](https://github.com/grimdoomer) — original Xbox360BadUpdate project and research
* [Shutterbug2000](https://github.com/shutterbug2000) — ABadAvatar project
* [InvoxiPlayGames](https://github.com/InvoxiPlayGames) — Rock Band Blitz entry-point work
* Everyone who documented Xbox 360 internals and made this kind of research possible.
