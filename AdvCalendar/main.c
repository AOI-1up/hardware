#include <stdio.h>
#include <stdlib.h>

// extern void calendar(int, int);
extern void test(int argc, char *argv[]);

int main(int argc, char *argv[])
{
    test(argc, argv);
    /*
    int month, year;

    switch (argc)
    {
    case 2:
        year = atoi(argv[1]);
        break;
    case 3:
        month = atoi(argv[1]);
        year = atoi(argv[2]);
        calendar(month, year);
        break;
    default:
        printf("Usage: ./cal [month] year\n");
    }
    */
    return 0;
}