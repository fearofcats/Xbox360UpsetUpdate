###########################################################
# Avatar function addresses.

# XTL functions:
.set XPhysicalAlloc,                        0x92811B50
.set XSetThreadProcessor,                   0x921985A0


###########################################################
# Avatar data addresses.
.set RuntimeDataSegmentAddress,             0x43570000  # From the comically large allocation

.set Stage1Address,                         0x43670000  # From the comically large allocation

.set second_stage_chain_addressA,            0x43270000  # From the comically large allocation

.set overwrite_loop_secondary_buffer_address_hardcoded,  0x43200000  # From the comically large allocation


###########################################################
# Avatar item constants
.set RawFileAddress,                        0x43AB9AC8  # Address of the gap data on the heap