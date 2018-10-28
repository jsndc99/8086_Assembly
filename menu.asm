.8086
.model small
.stack 100
.data

a dw 10
b dw 5
ms db "input here $"

.code
start:
mov ax,@data
mov ds,ax
            
input_block:
lea dx,ms
mov ah,09H
int 21H

mov ah,01H
int 21H
cmp al,31H
jz addition
cmp al,32H
jz subtraction
cmp al,33H
jz multiplication
cmp al,34H
jz division
            
addition: 
mov ax,00H
mov ax,a
add ax,b         
jmp done

subtraction:
mov ax,00H
mov ax,a
sub ax,b        
jmp done

multiplication:
mov ax,00H
mov ax,a
mul b        
jmp done        
        
division:         
mov ax,00H
mov ax,a
div b            
jmp done        
        
done: int 3H
         
end start