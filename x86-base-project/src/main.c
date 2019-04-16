#include <sys/io.h>

unsigned short *video = (unsigned short *)0xB8000; 

unsigned posx = 0;
unsigned posy = 15;

unsigned int key = 0;
unsigned int key_anterior = 0;

unsigned int i;

// https://msdn.microsoft.com/pt-br/windows/desktop/ms890989
unsigned char key_map[150];

unsigned char key_map_temp[150] = {
    0x00, 0x01, '1',  '2',  '3',  '4',  '5',  '6',  '7',  '8',  '9',  '0',  '-',  '=', 'N/D',
    'N/D', 'q',  'w',  'e',  'r',  't',  'y',  'u',  'i',  'o',  'p',  '´',  '[',
    'N/D', 'N/D', 'a',  's',  'd',  'f',  'g',  'h',  'j',  'k',  'l',  'ç',  '~',  ']',
    'N/D', '\\',  'z',  'x',  'c',  'v',  'b',  'n',  'm',  ',',  '.',  ';',  'N/D'
};





int main(void)
{

    // zera o teclado
    for (i = 0; i <= 150; i++) {
        key_map[i] = -1;
    }

    key_map[0] = 0x00; key_map[1] = 0x01; key_map[2] = '1'; key_map[3] = '2'; key_map[4] = '3';



    void printc (int x, int y, int fcolor, int bcolor, int c) {

        video[x + y * 80] = (fcolor << 8) | (bcolor << 12) | c;
    }

    void prints (int x, int y, int fcolor, int bcolor, char *str) {

        int inicio = x + y * 80;

        while (*str) {

            video[inicio] = (fcolor << 8) | (bcolor << 12) | *str;

            inicio++;
            str++;
        }
    }

    void tela() {
        
        int line;

        for (line = 0; line <= 60; line++) {
            printc(line, 14, 0x01, 0x0F, '-');
        }
    }

    while (1) {

        tela();
        int key = inb(0x60);

        if (key != -1) {
            key = key_map[key];
        }

        if (key != key_anterior) {
            printc(posx, posy, 0x01, 0x0F, key);
            posx++;
            key_anterior = key;
        }


    }

    return 0;
}
