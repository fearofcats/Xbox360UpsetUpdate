
###########################################################
# Tony Hawk function addresses.

# XTL functions:
.set XPhysicalAlloc,                        0x822DA430
.set XSetThreadProcessor,                   0x822DA2E0


###########################################################
# Tony Hawk data addresses.
.set RuntimeDataSegmentAddress,             0x8275D600  # We use the .binkdata section as a temporary data segment


###########################################################
# Save file constants
.set GapDataStartFileOffset,                0xDF4       # Offset of the gap data in the save file
.set GapDataStartHeapAddress,               0xB43B682E  # Address of the gap data on the heap
.set OriginalStackPointer,                  0x7004F2F0  # Stack pointer value upon exiting the load park function

