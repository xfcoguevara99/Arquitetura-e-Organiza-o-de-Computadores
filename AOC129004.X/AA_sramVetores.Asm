.DSEG
.ORG SRAM_START
    A1: .BYTE 10
    A2: .BYTE 10
    A3: .BYTE 10
 
 
    A4: .BYTE 3
    
.CSEG

start:
    ;PARTE 1
    LDI R16,1
    LDI R17,11
    
    LDI XL, LOW(A1)
    LDI XH, HIGH(A1)
    
    LDI YL, LOW(A2) 
    LDI YH, HIGH(A2)
    
LOOP_PREENCHIMENTO: 
    ST X+,R16
    ST y+,R16
    INC R16
    CP R17,R16
    BRNE LOOP_PREENCHIMENTO
   

   ;PARTE 2
   LDI XL, LOW(A1)
   LDI XH, HIGH(A1)
   
   LDI YL, LOW(A2+10)
   LDI YH, HIGH(A2+10)
   
   LDI ZL, LOW(A3)
   LDI ZH, HIGH(A3)
   
   LDI R16,1
   LDI R17,11
   
LOOP_SOMA:
    LD R0, X+
    LD R1, -Y
    ADD R0,R1
    ST Z+,R0
    INC R16
    CP R17,R16
    BRNE LOOP_SOMA
   
    
    ;PARTE 3
    LDI XL, LOW(A4)
    LDI XH,HIGH(A4)
    
    LDI YL,LOW(A3)
    LDI YH,HIGH(A3)
    
    LDI ZL,LOW(A2)
    LDI ZH,HIGH(A2)
    
    LD R0,Z
    LDD R1,Y+3
    ADD R0,R1
    ST X+,R0
    
    LDD R0,Z+3
    LDD R1,Y+4
    ADD R0,R1
    ST X+,R0
    
    LDD R0,Z+5
    LDD R1,Y+7
    ADD R0,R1
    ST X+,R0
  
    rjmp start