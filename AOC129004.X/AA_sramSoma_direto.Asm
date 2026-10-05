

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
    
    rjmp start
