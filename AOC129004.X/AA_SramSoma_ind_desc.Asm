

; Replace with your application code
start:
    ldi r16,0x0B
    ldi r17,0x04
    sts 0x0100,r16
    sts 0x0101,r17
    
    ldi r31,0x01
    ldi r30,0x00
    
    ld r0,Z
    ldd r1,Z+1
    add r0,r1
    std Z+2,r0
    rjmp start
