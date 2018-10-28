.model small
.stack 100
.data

a db "malayalan",'$'
c db "malayalan",'$'
b db 9 dup(?)

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

mov cx,9h
mov di,0h
mov si,8h

reverse:
swap a[di] b[si]
inc di
dec cx
dec si
cmp cx,00h
jnz reverse
           
mov cx,00h
lea di,b
lea si,c        
        
mov cx,8h

         
     
check:mov bl,[si]
mov bh,[di]
inc si
inc di
dec cx
cmp cx,00h
jz outside
cmp bl,bh
je check
cmp cx,00h
jz outside



outside:cmp cx,0h
jz yes
jnz no



yes:mov bl,9h

no: