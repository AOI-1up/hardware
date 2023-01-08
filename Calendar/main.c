#include <stdio.h>
#include <stdlib.h>

extern int zellar(int, int, int);
extern int monthlen(int, int);

char *month[] = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
char *week[] = {"Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"};

int main(int argc, char *argv[])
{
    /* 変数群を宣言 */
    int i = 0;
    int x = 0;
    int m = atoi(argv[1]); // コマンドライン引数から月へ代入
    int y = atoi(argv[2]); // 年を代入

    /* 月初めの曜日を算出 */
    int k = zellar(y, m, 1);

    /* 月の長さを算出 */
    int n = monthlen(y, m);

    /* 月と年を表示 */
    printf("   %s %d\n", month[m - 1], y);

    /* 曜日を表示 */
    for (i = 0; i < 7; i++)
        printf("%s ", week[i]);
    printf("\n");

    /* カレンダーを表示 */
    for (i = 0; i < k; i++) // 曜日分の空白を表示
    {
        printf("   ");
        x++;
    }
    for (i = 1; i <= n; i++) // 日付を表示
    {
        printf("%2d ", i);
        x++;
        if (x >= 7)
        {
            printf("\n");
            x = 0;
        }
    }
    printf("\n");

    return 0;
}