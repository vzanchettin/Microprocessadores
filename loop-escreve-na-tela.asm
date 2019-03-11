;posiciona na tela

mov DH, 10
mov DL, 30
mov BH, 0
mov AH, 2
int 10h


; escreve na tela
mov si, mensagem

volta:
    
    mov al, [si]
    
    ; compara se já for 0 no inicio
    cmp al, 0
    jz fim
    

    mov ah, 0Eh
    int 10h
    
    inc si
    mov al, [si]  

    ; compara se e 0, caso nao, volta para o laco    
    cmp al, 0
    jnz volta
    
     
fim:
    jmp $ ; salta para a linha atual = while(1), fica em loop, seu quiser para, usa-se hlt


mensagem:
    db "teste mensagem", 0
       
      