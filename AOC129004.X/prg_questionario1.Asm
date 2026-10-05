

; Replace with your application code
start:
    LDI R16,0X16
    LDI R18,24
    LDI R20,042
    
    ADD R16,R18
    ADD R16,R20
    
    MOV R2,R16
    
    rjmp start