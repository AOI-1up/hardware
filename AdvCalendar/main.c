#include <stdio.h>
#include <stdlib.h>

extern void calendar(int, int, char *);

int main(int argc, char **argv)
{
    int month, year;
    char day[BUFSIZ];

    switch (argc)
    {
    case 2:
        printf("Sorry, this feature has not yet been implemented.\n");
        break;
    case 3:
        month = atoi(argv[1]);
        year = atoi(argv[2]);
        calendar(year, month, day);
        break;
    default:
        printf("Usage: ./cal [month] year\n");
    }

    return 0;
}