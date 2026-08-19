# Ported from BadUpdate 17559 -> 17526

# note to self; verify HV image next
.set KRNL_VER, 17526

# Kernel function addresses, sorted by original 17559 address.
# For unchanged entries, the current address is also the 17559 sort key.

.set HalSendSMCMessage,                      0x80067F48  # CHECKED; unchanged
.set KeLockL2,                               0x80071E00  # CHECKED; unchanged
.set KeStallExecutionProcessor,              0x80073484  # CHECKED; unchanged
.set KeFlushCacheRange,                      0x80073850  # CHECKED; unchanged
.set XexUnloadImage,                         0x8007C838  # CHECKED; was 0x8007D0E8
.set XexLoadImage,                           0x8007CF10  # CHECKED; was 0x8007D7C0
.set HvxFlushDCacheRange,                    0x8007F0B8  # CHECKED; was 0x8007F968
.set MmGetPhysicalAddress,                   0x8007F798  # CHECKED; was 0x80080048
.set MmFreePhysicalMemory,                   0x8007FF08  # CHECKED; was 0x800807B8
.set HvxEncryptedReserveAllocation,          0x80082420  # CHECKED; was 0x80082CD0
.set HvxEncryptedEncryptAllocation,          0x80082430  # CHECKED; was 0x80082CE0
.set HvxEncryptedReleaseAllocation,          0x80082450  # CHECKED; was 0x80082D00
.set NtAllocateVirtualMemory,                0x800831F8  # CHECKED; was 0x80083AA8
.set DbgBreakPoint,                          0x800855F0  # CHECKED; was 0x80085EA0
.set DbgPrint,                               0x80085638  # CHECKED; was 0x80085EE8
.set RtlInitAnsiString,                      0x80085860  # CHECKED; was 0x80086110
.set NtClose,                                0x800895b0  # CHECKED; was 0x80089EB0
.set ObCreateSymbolicLink,                   0x8008a5f0  # CHECKED; was 0x8008AEF0
.set VdDisplayFatalError,                    0x800BD398  # CHECKED; was 0x800BDD40
.set HvxKeysExSetKey,                        0x80107BE0  # CHECKED; was 0x80108570
.set HvxKeysExGetKey,                        0x80107BF0  # CHECKED; was 0x80108580
.set memcmp,                                 0x80116870  # CHECKED; was 0x80117200

# System call ordinals, found ordinal −2
.set sc_HvxPostOutputExploit,                0x0D  # CHECKED; was 0x0D
.set sc_HvxFlushUserModeTb,                  0x1F  # CHECKED; was 0x21
.set sc_HvxKeysExecute,                      0x40  # CHECKED; was 0x42
.set sc_HvxEncryptedReserveAllocation,       0x47  # CHECKED; was 0x49
.set sc_HvxEncryptedEncryptAllocation,       0x48  # CHECKED; was 0x4A
.set sc_HvxEncryptedReleaseAllocation,       0x4A  # CHECKED; was 0x4C
.set sc_HvxRevokeUpdate,                     0x63  # CHECKED; was 0x65
.set sc_HvxArbWriteSyscall,              sc_HvxFlushUserModeTb  # UNCHECKED;

# Boot animation address (fixed):
.set BootAnimCodePageAddress,           0x98030000  # CHECKED;

# XAM function addresses: 
.set CreateFileA,                            0x8171b398  # CHECKED; was 0x8171BF40
.set GetFileSize,                            0x8171bc18  # CHECKED; was 0x8171C7C0
.set ReadFile,                               0x8171C718  # CHECKED; was 0x8171D2C0
.set WriteFile,                              0x817216C0  # CHECKED; was 0x81722268
.set CloseHandle,                            0x8171AE00  # CHECKED; was 0x8171B9A8
.set CreateThread,                           0x8171b608  # CHECKED; was 0x8171C1B0
.set ResumeThread,                           0x8171C8F0  # CHECKED; was 0x8171D498
.set GetLastError,                           0x81720f18  # CHECKED; was 0x81721AC0
.set XamLoaderLaunchTitle,                   0x816A1728  # CHECKED; was 0x816A1820
.set XamLoaderTerminateTitle,                0x816A1360  # CHECKED; was 0x816A1458
.set XLaunchNewImage,                        XamLoaderLaunchTitle  # CHECKED;
.set memcpy,                                 0x8172cba0  # CHECKED; was 0x8172D590
.set memset,                                 0x8172cb00  # CHECKED; was 0x8172D4F0

###########################################################
# Kernel gadgets :

.set __restgprlr_24,                         0x800631A0  # CHECKED; unchanged
.set __restgprlr_26,                         0x80062578  # CHECKED; unchanged
.set __restgprlr_27,                         0x80061D50  # CHECKED; unchanged
.set __restgprlr_28,                         0x8006148C  # CHECKED; unchanged
.set __restgprlr_29,                         0x800619B4  # CHECKED; unchanged
.set __restgprlr_30,                         0x80061538  # CHECKED; unchanged
.set __restgprlr_31,                         0x800664B0  # CHECKED; unchanged
.set stw_r3,                                 0x800d8edc  # CHECKED; was 0x800D986C
.set mr_r31_to_r3,                           0x800661E4  # CHECKED; unchanged
.set mr_r31_to_r11,                          0x800c7da0  # CHECKED; was 0x800C8748
.set call_func_dispatch,                     0x8007a8bc  # CHECKED; was 0x8007B0AC

###########################################################
# XAM gadgets (byte pattern search):

.set stack_pivot,                            0x817247c8  # CHECKED; was 0x81725378
.set lwz_r3,                                 0x816AB91C  # CHECKED; was 0x816ABA5C
.set lwz_r3_stw_r4,                          0x817a1f78  # CHECKED; was 0x817A27B0
.set lwz_r10,                                0x8196bb54  # CHECKED; was 0x8196C574
.set lwz_r11_off_r31,                        0x81920924  # CHECKED; was 0x816A8D94
.set stw_r30_on_r31,                         0x816fc7f4  # CHECKED; was 0x816FCAAC
.set stw_r3_onto_pointer,                    0x81921848  # CHECKED; was 0x81922120
.set load_add_store_r10_r5_on_r11,           0x819d7858  # CHECKED; was 0x819D88A8
.set call_func_preload,                      0x8169cd14  # CHECKED; was 0x8169CDDC
.set mr_r1_to_r3,                            0x817f4584  # CHECKED; was 0x817F4EC4
.set blr_nop,                                0x817f4588  # CHECKED; was 0x817F4EC8
.set clamp_r3,                               0x817ef9bc  # CHECKED; was 0x817F030C
.set mul_r3_4_lwzx_r11,                      0x816d86f0  # CHECKED; was 0x816D8864
.set load_add_store_r11_r30_on_r31,          0x817f7488  # CHECKED; was 0x817F7DC8
.set call_ptr_off_r31,                       0x81699d00  # CHECKED; was 0x81699DC8

# These are constants, not addresses   unchanged:
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
