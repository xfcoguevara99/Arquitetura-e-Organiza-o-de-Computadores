

; Replace with your application code
start:
    ldi r16,0x03
    ldi	r17,0x02
    sts 0x0100,r16
    sts 0x0101,r17    
    
    ldi r27,0x01
    ldi r26,0x00
    ld r0,X+
    ld r1,X+
    add r0,r1 
    st X,r0
    rjmp start
