.MODEL SMALL
.STACK 100H

.DATA
menu        DB 13,10,'===== CALCULADORA =====',13,10
            DB '1. Suma',13,10
            DB '2. Resta',13,10
            DB '3. Multiplicacion',13,10
            DB '4. Division',13,10
            DB 'Seleccione una opcion: $'

msg1        DB 13,10,'Ingrese primer numero: $'
msg2        DB 13,10,'Ingrese segundo numero: $'
resultado   DB 13,10,'Resultado: $'

num1        DB ?
num2        DB ?
opcion      DB ?

.CODE
MAIN PROC

    MOV AX,@DATA
    MOV DS,AX

; Mostrar menu
    LEA DX,menu
    MOV AH,09H
    INT 21H

; Leer opcion
    MOV AH,01H
    INT 21H
    MOV opcion,AL

; Primer numero
    LEA DX,msg1
    MOV AH,09H
    INT 21H

    MOV AH,01H
    INT 21H
    SUB AL,30H
    MOV num1,AL

; Segundo numero
    LEA DX,msg2
    MOV AH,09H
    INT 21H

    MOV AH,01H
    INT 21H
    SUB AL,30H
    MOV num2,AL

; Mostrar texto resultado
    LEA DX,resultado
    MOV AH,09H
    INT 21H

; Evaluar opcion
    MOV AL,opcion

    CMP AL,'1'
    JE SUMA

    CMP AL,'2'
    JE RESTA

    CMP AL,'3'
    JE MULTI

    CMP AL,'4'
    JE DIVI

SUMA:
    MOV AL,num1
    ADD AL,num2
    JMP MOSTRAR

RESTA:
    MOV AL,num1
    SUB AL,num2
    JMP MOSTRAR

MULTI:
    MOV AL,num1
    MUL num2
    JMP MOSTRAR

DIVI:
    MOV AL,num1
    MOV AH,0
    DIV num2

MOSTRAR:
    ADD AL,30H
    MOV DL,AL
    MOV AH,02H
    INT 21H

; Finalizar
    MOV AH,4CH
    INT 21H

MAIN ENDP
END MAIN