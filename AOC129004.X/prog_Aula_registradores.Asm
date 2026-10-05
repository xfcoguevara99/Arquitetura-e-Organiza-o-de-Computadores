

; Replace with your application code
start:
    ldi r16,0x14
    ldi r17,0x19
    add r16,r17
    subi r16,-22
    mov r22,r16
    rjmp start
