#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void year(int r0, int r1)
{
    printf("%d, %s\n", r0, r1);

    int i = r1 - '0';
    printf("%d", i); // 1
    // time_t t = time(NULL);
    // struct tm *tm = localtime(&t);

    // printf("%d年%d月%d日\n", tm->tm_year + 1900, tm->tm_mon + 1, tm->tm_mday);
    return;
}