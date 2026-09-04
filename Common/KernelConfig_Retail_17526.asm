.set KRNL_VER, 17526

.set HalSendSMCMessage,                      0x80067F48
.set KeLockL2,                               0x80071E00
.set KeStallExecutionProcessor,              0x80073484
.set KeFlushCacheRange,                      0x80073850
.set XexUnloadImage,                         0x8007C838
.set XexLoadImage,                           0x8007CF10
.set HvxFlushDCacheRange,                    0x8007F0B8
.set MmGetPhysicalAddress,                   0x8007F798
.set MmFreePhysicalMemory,                   0x8007FF08
.set HvxEncryptedReserveAllocation,          0x80082420
.set HvxEncryptedEncryptAllocation,          0x80082430
.set HvxEncryptedReleaseAllocation,          0x80082450
.set NtAllocateVirtualMemory,                0x800831F8
.set DbgBreakPoint,                          0x800855F0
.set DbgPrint,                               0x80085638
.set RtlInitAnsiString,                      0x80085860
.set NtClose,                                0x800895b0
.set ObCreateSymbolicLink,                   0x8008a5f0
.set VdDisplayFatalError,                    0x800BD398
.set HvxKeysExSetKey,                        0x80107BE0
.set HvxKeysExGetKey,                        0x80107BF0
.set memcmp,                                 0x80116870

# System call ordinals
.set sc_HvxPostOutputExploit,                0x0D 
.set sc_HvxFlushUserModeTb,                  0x1F 
.set sc_HvxKeysExecute,                      0x40 
.set sc_HvxEncryptedReserveAllocation,       0x47 
.set sc_HvxEncryptedEncryptAllocation,       0x48 
.set sc_HvxEncryptedReleaseAllocation,       0x4A 
.set sc_HvxRevokeUpdate,                     0x63 
.set sc_HvxArbWriteSyscall,              sc_HvxFlushUserModeTb

# Boot animation address :
.set BootAnimCodePageAddress,          0x98030000 

# XAM function addresses: 
.set CreateFileA,                            0x8171b398
.set GetFileSize,                            0x8171bc18
.set ReadFile,                               0x8171C718
.set WriteFile,                              0x817216C0
.set CloseHandle,                            0x8171AE00
.set CreateThread,                           0x8171b608
.set ResumeThread,                           0x8171C8F0
.set GetLastError,                           0x81720f18
.set XamLoaderLaunchTitle,                   0x816A1728
.set XamLoaderTerminateTitle,                0x816A1360
.set XLaunchNewImage,                        XamLoaderLaunchTitle
.set memcpy,                                 0x8172cba0
.set memset,                                 0x8172cb00

###########################################################
# Kernel gadgets :

.set __restgprlr_24,                         0x800631A0
.set __restgprlr_26,                         0x80062578
.set __restgprlr_27,                         0x80061D50
.set __restgprlr_28,                         0x8006148C
.set __restgprlr_29,                         0x800619B4
.set __restgprlr_30,                         0x80061538
.set __restgprlr_31,                         0x800664B0
.set stw_r3,                                 0x800d8edc
.set mr_r31_to_r3,                           0x800661E4
.set mr_r31_to_r11,                          0x800c7da0
.set call_func_dispatch,                     0x8007a8bc

###########################################################
# XAM gadgets (byte pattern search):

.set stack_pivot,                            0x817247c8
.set lwz_r3,                                 0x816AB91C
.set lwz_r3_stw_r4,                          0x817a1f78
.set lwz_r10,                                0x8196bb54
.set lwz_r11_off_r31,                        0x81920924
.set stw_r30_on_r31,                         0x816fc7f4
.set stw_r3_onto_pointer,                    0x81921848
.set load_add_store_r10_r5_on_r11,           0x819d7858
.set call_func_preload,                      0x8169cd14
.set mr_r1_to_r3,                            0x817f4584
.set blr_nop,                                0x817f4588
.set clamp_r3,                               0x817ef9bc
.set mul_r3_4_lwzx_r11,                      0x816d86dc
.set load_add_store_r11_r30_on_r31,          0x817f7488
.set call_ptr_off_r31,                       0x81699d00

# These are constants:
.set lwz_r3_stw_r4__r3_disp,           0
.set lwz_r3_stw_r4__r4_disp,           8
.set mul_r3_4_lwzx_r11__disp,          0x3ae4
.set load_add_store_r11_r30_on_r31__disp, 0x18
.set cf_r3_def,                         0x29292929
.set cf_r4_def,                         0x28282828
.set cf_r5_def,                         0x27272727
.set cf_r6_def,                         0x26262626
.set cf_r7_def,                         0x25252525
.set cf_r3_offset,                      0x2C
.set cf_r4_offset,                      0x24
.set cf_r5_offset,                      0x1C
.set cf_r6_offset,                      0x14
.set cf_r7_offset,                      0x0C
