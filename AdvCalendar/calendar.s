    .text
    .global calendar
    .type   calendar, %function
calendar:
    /* 使用するレジスタを退避 */
    push    {r4, r5, r6, lr}
    mov     r4, r0  @ year
    mov     r5, r1  @ month
    mov     r6, r2  @ dayArray

    /* 日付と曜日を出力 */
    bl      date
    bl      wday

    /* ツェラー計算 */
    mov     r2, #1  @ day
    bl      zellar  @ 月初めの曜日を計算
    mov     r7, r0  @ 計算結果を格納

    /* 月の長さ計算 */
    mov     r0, r4      @ year
    bl      monthlen    @ 月の長さを計算
    mov     r8, r0      @ 計算結果を格納

    /* カレンダーを出力 */
    str     r8, r1


    /* 使用したレジスタを復帰 */
    pop     {r4, r5, r6, lr}
    bx      lr
