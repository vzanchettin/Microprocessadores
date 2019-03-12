; Escreva um programa que leia os caracteres 
; digitados no teclado e os exiba o video      

init:
    mov ah, 0 ;espera entrada do usuario
    int 16h ;chama interrupcao do teclado

    mov ah, 0EH ;exibe a tecla digitada na tela
    int 10h

    cmp al, '0' ;se for 0 para o programa

    je end: ;se nao for continua

next: 
    cmp al, 0DH ;se for enter pula linha
    jne init: ;se nao volta ao inicio
    mov ah, 02h ;codigo para mover cursor 
    inc dh ;pula a linha 
    int 10h
    jne init:
end:
    jmp $