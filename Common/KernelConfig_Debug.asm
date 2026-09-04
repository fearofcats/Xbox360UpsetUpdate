

# Build config template file. This file must be filled out for the kernel version you wish to target.
# See KernelConfig_Retail_17559.asm for a valid example.

# Comment out/remove this line after the config file has been setup.
.error "Kernel config file has not been setup"

# Specify the kernel version so the build config file knows the kernel addresses have been defined.
.set KRNL_VER,              0

# Kernel function addresses:
.set DbgPrint,                          0x00000000
.set DbgBreakPoint,                     0x00000000
.set HalSendSMCMessage,                 0x00000000
.set KeFlushCacheRange,                 0x00000000
.set KeLockL2,                          0x00000000
.set KeStallExecutionProcessor,         0x00000000
.set MmFreePhysicalMemory,              0x00000000
.set MmGetPhysicalAddress,              0x00000000
.set NtAllocateVirtualMemory,           0x00000000
.set NtClose,                           0x00000000
.set ObCreateSymbolicLink,              0x00000000
.set RtlInitAnsiString,                 0x00000000
.set VdDisplayFatalError,               0x00000000
.set XexLoadImage,                      0x00000000
.set XexUnloadImage,                    0x00000000

.set memcmp,                            0x00000000  # Can be substituted for XeCryptMemDiff if memcmp is not available (or anything with same signature and behavior) (do NOT use RtlCompareMemory, it doesn't return 0 on matching data)

# System call functions:
.set HvxKeysExGetKey,                   0x00000000
.set HvxKeysExSetKey,                   0x00000000
.set HvxEncryptedReserveAllocation,     0x00000000
.set HvxEncryptedReleaseAllocation,     0x00000000
.set HvxEncryptedEncryptAllocation,     0x00000000
.set HvxFlushDCacheRange,               0x00000000

# System call ordinals:
.set sc_HvxPostOutputExploit,           0x00
.set sc_HvxFlushUserModeTb,             0x00
.set sc_HvxKeysExecute,                 0x00
.set sc_HvxEncryptedReserveAllocation,  0x00
.set sc_HvxEncryptedEncryptAllocation,  0x00
.set sc_HvxEncryptedReleaseAllocation,  0x00
.set sc_HvxRevokeUpdate,                0x00

.set sc_HvxArbWriteSyscall,             sc_HvxFlushUserModeTb

# Boot animation addresses:
.set BootAnimCodePageAddress,           0x98030000

# Xam function addresses:
.set CreateFileA,                       0x00000000  # Export 1095
.set GetFileSize,                       0x00000000  # Export 1063
.set ReadFile,                          0x00000000  # Export 1052
.set WriteFile,                         0x00000000  # Export 1054
.set CloseHandle,                       0x00000000  # Export 1044

.set CreateThread,                      0x00000000  # Export 1084
.set ResumeThread,                      0x00000000  # Export 1085
.set GetLastError,                      0x00000000  # Export 1006

.set memcpy,                            0x00000000
.set memset,                            0x00000000

.set XamLoaderLaunchTitle,              0x00000000  # Export 420
.set XamLoaderTerminateTitle,           0x00000000  # Export 425
.set XLaunchNewImage,                   XamLoaderLaunchTitle


###########################################################
# Kernel gadget address.

#   addi    r1, r1, 0xA0
#   b       __restgprlr_24
.set    __restgprlr_24,                 0x00000000      # .fill 0x58, 1, 0x00

#   addi    r1, r1, 0x90
#   b       __restgprlr_26
.set    __restgprlr_26,                 0x00000000      # .fill 0x58, 1, 0x00

#   addi    r1, r1, 0x80
#   b       __restgprlr_27
.set    __restgprlr_27,                 0x00000000      # .fill 0x50, 1, 0x00

#   addi    r1, r1, 0x80
#   b       __restgprlr_28
.set    __restgprlr_28,                 0x00000000      # .fill 0x58, 1, 0x00

#   addi    r1, r1, 0x70
#   b       __restgprlr_29
.set    __restgprlr_29,                 0x00000000      # .fill 0x50, 1, 0x00

#   addi    r1, r1, 0x70
#   lwz     r12, -0x8(r1)
#   mtlr    r12
#   ld      r30, -0x18(r1)
#   ld      r31, -0x10(r1)
#   blr
.set    __restgprlr_30,                 0x00000000      # .fill 0x58, 1, 0x00

#   addi    r1, r1, 0x60
#   lwz     r12, -0x8(r1)
#   mtlr    r12
#   ld      r31, -0x10(r1)
#   blr
.set    __restgprlr_31,                 0x00000000      # .fill 0x50, 1, 0x00

#   stw     r3, 0(r31)
#   addi    r1, r1, 0x60
#   lwz     r12, -0x8(r1)
#   mtlr    r12
#   ld      r31, -0x10(r1)
#   blr
.set    stw_r3,                         0x00000000      # .fill 0x50, 1, 0x00

#   mr      r3, r31
#   addi    r1, r1, 0x70
#   lwz     r12, -8(r1)
#   mtlr    r12
#   ld      r31, -0x10(r1)
#   blr
.set    mr_r31_to_r3,                   0x00000000      # .fill 0x60, 1, 0x00

#   mr      r11, r31
#   mr      r3, r11
#   addi    r1, r1, 0x70
#   lwz     r12, -8(r1)
#   mtlr    r12
#   ld      r30, -0x18(r1)
#   ld      r31, -0x10(r1)
#   blr
.set    mr_r31_to_r11,                  0x00000000      # .fill 0x58, 1, 0x00

#   mtctr   r31
#   bctrl
#   addi    r1, r1, 0x60
#   lwz     r12, -8(r1)
#   mtlr    r12
#   ld      r31, -0x10(r1)
#   blr
.set    call_func_dispatch,             0x00000000      # .fill 0x50, 1, 0x00


###########################################################
# Xam gadget address.

#   lwz     r1, 0(r1)
#   lwz     r12, -8(r1)
#   mtlr    r12
#   blr
.set    stack_pivot,                    0x00000000

#   lwz     r3, 0(r31)
#   addi    r1, r1, 0x60
#   lwz     r12, var_8(r1)
#   mtlr    r12
#   ld      r31, var_10(r1)
#   blr
.set    lwz_r3,                         0x00000000      # .fill 0x50, 1, 0x00

#   lwz     r11, 0(r3)
#   stw     r11, 8(r4)
#   li      r3, 0
#   blr
.set    lwz_r3_stw_r4,                  0x00000000
.set    lwz_r3_stw_r4__r3_disp,         0               # Displacement for r3 load
.set    lwz_r3_stw_r4__r4_disp,         0               # Displacement for r4 store

#   lwz     r10, 0(r3)
#   slwi    r11, r11, 2
#   add     r3, r11, r10
#   blr
.set    lwz_r10,                        0x00000000

#   lwz     r11, 8(r31)
#   addi    r3, r11, -1
#   addi    r1, r1, 0x70
#   lwz     r12, -8(r1)
#   mtlr    r12
#   ld      r30, -0x18(r1)
#   ld      r31, -0x10(r1)
#   blr
.set    lwz_r11_off_r31,                0x00000000      # .fill 0x58, 1, 0x00

#   stw     r30, 0(r31)
#   addi    r1, r1, 0x70
#   lwz     r12, -8(r1)
#   mtlr    r12
#   ld      r30, -0x18(r1)
#   ld      r31, -0x10(r1)
#   blr
.set    stw_r30_on_r31,                 0x00000000      # .fill 0x58, 1, 0x00

#   lwz     r11, 4(r31)
#   stw     r3, 0(r11)
#   li      r3, 0
#   addi    r1, r1, 0x60
#   lwz     r12, -8(r1)
#   mtlr    r12
#   ld      r31, -0x10(r1)
#   blr
.set    stw_r3_onto_pointer,            0x00000000      # .fill 0x50, 1, 0x00

#   lwz     r10, 8(r11)
#   add     r10, r5, r10
#   stw     r10, 8(r11)
#   blr
.set    load_add_store_r10_r5_on_r11,   0x00000000

#   mr      r7, r25
#   mtctr   r30
#   mr      r6, r26
#   mr      r5, r27
#   mr      r4, r28
#   mr      r3, r29
#   bctrl
.set    call_func_preload,              0x00000000

# Default register values for unused parameters to call_func_preload:
.set    cf_r3_def,                      0x00000000
.set    cf_r4_def,                      0x00000000
.set    cf_r5_def,                      0x00000000
.set    cf_r6_def,                      0x00000000
.set    cf_r7_def,                      0x00000000

# Offsets for low half of argument registers in CALL_FUNC_LABEL macro:
.set    cf_r3_offset,                   0x00
.set    cf_r4_offset,                   0x00
.set    cf_r5_offset,                   0x00
.set    cf_r6_offset,                   0x00
.set    cf_r7_offset,                   0x00

#   mr      r3, r1
#   blr
.set    mr_r1_to_r3,                    0x00000000

#   blr
.set    blr_nop,                        0x00000000

#   cmplwi  r3, 0
#   li      r3, 0
#   beq     loc_817F031C
#       li      r3, 1
#
#   addi    r1, r1, 0x60
#   lwz     r12, -8(r1)
#   mtlr    r12
#   ld      r31, -0x10(r1)
#   blr
.set    clamp_r3,                       0x00000000      # .fill 0x50, 1, 0x00

#   slwi    r10, r3, 2
#   addi    r11, r11, 0x3D64
#   lwzx    r3, r10, r11
#   blr
.set    mul_r3_4_lwzx_r11,              0x00000000
.set    mul_r3_4_lwzx_r11__disp,        0x0000

#   lwz     r11, 0x18(r31)
#   add     r11, r30, r11
#   stw     r11, 0x18(r31)
#   addi    r1, r1, 0x70
#   lwz     r12, -8(r1)
#   mtlr    r12
#   ld      r30, -0x18(r1)
#   ld      r31, -0x10(r1)
#   blr
.set    load_add_store_r11_r30_on_r31,          0x00000000      # .fill 0x58, 1, 0x00
.set    load_add_store_r11_r30_on_r31__disp,    0x00

#   lwz     r11, 0(r31)
#   mtctr   r11
#   bctrl
.set    call_ptr_off_r31,                       0x00000000
