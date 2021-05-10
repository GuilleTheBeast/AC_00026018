; Guillermo Daniel López Henríquez Ejercicio 1   
        org 100h

        section .text
                
                XOR DI, DI
                XOR AX, AX
                MOV word CX, 8d 
                JMP iterate
        
        iterate:
                MOV byte BL, [car+DI] 
                SUB BL, 48 
                ADD AL, BL 
                INC DI 
                LOOP iterate 
                
                MOV BL, 8d
                DIV BL 
                MOV [20ah], AL 
        exit:
                int 20h

        section .data
        car DB "00026018" 