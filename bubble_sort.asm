.model small
.stack 100
.data

a db 1h,4h,3h,2h,6h,9h,10h,?
;b db 7 dup(?)

;a db 5
;b db 7

.code
mov ax,@data
mov ds,ax

swap MACRO one two
    mov bl,one
    mov bh,two
    mov one,bh
    mov two,bl
    mov bh,00H
    mov bl,00H
endm
          
      
mov cl,7h
mov ch,6h
mov di,0h


sort:
mov bl,a[di]
mov bh,a[di+1]
cmp bl,bh
jle swapit
dec cl
inc di  
mov bh,00H
mov bl,00H
cmp cl,0h
jnz sort
jz inter


swapit:swap a[di] a[di+1]
       dec cl
       inc di
       cmp cl,0h
       jnz sort
       jz inter
       
inter:
cmp ch,0h
jz exit
jnz int2

int2:
dec ch
mov cl,ch
mov di,0h
jmp sort


exit: