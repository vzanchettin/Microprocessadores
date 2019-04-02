#include <sys/io.h>

unsigned short *video = (unsigned short *)0xB8000; 

unsigned char key_map[150] = {
    0x00, 0x01, '1', '2', '3', '4', '5', '6'
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


    printc(1, 2, 0x01, 0x0F, 'F');
    prints(1, 1, 0x01, 0x0F, "Funciou!");

    int key = 0;

    while (1) {

        int key = inb(0x60);
        printc(1, 7, 0x01, 0x0F, key_map[key]);
    }

    return 0;
}
