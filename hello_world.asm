.8086
.model small
.stack 100
.data

msg1 db "hello world",'$'

.code
mov ax,@data
mov ds,ax

lea dx,msg1
mov ah,09H
int 21h

