.model small
.8086
.stack 100
.data
  
;al will have odd and cl will have even  
    
a db 1h,2h,3h,4h,5h,6h,7h,8h
       
checker db 2h       

.code
mov ax,@data
mov ds,ax

check MACRO num
    mov ah,00h
    mov al,num
    mov bh,checker
    div bh
    cmp ah,00h
    jz inceven
    jnz incodd
endm       
       
mov ch,7h
mov cl,0h
mov di,0h

OE:mov bh,a[di]
   check bh
   dec ch
   inc di
   cmp ch,00h
   jz exit
   jnz OE


inceven:inc cl
dec ch
inc di
cmp ch,00h
jz exit
jnz OE

incodd:
dec ch
inc di
cmp ch,00h
jz exit
jnz OE 


exit:mov al,7h
mov ah,cl
sub al,ah
