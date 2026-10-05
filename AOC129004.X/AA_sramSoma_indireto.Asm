

; Replace with your application code
start:
    ldi r16,0x03
    ldi	r17,0x02
    sts 0x0100,r16
    sts 0x0101,r17 
    
    ldi r26,0x00
    ldi r27,0x01
    
    ldi r28,0x01
    ldi r29,0x01
    
    ldi r30,0x02
    ldi r31,0x01
    
    ld r0,X
    ld r1,Y
    
    add r0,r1
    
    st Z,r0
    rjmp start
