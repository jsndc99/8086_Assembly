.model small
.data

a db ?

.code
start:
        mov ax,@data
        mov ds,ax
        mov ah,01H
        lea si,a
        read:
                int 21H
                cmp al,0DH
                je outside
                mov [si],al
                inc si
                jmp read

outside:mov ax,"$"
        mov [si],al
        lea dx,a
        mov ah,09H
        int 21H
end start