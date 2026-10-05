

; Replace with your application code
start:
    LDI R16,0X01
    LDI R17,0X02
    
    PUSH R16
    PUSH R17
    
    POP R17
    POP R16
    rjmp start
