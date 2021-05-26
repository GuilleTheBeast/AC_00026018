; Guillermo Daniel López Henríquez Ejercicio 1 
;MAIN del programa
        org     100h

        section .text

        MOV     BL,count  ; Divisor 
        call    Fun ; LLamada a la función principal

        int     20h

        section .data
arr  db      11,22,13,04,07,16,20,02,01,19,05 ; Arreglo 
count   equ     2   
NoCount equ     0    

;FUNCIONES del programa

;Determinar si es par o impar y guardar su valor
Fun:
        XOR     SI,SI   
        XOR     DI,DI   
        XOR     AX,AX  
while:
        mov     AL,[arr+SI]  
        cmp     AL, 0xA         
        je      end             
        mov     DL,AL           
        div     BL              
        cmp     AH,NoCount       
        je      Pair      
        jmp     NotPair        
        jmp     end             
end:
        ret

;Guardar Par
Pair:
        mov     [300h+DI],DL
        inc     DI
        inc     SI
        jmp     while

;Guardar Impar
NotPair:
        mov     [320h+DI],DL
        inc     DI
        inc     SI
        jmp     while