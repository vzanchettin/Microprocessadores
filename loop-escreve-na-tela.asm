

mov si, mensagem

volta:
    
    ; compara se já for 0 no inicio
    cmp al, 0
    jz fim
    
    mov al, [si]
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
       
      