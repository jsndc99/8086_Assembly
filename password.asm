.model small
.stack 100
.data

pass db "password",'$'
input db ?
msgr db "password match",'$'
msgn db "wrong",'$'  
count db 00  
  
.code

mov ax,@data
mov ds,ax

mov ah,01h
lea si,input
mov cl,08h    
    
    
read:int 21h
cmp al,0dh
je continue
mov [si],al
inc si
inc count
jmp read

;now input has inputted string
           
continue:           
mov ax,'$'        
lea si,pass
lea di,input
cmp cl,count
jnz false         


mov cx,7h         
compare:
mov bh,[si]
mov bl,[di]
cmp bh,bl
jne outside
inc si
inc di
dec cx
cmp cx,00h
jz outside
jnz compare


outside:
cmp cx,00h
jz true
jnz false

true:
lea dx,msgr
mov ah,09h
int 21h  
jmp exit

false:
lea dx,msgn
mov ah,09h
int 21h
jmp exit

exit:
