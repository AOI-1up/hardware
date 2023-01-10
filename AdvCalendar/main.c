#include <stdio.h>
#include <stdlib.h>

extern void calendar(int, int);

int main(int argc, char **argv)
{
    int month = atoi(argv[1]);
    int year = atoi(argv[2]);

    calendar(year, month);

    return 0;
}