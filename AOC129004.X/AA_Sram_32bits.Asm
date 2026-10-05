.DSEG
.ORG SRAM_START
    A: .BYTE 4
    B: .BYTE 4
    C: .BYTE 4
.CSEG

; Replace with your application code
start:
    ;ENDERECÇAMENTO DIRETO
     LDS R0,A
     LDS R1,B
     ADD R0,R1
     STS C,R0
     
     LDS R0,A+1
     LDS R1,B+1
     ADC R0,R1
     STS C+1,R0
     
     LDS R0,A+2
     LDS R1,B+2
     ADC R0,R1
     STS C+2,R0
     
     LDS R0,A+3
     LDS R1,B+3
     ADC R0,R1
     STS C+3,R0
    
     
     ;ENDEREÇAMENTO INDIRETO
     
    LDI XH,HIGH(A)
    LDI XL,LOW(A)
    
    LDI YH,HIGH(B)
    LDI YL,LOW(B)
    
    LDI ZH,HIGH(C)
    LDI ZL,LOW(C)
    
    LD R0,X
    LD R1,Y
    ADD R0,R1
    ST Z,R0 
    LDS R16,0X05F
    ADIW XL,1
    ADIW YL,1
    ADIW ZL,1
    STS 0X005F,R16
    
    LD R0,X
    LD R1,Y
    ADC R0,R1
    ST Z,R0
    LDS R16,0X05F
    ADIW XL,1
    ADIW YL,1
    ADIW ZL,1
    STS 0X005F,R16
    
    LD R0,X
    LD R1,Y
    ADC R0,R1
    ST Z,R0
    LDS R16,0X05F
    ADIW XL,1
    ADIW YL,1
    ADIW ZL,1
    STS 0X005F,R16
    
    LD R0,X
    LD R1,Y
    ADC R0,R1
    ST Z,R0
    LDS R16,0X05F
    ADIW XL,1
    ADIW YL,1
    ADIW ZL,1
    STS 0X005F,R16
    
    ;INDIRETO POS-INCREMENTO
    
    LDI XH,HIGH(A)
    LDI XL,LOW(A)
    LDI YH,HIGH(B)
    LDI YL,LOW(B)
    LDI ZH,HIGH(C)
    LDI ZL,LOW(C)
    
    LD R0,X+
    LD R1,Y+
    ADD R0,R1
    ST Z+,R0 
    
    LD R0,X+
    LD R1,Y+
    ADC R0,R1
    ST Z+,R0 
    
    LD R0,X+
    LD R1,Y+
    ADC R0,R1
    ST Z+,R0 
    
    LD R0,X+
    LD R1,Y+
    ADC R0,R1
    ST Z+,R0 
    
    ;INDIRETO POS INCREMEANTO COM LOOP
    LDI XH,HIGH(A)
    LDI XL,LOW(A)
    LDI YH,HIGH(B)
    LDI YL,LOW(B)
    LDI ZH,HIGH(C)
    LDI ZL,LOW(C)
    
    LDI R16,0
    LDI R17,4
    CLC
LOOP_SOMA:
    LD R0,X+
    LD R1,Y+
    ADC R0,R1
    ST Z+,R0 
    
    INC R16
    CPSE R16,R17
    RJMP LOOP_SOMA
    
    ;indireto com deslocamento
    LDI YL,low(A)
    LDI YH,high(A)

    LDD R0,Y+0
    LDD R1,Y+4
    ADD R0,R1
    STD Y+8,R0
    
    LDD R0,Y+1
    LDD R1,Y+5
    ADD R0,R1
    STD Y+9,R0
    
    LDD R0,Y+2
    LDD R1,Y+6
    ADD R0,R1
    STD Y+10,R0
    
    LDD R0,Y+3
    LDD R1,Y+7
    ADD R0,R1
    STD Y+11,R0
    
  
    
    
    
    rjmp start
