.8086
.model small
.stack 100
.data

a db 2h,2h,2h,2h

.code
mov ax,@data
mov ds,ax
       
mov cx,4h
mov di,0h

mov bh,0h
mov bh,a[di]
       
sum:mov bl,a[di+1]
add bh,a[di+1]
inc di
dec cx
cmp cx,00h
jz exit
jnz sum
  

    
exit: 
mov al,0h

mov al,bh
mov bl,4h
div bl