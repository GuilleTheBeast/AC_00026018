; Guillermo Daniel López Henríquez 00026018 Ejercicio 1 
org 100h

        section .text
        ; Limpiando registros
        xor     AX, AX
        xor     SI, SI
        xor     BX, BX
        XOR     CX, CX
        xor     DX, DX

        ; Punteros
        MOV     SI, 0
        MOV     DI, 0d

        MOV     DH, 10 ; Fila en la que se mostrará el cursor
        MOV     DL, 20 ; Columna en la que se mostrará el cursor

        call    modotexto ; Subrutina encargada de activar el modo texto

        iterar:
                call    escribir ; Llamada a la subrutina para escribir el Nombre
                MOV     byte [cant],7 ; Cantidad de iteraciones igual a 7
                MOV     DH,12   ; Estableciendo nueva fila
                MOV     DL,20   ; Estableciendo columna inicial
                XOR     DI,DI   ; Limpiando puntero
                call    escribir ; Se vuelve a llamar a la subrutina para escribir el Nombre
                MOV     byte [cant],7 
                MOV     DH,14 
                MOV     DL,20 
                XOR     DI,DI 
                call    escribir ; 
                MOV     byte [cant],5 
                MOV     DH,16 
                MOV     DL,20 
                XOR     DI,DI 
                call    escribir ; Cuarta llamada a subrutina para escribir Nombre
                JMP     esperartecla ; Saltamos a la subrutina 
        
        escribir:
                call    movercursor ; Llamada a subrutina 
                MOV     CL, [nombre+SI] ; Comando para moverse entre caracteres de la cadena
                call    escribircaracter ; Llamada a subrutina
                INC     SI ; Incrementando en 1 para avanzar al siguiente caracter
                INC     DL ; Incrementando en 1 para avanzan a la siguiente columna
                INC     DI ; Incrementando en 1 para acercarse al total de iteraciones
                CMP     DI, [cant] ; Si DI es igual al número de iteraciones entonces la palabra esta escrita
                JB      escribir  
                RET

        modotexto: 
                MOV     AH, 0h ; Activando modo texto
                MOV     AL, 00h ; Modo gráfico deseado (40x25)
                INT     10h
                RET

        movercursor:
                MOV     AH, 02h ; Posicionando cursor en pantalla
                MOV     BH, 0h ; Número de página en que nos ubicamos
                INT     10h
                RET

        escribircaracter:
                MOV     AH, 0Ah ; Escribiendo caracter en pantalla según posición del cursor
                MOV     AL, CL ; Denotamos el caracter a escribir en pantalla
                MOV     BH, 0h ; Número de página
                MOV     CX, 1h ; Número de veces a escribir el caracter
                INT     10h
                RET

        esperartecla:
                MOV     AH, 00h ; Espera al búffer del tecaldo hasta que exista interrupción
                INT     16h

        exit:
                int     20h ; Finalizando programa



    section .data

    nombre      DB      'GuillermoDanielLopezHenriquez' ; Variable con el nombre completo
    cant        DB       5 ; Variable con numero de iteraciones