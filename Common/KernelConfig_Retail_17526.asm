# Ported from BadUpdate 17559 -> 17526

# note to self; sanity check everything
.set KRNL_VER, 17526

# Kernel function addresses, sorted by original 17559 address.
# For unchanged entries, the current address is also the 17559 sort key.

# ExFreePool, ExAllocatePoolWithTag, MmAllocatePhysicalMemory, XPhysicalAlloc are leftovers from a deprecated automation tool, unless stated otherwise, not used.

# .set ExFreePool,                             0x80064768  # NOT USED;  unchanged
# .set ExAllocatePoolWithTag,                  0x80064A60  # NOT USED;  unchanged
# .set MmAllocatePhysicalMemory,               0x80080200  # NOT USED;  was 0x80080AB0
# .set XPhysicalAlloc,                         0x80080470  # NOT USED;  was 0x80080D20
.set HalSendSMCMessage,                      0x80067F48  # UNCHECKED; unchanged
.set KeLockL2,                               0x80071E00  # UNCHECKED; unchanged
.set KeStallExecutionProcessor,              0x80073484  # UNCHECKED; unchanged
.set KeFlushCacheRange,                      0x80073850  # UNCHECKED; unchanged
.set XexUnloadImage,                         0x8007C838  # UNCHECKED; was 0x8007D0E8
.set XexLoadImage,                           0x8007CF10  # UNCHECKED; was 0x8007D7C0
.set HvxFlushDCacheRange,                    0x8007F0B8  # UNCHECKED; was 0x8007F968
.set MmGetPhysicalAddress,                   0x8007F798  # UNCHECKED; was 0x80080048
.set MmFreePhysicalMemory,                   0x8007FF08  # UNCHECKED; was 0x800807B8
.set HvxEncryptedReserveAllocation,          0x80082420  # UNCHECKED; was 0x80082CD0
.set HvxEncryptedEncryptAllocation,          0x80082430  # UNCHECKED; was 0x80082CE0
.set HvxEncryptedReleaseAllocation,          0x80082450  # UNCHECKED; was 0x80082D00
.set NtAllocateVirtualMemory,                0x800831F8  # UNCHECKED; was 0x80083AA8
.set DbgBreakPoint,                          0x800855F0  # UNCHECKED; was 0x80085EA0
.set DbgPrint,                               0x80085638  # UNCHECKED; was 0x80085EE8
.set RtlInitAnsiString,                      0x80085860  # UNCHECKED; was 0x80086110
.set NtClose,                                0x800895b0  # UNCHECKED; was 0x80089EB0
.set ObCreateSymbolicLink,                   0x8008a5f0  # UNCHECKED; was 0x8008AEF0
.set VdDisplayFatalError,                    0x800BD398  # UNCHECKED; was 0x800BDD40
.set HvxKeysExSetKey,                        0x80107c00  # UNCHECKED; was 0x80108570
.set HvxKeysExGetKey,                        0x80107C10  # UNCHECKED; was 0x80108580
.set memcmp,                                 0x80116870  # UNCHECKED; was 0x80117200

# System call ordinals (must be verified against the 17526 HV image): code seems identical through ghidra, more on that later
.set sc_HvxPostOutputExploit,                0x0D  # PLACEHOLDER;
.set sc_HvxFlushUserModeTb,                  0x21  # PLACEHOLDER; 
.set sc_HvxKeysExecute,                      0x42  # PLACEHOLDER; 
.set sc_HvxEncryptedReserveAllocation,       0x49  # PLACEHOLDER; 
.set sc_HvxEncryptedEncryptAllocation,       0x4A  # PLACEHOLDER; 
.set sc_HvxEncryptedReleaseAllocation,       0x4C  # PLACEHOLDER; 
.set sc_HvxRevokeUpdate,                     0x65  # PLACEHOLDER; 
.set sc_HvxArbWriteSyscall,              sc_HvxFlushUserModeTb  # UNCHECKED PLACEHOLDER;

# Boot animation address (fixed mapping on KernelConfig_Debug.):
.set BootAnimCodePageAddress,           0x98030000  # UNCHECKED;

# XAM function addresses:
.set CreateFileA,                            0x8171b3a0  # UNCHECKED;
.set GetFileSize,                            0x8171bc20  # UNCHECKED;
.set ReadFile,                               0x8171C718  # UNCHECKED;
.set WriteFile,                              0x817216C0  # UNCHECKED;
.set CloseHandle,                            0x8171AE00  # UNCHECKED;
.set CreateThread,                           0x8171b610  # UNCHECKED;
.set ResumeThread,                           0x8171C8F0  # UNCHECKED;
.set GetLastError,                           0x81720f18  # UNCHECKED;
.set XamLoaderLaunchTitle,                   0x816A1728  # UNCHECKED;
.set XamLoaderTerminateTitle,                0x816A1360  # UNCHECKED;
.set XLaunchNewImage,                        XamLoaderLaunchTitle  # UNCHECKED;
.set XMemCpy,                                0x81721B90  # UNCHECKED;
.set XMemSet,                                0x81721e88  # UNCHECKED;

# Aliases for compatibility with BadUpdate source:
.set memcpy, XMemCpy  # UNCHECKED alias
.set memset, XMemSet  # UNCHECKED alias

###########################################################
# Kernel gadgets :

.set __restgprlr_24,                         0x800631A0  # UNCHECKED; unchanged
.set __restgprlr_26,                         0x80062578  # UNCHECKED; unchanged
.set __restgprlr_27,                         0x80061D50  # UNCHECKED; unchanged
.set __restgprlr_28,                         0x8006148C  # UNCHECKED; unchanged
.set __restgprlr_29,                         0x800619B4  # UNCHECKED; unchanged
.set __restgprlr_30,                         0x80061538  # UNCHECKED; unchanged
.set __restgprlr_31,                         0x800664B0  # UNCHECKED; unchanged
.set stw_r3,                                 0x800d8edc  # UNCHECKED; was 0x800D986C
.set mr_r31_to_r3,                           0x800661E4  # UNCHECKED; unchanged
.set mr_r31_to_r11,                          0x800c7da0  # UNCHECKED; was 0x800C8748
.set call_func_dispatch,                     0x8007a8bc  # UNCHECKED; was 0x8007B0AC

###########################################################
# XAM gadgets (byte pattern search):

.set stack_pivot,                            0x817247D0  # UNCHECKED; was 0x81725378

# TODO: 

   # .set lwz_r3,                                 0x816ACD1C  # UNRESOLVED; was 0x816ACE5C (17559); delta=-320; real 17559 gadget found manually, upstream value was stale/incorrect
   # .set lwz_r3,                                 0x816ab910  # UNRESOLVED; was 0x816ABA5C <<<< ????

.set lwz_r3_stw_r4,                          0x817A1F78  # UNCHECKED; was 0x817A27B0
.set lwz_r10,                                0x8196BB54  # UNCHECKED; was 0x8196C574
.set lwz_r11_off_r31,                        0x816A8C6C  # UNCHECKED; was 0x816A8D94
.set stw_r30_on_r31,                         0x816FC804  # UNCHECKED; was 0x816FCAAC
.set stw_r3_onto_pointer,                    0x819217C8  # UNCHECKED; was 0x81922120
.set load_add_store_r10_r5_on_r11,           0x819D7858  # UNCHECKED; was 0x819D88A8

# TODO: 

   # .set call_func_preload,                      0x8169E114  # UNRESOLVED; was 0x8169E1DC (17559); delta=-200; real 17559 gadget found manually, upstream value was stale/incorrect
   # .set call_func_preload,                      0x816d6050  # UNRESOLVED; was 0x8169CDDC <<<< ????

.set mr_r1_to_r3,                            0x817F458C  # UNCHECKED; was 0x817F4EC4
.set blr_nop,                                0x817F4590  # UNCHECKED; was 0x817F4EC8
.set clamp_r3,                               0x817EF93C  # UNCHECKED; was 0x817F030C
.set mul_r3_4_lwzx_r11,                      0x816D8674  # UNCHECKED; was 0x816D8864
.set load_add_store_r11_r30_on_r31,          0x817f7488  # UNCHECKED; was 0x817F7DC8
.set call_ptr_off_r31,                       0x81699D00  # UNCHECKED; was 0x81699DC8

# These are constants, not addresses   unchanged:
.set lwz_r3_stw_r4__r3_disp,           0
.set lwz_r3_stw_r4__r4_disp,           8
.set mul_r3_4_lwzx_r11__disp,          0x3D64
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
