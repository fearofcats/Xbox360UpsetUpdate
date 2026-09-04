# UpsetUpdate

> [!WARNING]
> **AI used.** Port is unfinished.

An attempt to port Xbox 360 BadUpdate from dashboard 17559 to 17526.

# Currently just ramblings for now. I'll write proper documentation later, I promise.

So, initially, I was just porting BU to 17526 because I had a faulty Corona where the 4GB internal storage had failed, so it wouldn't update to 17559. I really wanted homebrew, so that was the goal. Since then, I was lucky enough to get a Jasper for really cheap, so I kinda abandoned this since I had the homebrew I was determined to get. I'm revisiting this just because it was really fun to work on.

## Stages 3/4

Currently still use baked-in addresses. They're not as intimidating now that I've started digging into them. I reckon only a few lines actually need patching; I haven't reached the actual porting work for these stages yet. Check out `Stage3/stage3.txt`.

## Stage 2

Stage 2 currently fails for no apparent reason. I've exhausted pretty much every idea I had for debugging it. Even using the LEDs as checkpoints didn't help, btw it fails checkpoint 7.

I'll look more into it, but at this point I'll likely just migrate to BU 1.3 and pray.

## Stage 1

For Stage 1, only two addresses needed patching. Here's how I found them.

During the `songs.dta` section of `DaTArrest_Xbox360BadUpdate`, values should be calculated as:

`str(hex_address as signed int32)`

-2146914576 → 0x8008AEF0 (ObCreateSymbolicLink)  
-2123213956 → 0x8172537C (stack_pivot + 4)  

Everything else is game-specific. The addresses seen above are for 17559. I've patched them for 17526 using HxD and converting the new addresses back to signed int32 values..

## Address shenanigans.

It turns out address automation is actually pretty simple.

```python
import pefile
import sys

pe = pefile.PE(sys.argv[1], fast_load=False)
pe.parse_data_directories()

for exp in pe.DIRECTORY_ENTRY_EXPORT.symbols:
    if exp.address:
        va = pe.OPTIONAL_HEADER.ImageBase + exp.address
        print(f"{exp.ordinal} -> 0x{va:08X}")
```

That's basically all the code you need. (at least, it's what I used for `xboxkrnl`)

For kernel/XAM addresses, I assumed that porting to another dashboard would mean manually hunting down every address and updating them individually. Turns out there's this file named `x360_imports.idc`... You can just parse the exports in order, then use that file as a table to map the ordinals to their actual names. FFS.

In hindsight, I was probably asking RGH modders questions that were way more software-engineering-y than I realized. Gadgets still need to be verified manually, obviously, so my work isn't all for nothing at least. Special thanks to bibarub for trying to guide me anyway.

Check out both `Common/Xam_Retail_17526.asm` and `Common/KernelExports_Retail_17526.asm`. They should technically follow the same format as BU 1.3.

## Obtaining Kernel/HV binaries (roughly)

Download the desired dashboard version and extract the `$SystemUpdate` folder. I got mine from Digiex. Inside the `$SystemUpdate` folder, you'll need to extract `su20076000_00000000` with [wxPirs](https://digiex.net/attachments/wxpirs-1-1-rar.7438/).

You should now have `xboxupd.bin`. Apply the CF+CG patch to `ce_1888.bin` with [xenon-bltool](https://github.com/InvoxiPlayGames/xenon-bltool). Split the resulting file (should be `hvkernel_1xxxx`) at `0x40000`. Congrats, you did it. The smaller file should be the HV; rename it accordingly.

Then use Ghidra or parse it and use a table, whatever the fuck masochist shit you wanna do.

## Shit I need to figure out

- Why the fuck Stage 2 is failing? (KeFlushCacheRange?, memcmp?...)
- Whether Stage 3 depends on anything still hardcoded for 17559 (can't test)
- How much of this can actually be automated without making things worse (surface level help for porting other dashboards rather than 17526?)
- Is ABadAvatar implementation still unviable?... likely (Stage 0 stack_pivot...)
- Why Reddit hates me

## Current state

### Working
- Stage 1
- Kernel/XAM address extraction/manual finding
- Syscall ordinal mapping (-2 shift)

### Broken
- Stage 2 — freezes at LED checkpoint 7
- Stage 3/4 — unported

## Current Progress

* [ ] Migrate to BU 1.3
* [x] Hex-edited Stage 1
* [ ] Identify why Stage 2 fails
* [ ] Verify Kernel, XAM, and gadget addresses manually
* [x] Cross-checked the syscall ordinals (should remain the same)
* [ ] Update Stage 2/3/4 values
* [ ] Prepare HV restore segment
* [ ] Automate HV restore segment
* [ ] Port XeUnshackle

## Credits

* [Grimdoomer](https://github.com/grimdoomer) BadUpdate
* [InvoxiPlayGames](https://github.com/InvoxiPlayGames) Rock Band Blitz entry-point
