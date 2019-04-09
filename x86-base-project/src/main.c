#include <sys/io.h>

unsigned short *video = (unsigned short *)0xB8000; 

unsigned posx = 0;
unsigned posy = 0;

unsigned int key = 0;
unsigned int key_anterior = 0;

unsigned char key_map[150] = {
    0x00, 0x01, '1',  '2',  '3',  '4',  '5',  '6',  '7',  '8',  '9',  '0',  '-',  '=', 'N/D',
    'N/D', 'q',  'w',  'e',  'r',  't',  'y',  'u',  'i',  'o',  'p',  '´',  '[',
    'N/D', 'N/D', 'a',  's',  'd',  'f',  'g',  'h',  'j',  'k',  'l',  'ç',  '~',  ']',
    'N/D', '\\',  'z',  'x',  'c',  'v',  'b',  'n',  'm',  ',',  '.',  ';',  'N/D'
};

int main(void)
{

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

    while (1) {

        int key = inb(0x60);
        //printc(1, 7, 0x01, 0x0F, key_map[key]);

        if (key != key_anterior ) {
            printc(posx, posy, 0x01, 0x0F, key_map[key]);
            posx++;
            key_anterior = key;
        }


    }

    return 0;
}
