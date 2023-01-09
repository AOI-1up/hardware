/*------------------------------------------*
* date : 日付をコマンドラインへ出力
*-------------------------------------------*/
#include <stdio.h>
#include <string.h>

void date(int month, int year)
{
    char *ar[] = {
        "January",
        "February",
        "March",
        "April",
        "May",
        "June",
        "July",
        "August",
        "September",
        "October",
        "November",
        "December"};
    printf("%s %d\n", ar[month - 1], year);

    return;
}


