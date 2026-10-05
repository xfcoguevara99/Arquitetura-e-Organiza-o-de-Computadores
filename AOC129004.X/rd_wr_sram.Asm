

; Replace with your application code
start:
    ldi r27, 0x01 ; Byte mais significativo de X (XH)
    ldi r26, 0x00 ; Byte menos significativo de X (XL)
    ld r0, X ; X est´a apontando o endere¸co 0x0100
    mov r4,r0
    inc r0
    st X, r0
    rjmp start
