

; Replace with your application code
start:
    ;Valores de teste
    ldi r16,0x03
    ldi	r17,0x02
    sts 0x0100,r16
    sts 0x0110,r1
    ;Direto
    lds r0,0x0100
    lds r1,0x0110
    add r0,r1
    sts 0x0120,r0
    ;indireto
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
    ;indireto com pos-incremento
    ldi r27,0x01
    ldi r26,0x00
    ld r0,X+
    ld r1,X+
    add r0,r1 
    st X,r0
    ;indireto com deslocamento
    ldi r31,0x01
    ldi r30,0x00
    ld r0,Z
    ldd r1,Z+1
    add r0,r1
    std Z+2,r0
    rjmp start