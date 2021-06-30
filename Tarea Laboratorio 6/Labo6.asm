; Guillermo Daniel López Henríquez 00026018 Ejercicio 1 
org 100h

        section .text

        mov     DX,mensaje1
        call    write

        mov     BP,entrada
        call    view

        call same

        call write

        int     20h

        section .data
banner          DB      "Escriba su contraseña: ", "$"
mensaje1        DB      "Acceso concedido", "$"
contra          DB      "GuilleTheBeast"
mensaje2        DB      "Acceso denegado", "$"
entrada         times   20      DB      " "

; Función para leer caracter
read:
        mov     AH,01h
        int     21h
        ret

; Función para leer cadena de texto desde teclado
view:
        XOR     SI,SI
while:
        call    read
        cmp     AL,0x0D
        je      exit
        mov     [BP+SI],AL
        inc     SI
        jmp     while
exit:
        mov     byte [BP+SI], "$"
        ret

; Función para escribir cadena de texto
write:
        mov     AH,09h
        int     21h
        ret

; Comparando clave guardada con ingresada
same:
        mov     AL,[contra]
        mov     AH,[entrada]
        cmp     AL,AH
        je      good
        jne     wrong
        ret
; Llamando mensajes a mostrar para el usuario
good:
        mov     DX,mensaje1
        ret
wrong:
        mov     DX,mensaje2
        ret