.DSEG
.ORG SRAM_START

A: .BYTE 4
B: .BYTE 4
C: .BYTE 4

.CSEG

START:

    ; ==============================
    ; Inicializa A
    ; ==============================

    LDI R16, 10
    LDI R17, 20
    LDI R18, 30
    LDI R19, 40

    LDI XL, LOW(A)
    LDI XH, HIGH(A)

    ST X+, R16
    ST X+, R17
    ST X+, R18
    ST X, R19


    ; ==============================
    ; Inicializa B
    ; ==============================

    LDI R16, 1
    LDI R17, 2
    LDI R18, 3
    LDI R19, 4

    LDI XL, LOW(B)
    LDI XH, HIGH(B)

    ST X+, R16
    ST X+, R17
    ST X+, R18
    ST X, R19


    ; ==============================
    ; Soma cruzada
    ; ==============================

    RCALL SOMA_CRUZADA

    RJMP START


; ==========================================
; SOMA_CRUZADA
;
; A[0] + B[3] ? C[0]
; A[1] + B[2] ? C[1]
; A[2] + B[1] ? C[2]
; A[3] + B[0] ? C[3]
;
; X ? A
; Y ? B
; Z ? C
; ==========================================

SOMA_CRUZADA:

    ; X aponta para o primeiro elemento de A
    LDI XL, LOW(A)
    LDI XH, HIGH(A)

    ; Y aponta para o último elemento de B
    LDI YL, LOW(B+3)
    LDI YH, HIGH(B+3)

    ; Z aponta para o primeiro elemento de C
    LDI ZL, LOW(C)
    LDI ZH, HIGH(C)

    ; Salva contexto
    PUSH R0
    PUSH R1
    PUSH R16

    ; Contador
    LDI R16, 4

LOOP_SOMA:

    ; Lê A e B
    LD R0, X
    LD R1, Y

    ; Soma
    ADD R0, R1

    ; Armazena resultado
    ST Z+, R0

    ; Avança A
    ADIW X, 1

    ; Retrocede B
    SBIW Y, 1

    ; Próximo elemento
    DEC R16
    BRNE LOOP_SOMA

    ; Restaura contexto
    POP R16
    POP R1
    POP R0

    RET