; DESENVOLVA UM VETOR QUE ORDENE UM VETOR UTILIZANDO O ALGORITMO
; BUBBLE SORT.
; O ALGORITMO DEVE RECEBER O TAMANHO DO VETOR NO REGISTRADOR
; AL E APONTAR PARA O INICIO DO VETOR NO REGISTRO DI.


MOV SI, vetor
MOV AH, [SI]
MOV AL, [SI + 1]

 
 
 
 
 
 
 
 
 
 
JMP $
vetor
    DB 3, 2, 8, 4, 9, 5, 1, 2 
 
 
 
 
 
 
 
 
 
 

;Bubble sort 10 numbers in place

;.model tiny
;.data
;nums  db 3,7,9,1,8,2,4,5,3,6,10
;count equ 9                         ; One less than count of the array.

;.code
;.startup
;    mov dx, count
;    oloop:
;        mov cx, count
;        lea si, nums
;
;        iloop:
;            mov al, [si]                 ; Because compare can't have both memory
;            cmp al, [si+1]
;            jl common                      ; if al is less than [si+1] Skip the below two lines for swapping.
;            xchg al, [si+1]
;            mov [si], al                    ; Coz we can't use two memory locations in xchg directly.
;
;            common:
;                INC si
;                loop iloop
;
;        dec dx
;        jnz oloop
;
;.exit
;end

;VETOR QUE SOMA OS SEUS VALORES

;MOV AX, 5
;MOV BX, 2
;ADD AX, BX

MOV SI, vetor   ; aponta o SI (SOURCE INDEX) para a primeira posicao do vetor

;MOV CL, [SI]    ; PEGAR CONTEUFDO DA POSICAO EM C SERIA INT C = *P;


MOV CX, 0
ADD CX, SI

INC SI
ADD CX, SI

INC SI
ADD CX, SI

INC SI
ADD CX, SI

JMP $
vetor:
  DB 2, 2, 2, 2





; EXEMPLO DE MULTIPLICACAO
;MOV AH, 0
;MOV AL, 2H

;MOV BL, 4H
;MUL BL    
    
;MOV BX, 0 
;MOV BL, AL
;MUL BL, AH
;MOV AX, BX



;EXEMPLO WHILE
; JNZ - SALTA SE NAO FOR 0
;MOV AX, 0
;MOV BX, 5

;LOOP:
;  INC AX
;  DEC BX
;  JNZ LOOP







; MOVE O VALOR 6 EM AX  23H(O H SIGNIFICA QUE E EM EXA
;MOV AX, 256       
;MOV BX, 23H

;MOV CH, 12H
;MOV CL, 55H

;MOV AX, 1h
;MOV BX, 1h
;ADD AX, BX  ; SOMA AX + BX E COLOCA EM AX   

;MOV AX, 0
;INC AX    ;PARA INCREMENTAR AX + 1 
;INC AX
;INC AX
;INC AX
;INC AX
;INC AX


; WHILE
;MOV AX, 0
      
;VOLTA:      
;  INC AX
;  JMP VOLTA ; SIMULA O GOTO
  
  
;MOV AH, 5h
;MOV AL, 5h

;MOV BX, 0
;MOV BL, AL
;ADD BL, AH

;MOV AX, BX
 


