.model small
.stack 100h

.data
vector db 'c','a','d','e','b'
tam equ 5

msg db 'Vector ordenado: $'

.code
main proc
    mov ax,@data
    mov ds,ax

    ; Bubble Sort
    mov cx,tam-1

outer:
    mov si,0
    mov bx,cx

inner:
    mov al,vector[si]
    mov dl,vector[si+1]

    cmp al,dl
    jbe siguiente

    ; intercambiar
    mov vector[si],dl
    mov vector[si+1],al

siguiente:
    inc si
    dec bx
    jnz inner

    loop outer

    ; imprimir mensaje
    mov ah,09h
    lea dx,msg
    int 21h

    ; imprimir vector ordenado
    mov cx,tam
    mov si,0

imprimir:
    mov dl,vector[si]
    mov ah,02h
    int 21h

    inc si
    loop imprimir

    ; salir
    mov ah,4Ch
    int 21h

main endp
end main