Rock Band Blitz Stage 1 patch confirmed. Execution reaches Stage 2 and proceeds substantially into Stage 3, whose values haven't yet been updated for 17526.

![banner](./content.png)

UpsetUpdate

A personal attempt at porting BadUpdate to Xbox 360 kernel version 17526. That's pretty much it. This repository is my workbench for figuring out how much 17559-specific bullshit needs to be changed before my weird Xbox 360 will cooperate.

«[!WARNING]
This port is not finished or confirmed working. AI has been used.»

Current Progress

* [x] Successfully hex-edited the prebuilt Rock Band Blitz Stage 1 for 17526
* [x] Created a 17526 kernel configuration
* [x] Verified all kernel functions and gadgets
* [x] Verified all XAM functions and gadgets
* [x] Cross-checked the syscall ordinals against the 17526 HV image
* [x] Completed an initial hardware test
* [ ] Research Stage 3
* [ ] Final review for Stage 3 and Stage 4
* [ ] Update the version-specific Stage 3 values
* [ ] Update the version-specific Stage 4 values
* [ ] Prepare the clean 17526 HV restore segment
* [ ] Build and inspect the completed binaries
* [x] Reach Stage 2
* [x] Reach Stage 3
* [ ] Reach Stage 4
* [ ] Build a XeUnshackle port for 17526
* [ ] Completion

Repository Contents

The "Binaries/" directory contains the 17526 and 17559 files used for comparison in Ghidra. These are research inputs.

The "Tools/" directory contains Grimdoomer's XePatcher 3.1.

Credits

* "Grimdoomer" (https://github.com/grimdoomer) — original Xbox360BadUpdate project and research
* "InvoxiPlayGames" (https://github.com/InvoxiPlayGames) — Rock Band Blitz entry-point work
* Everyone who documented Xbox 360 internals and made this kind of research possible.
