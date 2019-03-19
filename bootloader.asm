; Implementar a logica do bootloader (primeiro estagio) para carregar
; o segundo estagio do bootloader armazenado no disco para a memoria e
; executa-lo. O segundo setor deve ser carregado no endereco 0x8000 da
; memoria RAM.

; TODO: Logica do bootloader.

bits 16                         ; We're working at 16-bit mode here
org 0x7C00                      ; BIOS loads our programm at this address
cli

mov ax, 0x800
mov es, ax
xor bx, bx

mov ah, 0x02
mov al, 1 ; Numero de setores para ler
mov ch, 0 ; Numero do cilindro
mov cl, 2 ; Numero do setor
mov dh, 0 ; Numero da cabeça
mov dl, 0x80 ; Numero do drive
int     0x13

cli

; Salta para o endereco 0x8000 e executa o programa.
jmp 0x800:0

times 510 - ($ - $$) db 0
dw 0xAA55

; =============================
; Segundo estagio do bootloader
; =============================
stage2:
    mov ah, 0x0E
    mov al, 'A'
    mov bl, 0x0F
    mov bh, 0x0
    int 0x10

    jmp $

times 1024 - ($ - $$) db 0
