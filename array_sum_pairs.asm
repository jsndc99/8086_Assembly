;Code to sum elements of array
.model small
.stack 100
.data

a db 1,2,3,4,5,6,7,8,9,10
b db 10 dup(?)

.code

mov ax,@data
mov ds,ax

mov al,0
mov di,0
mov cx,10

sum:mov al,a[di]
add al,a[di+1]
mov b[di],al
inc di
dec cx
cmp cx,0
jnz sum
jz exit

exit: 






