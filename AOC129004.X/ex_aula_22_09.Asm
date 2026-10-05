.dseg
.org SRAM_start
    A: .byte 1
    B: .byte 1
    C: .byte 1
 .cseg
; Replace with your application code
start:

    
    
    lds r0,A
    lds r1,B
    add r0,r1
    sts C,r0
    rjmp start
