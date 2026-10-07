.DSEG
.ORG SRAM_START

A: .BYTE 4
B: .BYTE 4
C: .BYTE 4

.CSEG

START:
    ; --------------------------------
    ; Inicializa o vetor A
    ; --------------------------------
    LDI R16, 10
    LDI R17, 20
    LDI R18, 30
    LDI R19, 40

    LDI XL, LOW(A)
    LDI XH, HIGH(A)

    ST X+, R16
    ST X+, R17
    ST X+, R18
    ST X,  R19

    ; --------------------------------
    ; Inicializa o vetor B
    ; --------------------------------
    LDI R16, 1
    LDI R17, 2
    LDI R18, 3
    LDI R19, 4

    LDI XL, LOW(B)
    LDI XH, HIGH(B)

    ST X+, R16
    ST X+, R17
    ST X+, R18
    ST X,  R19

    ; --------------------------------
    ; Soma A + B
    ; Resultado em C
    ; --------------------------------
    RCALL SOMA_32BITS

    RJMP START


; ====================================
; SOMA_32BITS
;
; C = A + B
;
; X -> A
; Y -> B
; Z -> C
; ====================================

SOMA_32BITS:

    ; Endereço de A
    LDI XL, LOW(A)
    LDI XH, HIGH(A)

    ; Endereço de B
    LDI YL, LOW(B)
    LDI YH, HIGH(B)

    ; Endereço de C
    LDI ZL, LOW(C)
    LDI ZH, HIGH(C)

    ; Salva registradores utilizados
    PUSH R0
    PUSH R1
    PUSH R16

    ; Contador
    LDI R16, 4

    ; ----------------------------
    ; Primeiro byte
    ; ----------------------------
    LD R0, X+
    LD R1, Y+

    ADD R0, R1

    ST Z+, R0

    DEC R16

    ; ----------------------------
    ; Próximos bytes
    ; ----------------------------
LOOP_SOMA:

    LD R0, X+
    LD R1, Y+

    ADC R0, R1

    ST Z+, R0

    DEC R16
    BRNE LOOP_SOMA

    ; Restaura contexto
    POP R16
    POP R1
    POP R0

    RET