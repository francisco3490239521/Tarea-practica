.MODEL SMALL
.STACK 100h

.DATA

titulo DB 13,10,"ADMINISTRADOR DE PROCESOS - SIMULACION",13,10,"$"

menu DB 13,10,"1. Ver procesos"
     DB 13,10,"2. Finalizar proceso"
     DB 13,10,"3. Cambiar prioridad"
     DB 13,10,"4. Suspender / Reanudar"
     DB 13,10,"5. Crear proceso"
     DB 13,10,"6. Buscar proceso"
     DB 13,10,"7. Salir"
     DB 13,10,"Seleccione opcion: $"

msgSalir DB 13,10,"Saliendo del sistema...",13,10,"$"
msgAccion DB 13,10,"Accion simulada ejecutada",13,10,"$"

; PROCESOS SIMULADOS
p1 DB 13,10,"PID:101 Chrome   CPU:25% MEM:512MB ESTADO:ACTIVO",13,10,"$"
p2 DB 13,10,"PID:102 Word     CPU:10% MEM:256MB ESTADO:ACTIVO",13,10,"$"
p3 DB 13,10,"PID:103 Spotify  CPU:8%  MEM:128MB ESTADO:ACTIVO",13,10,"$"

.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

MENU_LOOP:

    ; MOSTRAR TITULO
    MOV AH,09h
    LEA DX,titulo
    INT 21h

    ; MOSTRAR MENU
    MOV AH,09h
    LEA DX,menu
    INT 21h

    ; LEER TECLA
    MOV AH,01h
    INT 21h

    CMP AL,'1'
    JE VER

    CMP AL,'2'
    JE ACCION

    CMP AL,'3'
    JE ACCION

    CMP AL,'4'
    JE ACCION

    CMP AL,'5'
    JE ACCION

    CMP AL,'6'
    JE ACCION

    CMP AL,'7'
    JE SALIR

    JMP MENU_LOOP

; -----------------------
VER:

    MOV AH,09h
    LEA DX,p1
    INT 21h

    MOV AH,09h
    LEA DX,p2
    INT 21h

    MOV AH,09h
    LEA DX,p3
    INT 21h

    MOV AH,01h
    INT 21h

    JMP MENU_LOOP

; -----------------------
ACCION:

    MOV AH,09h
    LEA DX,msgAccion
    INT 21h

    MOV AH,01h
    INT 21h

    JMP MENU_LOOP

; -----------------------
SALIR:

    MOV AH,09h
    LEA DX,msgSalir
    INT 21h

    MOV AH,4Ch
    INT 21h

MAIN ENDP
END MAIN