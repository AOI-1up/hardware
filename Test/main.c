#include <stdio.h>
#include <stdlib.h>

extern void test(char *);

int main()
{
    int r;
    char day[BUFSIZ];

    test(day);

    return 0;
}