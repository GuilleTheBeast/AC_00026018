; Guillermo Daniel López Henríquez Ejercicio 2     
        org 100h

        section .text
            
            XOR AX, AX
            MOV word CX, 4d 

            MOV AL, 5d  
            CMP CL, 0d  
            JZ  fact 
        
        fact:
            MUL CL  
            LOOP fact

            MOV [20bh], AL 
        
        exit:
            int 20h