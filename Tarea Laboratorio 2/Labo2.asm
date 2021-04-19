        ; Laboratorio #2 - Guillermo Daniel Lopez Henríquez 00026018
        org     100h

        section .text

        ; Escribir cuatro iniciales de su nombre completo empezando en la dirección de memoria 200h

        mov     byte [200h], "G"
        mov     byte [201h], "D"
        mov     byte [202h], "L"
        mov     byte [203h], "H"

        ; mover a los siguientes registros los códigos ASCII de los caracteres guardados en 200h
        
        ; 1.Copiar el valor de 200h a AX usando direccionamiento directo.
        
        mov     AL, [200h]

        ; 2.Copiar el valor de 201h a CX usando direccionamiento indirecto por registro.

        mov     BX, 201h
        mov     CL, [BX]

        ; 3.Copiar el valor de 202h a DX usando direccionamiento indirecto base más índice.

        mov     SI, 0001h
        mov     DL, [BX+SI]

        ; 4.Copiar el valor de 203h a DI usando direccionamiento relativo por registro.

        mov     DI, [SI+202h]

        int     20h
        

